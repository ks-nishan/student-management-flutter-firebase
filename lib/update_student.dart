import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:student_management/home_page.dart';
import './student.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class UpdateStudent extends StatelessWidget {
  final Student student;
  final TextEditingController rollController = TextEditingController();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController marksController = TextEditingController();

  final FocusNode focusNode = FocusNode();

  UpdateStudent({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    rollController.text = '${student.rollno}';
    nameController.text = student.name;
    marksController.text = '${student.marks}';
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Student"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            getMyField(
                focusNode: focusNode,
                hintText: "Rool Number",
                textInputType: TextInputType.number,
                controller: rollController),
            getMyField(hintText: "Name", controller: nameController),
            getMyField(
                hintText: "Marks",
                textInputType: TextInputType.number,
                controller: marksController),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      //
                      //Updating a student
                      Student updatetStudent = Student(
                          id: student.id,
                          rollno: int.parse(rollController.text),
                          name: nameController.text,
                          marks: double.parse(marksController.text));
                      //updating the firebase
                      final collectionReferance =
                          FirebaseFirestore.instance.collection('students');
                      collectionReferance
                          .doc(updatetStudent.id)
                          .update(updatetStudent.toJson())
                          .whenComplete(() {
                        print('student updated');
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      });
                    },
                    child: const Text("Update")),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey),
                    onPressed: () {
                      rollController.text = "";
                      nameController.text = "";
                      marksController.text = "";
                      focusNode.requestFocus();
                    },
                    child: const Text("Reset"))
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget getMyField(
      {required String hintText,
      TextInputType textInputType = TextInputType.name,
      required TextEditingController controller,
      FocusNode? focusNode}) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        focusNode: focusNode,
        controller: controller,
        keyboardType: textInputType,
        decoration: InputDecoration(
            hintText: "Enter $hintText",
            labelText: hintText,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)))),
      ),
    );
  }
}
