part of swagger.api;

class Hourlys {
  
  List<Time> time = [];

  List<Temprature2m> hourly = [];

  Hourlys();

  @override
  String toString() {
    return 'Hourlys[time=$time, hourly=$hourly, ]';
  }

  Hourlys.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    time = Time.listFromJson(json['time']);
    hourly = Temprature2m.listFromJson(json['hourly']);
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'hourly': hourly
     };
  }

  static List<Hourlys> listFromJson(List<dynamic> json) {
    return json == null ? new List<Hourlys>() : json.map((value) => new Hourlys.fromJson(value)).toList();
  }

  static Map<String, Hourlys> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, Hourlys>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new Hourlys.fromJson(value));
    }
    return map;
  }
}
