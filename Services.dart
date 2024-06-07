import 'package:myproject/Oflinedatabse/StudentModel.dart';
import 'package:myproject/Oflinedatabse/repository.dart';

class studentService {
  late Repository _Repository;

  studentService() {
    _Repository = Repository();
  }

  insertService(table, StudentModel studentmodel) async {
    return await _Repository.insertREcord(table, studentmodel.studentMap());
  }

  readService(table) async {
    return await _Repository.FetchRecord(table);
  }

  updateService(table, StudentModel studentmodel) async {
    return await _Repository.UpdateRecord(table,  studentmodel.studentMap());
  }
   Deletservice(table, StudentModel studentmodel) async {
    return await _Repository.deletRecord(table,  studentmodel.studentMap());
  }
}
