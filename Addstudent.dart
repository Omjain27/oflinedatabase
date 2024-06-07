import 'package:flutter/material.dart';
import 'package:myproject/Oflinedatabse/Customeidgets/textfieldd.dart';
import 'package:myproject/Oflinedatabse/Dashboard.dart';
import 'package:myproject/Oflinedatabse/Services.dart';
import 'package:myproject/Oflinedatabse/StudentModel.dart';

class Myaddstudetnscreen extends StatefulWidget {
  const Myaddstudetnscreen({super.key});

  @override
  State<Myaddstudetnscreen> createState() => _MyaddstudetnscreenState();
}

class _MyaddstudetnscreenState extends State<Myaddstudetnscreen> {
  TextEditingController _Namecontroller = TextEditingController();
  TextEditingController _subjectcontroller = TextEditingController();
  TextEditingController _Markscontroller = TextEditingController();

 



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ofline data base")),
      body: Column(
        children: [
          MyTextField(
            controller: _Namecontroller,
            hint: "Enter name",
            label: "Name",
          ),
          MyTextField(
            controller: _subjectcontroller,
            hint: "Enter subject",
            label: "Subject",
          ),
          MyTextField(
            controller: _Markscontroller,
            hint: "enter marks",
            label: "Marks",
          ),
          ElevatedButton(
              onPressed: () async {
                var studentModel = StudentModel();
                var _studetservice = studentService();

                studentModel.name = _Namecontroller.text.toString();
                studentModel.subject = _subjectcontroller.text.toString();
                studentModel.marks = _Markscontroller.text.toString();

                var result =
                    await _studetservice.insertService("Student", studentModel);
                print("result = $result");
                setState(() {
                  _Namecontroller.clear();
                  _subjectcontroller.clear();
                  _Markscontroller.clear();
                });
              },
              child: Text("Save"))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyDashboard(),
              ));
        },
      ),
    );
  }
}
