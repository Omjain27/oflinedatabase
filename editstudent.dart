import 'package:flutter/material.dart';
import 'package:myproject/Oflinedatabse/Customeidgets/textfieldd.dart';
import 'package:myproject/Oflinedatabse/Dashboard.dart';
import 'package:myproject/Oflinedatabse/Services.dart';
import 'package:myproject/Oflinedatabse/StudentModel.dart';

class Myeditstudetnscreen extends StatefulWidget {
  StudentModel studentModel;

  Myeditstudetnscreen({super.key, required this.studentModel});

  @override
  State<Myeditstudetnscreen> createState() => _MyeditstudetnscreenState();
}

class _MyeditstudetnscreenState extends State<Myeditstudetnscreen> {
  TextEditingController _Namecontroller = TextEditingController();
  TextEditingController _subjectcontroller = TextEditingController();
  TextEditingController _Markscontroller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _Namecontroller.text = widget.studentModel.name!;
      _subjectcontroller.text = widget.studentModel.subject!;
      _Markscontroller.text = widget.studentModel.marks!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("edit")),
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
                
                studentModel.id = widget.studentModel.id;
                studentModel.name = _Namecontroller.text.toString();
                studentModel.subject = _subjectcontroller.text.toString();
                studentModel.marks = _Markscontroller.text.toString();

                var result =
                    await _studetservice.updateService("Student", studentModel);
                print("result = $result");
                setState(() {
                  _Namecontroller.clear();
                  _subjectcontroller.clear();
                  _Markscontroller.clear();
                });
              },
              child: Text("Update"))
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
