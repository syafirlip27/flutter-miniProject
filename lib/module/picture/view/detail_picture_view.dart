import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/detail_picture_controller.dart';

class DetailPictureView extends StatelessWidget {
  final DetailPictureController controller = Get.put(DetailPictureController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Picture Detail')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        final detail = controller.pictureDetail.value;
        return detail.isEmpty
            ? Center(child: Text('No detail available'))
            : SingleChildScrollView(  // Wrap Column in SingleChildScrollView
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.network(detail['download_url']),
                    SizedBox(height: 10),
                    Text('token by: ${detail['author']}', style: TextStyle(fontSize: 18)),
                  ],
                ),
              );
      }),
    );
  }
}
