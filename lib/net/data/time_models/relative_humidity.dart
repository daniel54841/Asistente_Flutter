class RelativeHumidity{
  int? value;
  RelativeHumidity({required this.value,});

  Map<String, dynamic> toJson() {
    return {
      'value': value,

    };
  }

  RelativeHumidity fromJson(Map<String, dynamic> json) {
    return RelativeHumidity(
      value: json['value'],
    );
  }
}