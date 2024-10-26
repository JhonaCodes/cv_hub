import 'dart:io';

import 'package:http/http.dart' as http;

class ApiService {

  static get()async{
    final url = Uri.parse("https://gist.githubusercontent.com/JhonaCodes/a29302ff003b0818f9a6d1585f0b4ea5/raw/d2919a341a638f8b2f6ba9a33eed6c2c20096cd5/example_user.json");
    return await http.get(url).then((response)async{
      if(response.statusCode == 200){
        return response.body;
      }else{
        return {
          "code": response.statusCode,
          "message": "Error on request"
        };
      }

    });
  }


}