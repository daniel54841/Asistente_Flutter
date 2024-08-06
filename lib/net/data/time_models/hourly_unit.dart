class HourlyUnit{
  String timeUnit;
  String temperature2mUnit;
  String relativeHumidity2mUnit;

  HourlyUnit({required this.timeUnit, required this.temperature2mUnit, required this.relativeHumidity2mUnit});

  factory HourlyUnit.fromJson(Map<String, dynamic> json) {
    return HourlyUnit(
      timeUnit: json['time'],
      temperature2mUnit: json['temperature_2m'],
      relativeHumidity2mUnit: json['relative_humidity_2m'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': timeUnit,
      'temperature_2m': temperature2mUnit,
      'relative_humidity_2m': relativeHumidity2mUnit,
    };
  }
}