part of swagger.api;

class Forecast {
  
  int latitude = null;

  int longitud = null;

  String timezone = null;

  List<Hourlys> hourly = [];

  Forecast();

  @override
  String toString() {
    return 'Forecast[latitude=$latitude, longitud=$longitud, timezone=$timezone, hourly=$hourly, ]';
  }

  Forecast.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    latitude = json['latitude'];
    longitud = json['longitud'];
    timezone = json['timezone'];
    hourly = Hourlys.listFromJson(json['hourly']);
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitud': longitud,
      'timezone': timezone,
      'hourly': hourly
     };
  }

  static List<Forecast> listFromJson(List<dynamic> json) {
    return json == null ? new List<Forecast>() : json.map((value) => new Forecast.fromJson(value)).toList();
  }

  static Map<String, Forecast> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, Forecast>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new Forecast.fromJson(value));
    }
    return map;
  }
}
