import 'dart:convert';

import 'package:http/http.dart' as http;

import '../data/time_models/Time.dart';

class TimeApi{

  static Future<Time?> getTime(String latitude,String longitude) async {
    var request = http.Request('GET',
        Uri.parse('https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&current=temperature_2m&hourly=temperature_2m,relative_humidity_2m')
      ,);


    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      Map<String, dynamic> jsonData = jsonDecode(responseBody);
      Time time = Time.fromJson(jsonData);
      return time;
    }
    else {
      print(response.reasonPhrase);
    }

    return null;
  }





}