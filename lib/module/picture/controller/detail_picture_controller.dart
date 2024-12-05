import 'package:get/get.dart';
import '../service/picture/picture_service.dart';

class DetailPictureController extends GetxController {
  final PictureService _pictureService = PictureService();
  var pictureDetail = {}.obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    final id = Get.arguments;
    fetchPictureDetail(id);
  }

  void fetchPictureDetail(String id) async {
    try {
      isLoading.value = true;
      final data = await _pictureService.fetchPictureDetail(id);
      pictureDetail.value = data;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
