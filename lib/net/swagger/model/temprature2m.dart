part of swagger.api;

class Temprature2m {
  
  Temprature2m();

  @override
  String toString() {
    return 'Temprature2m[]';
  }

  Temprature2m.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
  }

  Map<String, dynamic> toJson() {
    return {
     };
  }

  static List<Temprature2m> listFromJson(List<dynamic> json) {
    return json == null ? new List<Temprature2m>() : json.map((value) => new Temprature2m.fromJson(value)).toList();
  }

  static Map<String, Temprature2m> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, Temprature2m>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new Temprature2m.fromJson(value));
    }
    return map;
  }
}
