import 'package:flutter/cupertino.dart';

import 'hourly.dart';
import 'hourly_unit.dart';

class Time{
  String timezone;
  double elevation;
  HourlyUnit hourlyUnits;
  Hourly hourly;

  Time({required this.timezone, required this.elevation, required this.hourlyUnits, required this.hourly});

  factory Time.fromJson(Map<String, dynamic> json) {
    return Time(
      timezone: json['timezone'],
      elevation: json['elevation'],
      hourlyUnits: HourlyUnit.fromJson(json['hourly_units']),
      hourly: Hourly.fromJson(json['hourly']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'timezone': timezone,
      'elevation': elevation,
      'hourly_units': hourlyUnits.toJson(),
      'hourly': hourly.toJson(),
    };
  }





}

