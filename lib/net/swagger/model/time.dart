part of swagger.api;

class Time {
  
  Time();

  @override
  String toString() {
    return 'Time[]';
  }

  Time.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
  }

  Map<String, dynamic> toJson() {
    return {
     };
  }

  static List<Time> listFromJson(List<dynamic> json) {
    return json == null ? new List<Time>() : json.map((value) => new Time.fromJson(value)).toList();
  }

  static Map<String, Time> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, Time>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new Time.fromJson(value));
    }
    return map;
  }
}
