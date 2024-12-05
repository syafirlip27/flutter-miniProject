import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project/route/app_pages.dart'; // Import app_pages.dart, not app_routes.dart
import '../controller/list_picture_controller.dart';

class ListPictureView extends StatelessWidget {
  final ListPictureController controller = Get.find<ListPictureController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List of Pictures')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        return SingleChildScrollView(  // Wrap ListView in SingleChildScrollView
          child: Column(
            children: List.generate(controller.pictures.length, (index) {
              final picture = controller.pictures[index];
              return GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.DETAIL, arguments: picture['id']);
                },
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        picture['download_url'],
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          picture['author'] ?? 'Unknown author',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        );
      }),
    );
  }
}
