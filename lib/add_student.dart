import 'dart:math';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:student_management/home_page.dart';
import 'package:student_management/student.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({super.key});

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  final TextEditingController rollController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController marksController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Student"),
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
                      Student student = Student(
                          rollno: int.parse(rollController.text),
                          name: nameController.text,
                          marks: double.parse(marksController.text));
                      AwesomeDialog(
                          context: context,
                          dialogType: DialogType.success,
                          animType: AnimType.topSlide,
                          showCloseIcon: true,
                          title: "Success!!!",
                          desc: "Student added to the database!",
                          btnOkOnPress: () {
                            addStudentAndNavigateToHome(student, context);
                          }).show();
                      //
                      //adding a student
                    },
                    child: const Text("Add")),
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

  void addStudentAndNavigateToHome(Student student, BuildContext context) {
    final studentRef = FirebaseFirestore.instance.collection('students').doc();
    student.id = studentRef.id;
    final data = student.toJson();
    studentRef.set(data).whenComplete(() {
      //
      print("Inserted Successful");
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ));
      //
    });
  }
}
