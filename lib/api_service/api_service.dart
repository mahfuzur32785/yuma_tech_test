import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:yuma_tech_test/model/data_model.dart';
import 'package:http/http.dart' as http;

class ApiService{

  final dio = Dio();

  Future<List<DataModel>?> getDataList() async {

    var token = "AUO2qItnFQfFKtQ3NJhnvmUv18Hy70BBTEVe5Wuh";
    var url = 'https://admin.cashsmarts.co.uk/api/providers/list';
    final headers = {'Accept': 'application/json','Content-Type': 'application/json','Authorization': 'Bearer $token'};

    final response = await dio.get(url,options: Options(headers: headers));
    // var response = await http.get(Uri.parse(url),headers: headers);
    print('resopnse ${response.data}');

    if (response.statusCode == 200) {
      var data = response.data;
      print('Data are $data');
      return List<dynamic>.from(data["data"]).map((e) => DataModel.fromMap(e)).toList();
      // return DataModel.fromMap(data);
    }

    return null;
  }

  Future<Response>signIn(Map<String, String> body) async {
    var uri = "https://admin.cashsmarts.co.uk/api/consumer/login";

    Response response = await dio.post(uri, data: body);

    return response;
  }

}