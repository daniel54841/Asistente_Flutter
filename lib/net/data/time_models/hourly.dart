import 'package:reproductor_ia/net/data/time_models/relative_humidity.dart';
import 'package:reproductor_ia/net/data/time_models/temperature2m.dart';
import 'package:reproductor_ia/net/data/time_models/timeunit.dart';

class Hourly{
  List<TimeUnit>? time;
  List<Temperature2m>? temperature;
  List<RelativeHumidity>? humidity;

  Hourly({required this.time, required this.temperature, required this.humidity});

  Hourly fromJson(Map<String, dynamic> json) {
    return Hourly(
      time:  json['time']?.map((timeunit) => timeunit.fromJson(timeunit)).toList(),
      temperature: json['temperature_2m']?.map((temperature) => temperature.fromJson(temperature)).toList(),
      humidity:  json['relative_humidity_2m']?.map((humidity) => humidity.fromJson(humidity)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time?.map((timeUnit) {
        timeUnit.toJson();
      },).toList(),
      'temperature_2m': temperature?.map((temperature) {
        temperature.toJson();
      }),
      'relative_humidity_2m': humidity?.map((humidity) {
        humidity.toJson();
      }),
    };
  }


}