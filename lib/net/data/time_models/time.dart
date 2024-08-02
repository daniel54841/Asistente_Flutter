import 'hourly.dart';

class Time{
  String timezone;
  int elevation;
  List<Hourly> hourly;

  Time({required this.timezone, required this.elevation, required this.hourly});


  Map<String, dynamic> toJson() {
    return {
      'timezone': timezone,
      'elevation': elevation,
      'hourly': hourly.map((hourly) => hourly.toJson()).toList(),
    };
  }

  Time fromJson(Map<String, dynamic> json) {
    return Time(
      timezone: json['timezone'],
      elevation: json['elevation'],
      hourly: json['hourly']?.map((hourlyJson) => hourlyJson.fromJson(hourlyJson)).toList(),
    );
  }





}

