class TimeUnit{
  String? value;

  TimeUnit({required this.value,});


  Map<String, dynamic> toJson() {
    return {
      'value': value,

    };
  }

  TimeUnit fromJson(Map<String, dynamic> json) {
    return TimeUnit(
      value: json['value'],
    );
  }

}