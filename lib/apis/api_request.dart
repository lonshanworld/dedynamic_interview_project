import 'dart:convert';

import 'package:dedynamicinterviewprojectbylonshan/constants/txt_constants.dart';
import "package:http/http.dart" as http;

class ApiRequest{
  Future<dynamic> getApiRequest(String api)async{
    String uri = "${TxtConstants.apiString}$api";

    try{
      http.Response response = await http.get(Uri.parse(uri));
      if(response.statusCode != 200){
        return null;
      }else{
        var rawData = json.decode(response.body);
        print(rawData);
        if(rawData["status"] != "success") return null;
        return rawData["data"];
      }
    }catch(err){
      print(err);
      return null;
    }
  }
}