import 'package:get/get.dart';
import '../module/picture/view/detail_picture_view.dart';
import '../module/picture/view/list_picture_view.dart';
import '../module/picture/binding/picture_binding.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.PHOTOS,
      page: () => ListPictureView(),
      binding: PictureBinding(),
    ),
    GetPage(
      name: Routes.DETAIL,
      page: () => DetailPictureView(),
      binding: PictureBinding(),
    ),
  ];
}
