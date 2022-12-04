import 'package:breaking_bad/controllers/load_characters_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CharactersDetailsPage extends StatefulWidget {
  const CharactersDetailsPage({Key? key}) : super(key: key);

  @override
  State<CharactersDetailsPage> createState() => _CharactersDetailsPageState();
}

class _CharactersDetailsPageState extends State<CharactersDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final controller=Get.find<LoadCharactersController>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: Column(
        children: [
          Container(width: Get.width,height: 400,child: Image.network("${controller.singleCharacterDetail.value?.img}",fit: BoxFit.cover,))
        ],
      ),
    );
  }
}
