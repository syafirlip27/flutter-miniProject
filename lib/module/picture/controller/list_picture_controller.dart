import 'package:get/get.dart';
import '../service/picture/picture_service.dart';

class ListPictureController extends GetxController {
  final PictureService _pictureService = PictureService();
  var pictures = [].obs; // Observable list for state management
  var isLoading = true.obs;

  @override

  void onInit() {
    super.onInit();
    fetchPictures();
  }

  void fetchPictures() async {
    try {
      isLoading.value = true;
      final data = await _pictureService.fetchPictures();
      pictures.value = data;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
