import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:student_management/add_student.dart';
import 'package:student_management/student.dart';
import 'package:student_management/update_student.dart';

class HomePage extends StatelessWidget {
  final CollectionReference _referance =
      FirebaseFirestore.instance.collection('students');

  List<Student> students = [
    Student(id: "id1", rollno: 1425, name: "Nishanthan", marks: 98),
    Student(id: "id2", rollno: 7856, name: "Mathyvathana", marks: 34),
    Student(id: "id3", rollno: 4325, name: "Thusara", marks: 55)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Management"),
        centerTitle: true,
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: _referance.get(),
        builder: (context, snapshot) {
          //check for error
          if (snapshot.hasError) {
            return const Center(
              child: Text("Somthing went wrong."),
            );
          }
          //if data resived
          if (snapshot.hasData) {
            QuerySnapshot querySnapshot = snapshot.data!;
            List<QueryDocumentSnapshot> documents = querySnapshot.docs;
            //convert to list
            List<Student> students = documents
                .map((e) => Student(
                    id: e['id'],
                    rollno: e['rollno'],
                    name: e['name'],
                    marks: e['marks']))
                .toList();
            return _getBody(students);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
        // child: _getBody()
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddStudent()));
        }),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _getBody(students) {
    return students.isEmpty
        ? const Center(
            child: Text(
              "No Students Yet!!!\n Click + icon to start Adding",
              textAlign: TextAlign.center,
            ),
          )
        : ListView.builder(
            itemCount: students.length,
            itemBuilder: (context, index) => Card(
                  color: students[index].marks < 35
                      ? Colors.red.shade200
                      : students[index].marks < 65
                          ? Colors.yellow.shade200
                          : Colors.green.shade200,
                  child: ListTile(
                    title: Text(students[index].name),
                    subtitle: Text("Roll No : ${students[index].rollno}"),
                    leading: CircleAvatar(
                      radius: 25,
                      child: Text('${students[index].marks}'),
                    ),
                    trailing: SizedBox(
                      width: 60,
                      child: Row(
                        children: [
                          InkWell(
                            child: Icon(
                              Icons.edit,
                              color: Colors.black.withOpacity(0.75),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UpdateStudent(
                                          student: students[index])));
                            },
                          ),
                          InkWell(
                            child: Icon(
                              Icons.delete,
                              color: Colors.red.withOpacity(0.75),
                            ),
                            onTap: () {
                              //
                              _referance.doc(students[index].id).delete();
                              //re load the page
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                              //popup message
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ));
  }
}
