import 'dart:convert';

import 'package:cvhub/infrastructure/api_service.dart';
import 'package:cvhub/model/cv_serializer.dart';

class CVRepository{

  static Future<CvSerializer> userData() async{
    final response = await ApiService.get();

    if(response is Map && response['code'] != 200){
      print("Error on calling data");

    }


    Map<String,dynamic> userResponse = await jsonDecode(response);


    return CvSerializer.fromJson(userResponse);

  }

}