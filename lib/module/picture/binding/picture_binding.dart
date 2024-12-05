import 'package:get/get.dart';
import '../controller/detail_picture_controller.dart';
import '../controller/list_picture_controller.dart';

class PictureBinding extends Bindings {
  @override
  void dependencies() {
    // Lazily put the controllers for both ListPictureView and DetailPictureView
    Get.lazyPut(() => ListPictureController());
    Get.lazyPut(() => DetailPictureController());
  }
}
