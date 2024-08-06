class Hourly{
  List<String> time;
  List<double> temperature2m;
  List<int> relativeHumidity2m;

  Hourly({required this.time, required this.temperature2m, required this.relativeHumidity2m});

  factory Hourly.fromJson(Map<String, dynamic> json) {
    return Hourly(
      time: json['time'].cast<String>(),
      temperature2m: json['temperature_2m'].cast<double>(),
      relativeHumidity2m: json['relative_humidity_2m'].cast<int>(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'temperature_2m': temperature2m,
      'relative_humidity_2m': relativeHumidity2m,
    };
  }


}