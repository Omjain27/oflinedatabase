import 'package:flutter/material.dart';
import 'package:myproject/Oflinedatabse/SCreens/editstudent.dart';
import 'package:myproject/Oflinedatabse/Services.dart';
import 'package:myproject/Oflinedatabse/StudentModel.dart';

class MyDashboard extends StatefulWidget {
  const MyDashboard({super.key});

  @override
  State<MyDashboard> createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  List<StudentModel> studentlist = [];
  var studentmodel = StudentModel();
  var studentservice = studentService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getallRecordFRomStudent();
  }

  getallRecordFRomStudent() async {
    studentservice = studentService();
    var allstudent = await studentservice.readService("Student");
    allstudent.forEach((singleStudent) {
      setState(() {
        studentmodel = StudentModel();

        studentmodel.id = singleStudent["id"];
        studentmodel.name = singleStudent["name"];
        studentmodel.subject = singleStudent["subject"];
        studentmodel.marks = singleStudent["marks"];

        studentlist.add(studentmodel);
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: studentlist.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListTile(
              title: Text(
                "${studentlist[index].name}",
                style: TextStyle(color: Colors.black),
              ),
              subtitle: Text(
                "${studentlist[index].subject}",
                style: TextStyle(color: Colors.black),
              ),
              trailing: Wrap(children: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Myeditstudetnscreen(
                                studentModel: studentlist[index]),
                          ));
                    },
                    icon: Icon(Icons.edit)),
                IconButton(
                    onPressed: () async {
                      var studentModel = StudentModel();
                      var studentservice = studentService();

                      studentModel.id = studentlist[index].id;
                      var result = await studentservice.Deletservice(
                          "Student", studentModel);

                      studentlist = [];
                      getallRecordFRomStudent();
                    },
                    icon: Icon(Icons.delete))
              ]),
            ),
          );
        },
      ),
    );
  }
}
