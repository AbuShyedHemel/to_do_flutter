import 'package:get/get.dart';
import 'package:local_push_notification/db/db_helper.dart';
import 'package:local_push_notification/model/task.dart';

class TaskController extends GetxController{
  @override
  void onReady(){
    super.onReady();
  }

  Future<int?> addTask({Task? task})async{
    return await DBHelper.inser(task);
  }
}