import 'dart:io';

import 'package:http/http.dart' as http;

class ApiService {
  static get()async{
    final url = Uri.parse("https://gist.githubusercontent.com/JhonaCodes/a29302ff003b0818f9a6d1585f0b4ea5/raw/b74af45b7d4b22b1f79d24114feede9e2709c52f/example_user.json");
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

  static local()async{
    final file = File('json/json_cv.json');
    print(file.readAsStringSync());
  }
}