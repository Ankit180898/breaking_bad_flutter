import 'dart:convert';

import 'package:breaking_bad/model/allCharactersModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/character_details.dart';
import '../screens/characterDetailsPage.dart';
class LoadCharactersController extends GetxController {

  @override
  void onInit() {
    loadData();
    super.onInit();

  }
  var isDataLoadingCharacter=false.obs;
  var allCharactersList = <AllCharactersModel>[];
  var name,occupation,image;
  Future<void> loadData() async {
    var response = await http.get(
        Uri.parse("https://www.breakingbadapi.com/api/characters"));
    if (response.statusCode == 200) {
      var responseData=jsonDecode(response.body);
      allCharactersList=List.from(responseData).map((e) => AllCharactersModel.fromJson(e)).toList();
      isDataLoadingCharacter.value=true;
    } else {
      Get.snackbar("Warning", "Something went wrong!");

    }
      print(response.body);
    }
  Rx<AllCharactersModel?> singleCharacterDetail = Rx(null);
    Future<void> getSingleCharacterDetail(String id) async {
      singleCharacterDetail.value=null;
      var response=await http.get(
          Uri.parse("https://www.breakingbadapi.com/api/characters/$id"));
      if(response.statusCode==200){
        var responseData=jsonDecode(response.body);
        singleCharacterDetail.value=List.from(responseData).map((e) => AllCharactersModel.fromJson(e)).first;
        // image=singleCharacterDetail.value?.img;

      }
    }

  }