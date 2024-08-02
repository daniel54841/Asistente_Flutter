class Temperature2m{
  int? value;
  Temperature2m({required this.value,});


  Map<String, dynamic> toJson() {
    return {
      'value': value,

    };
  }

  Temperature2m fromJson(Map<String, dynamic> json) {
    return Temperature2m(
      value: json['value'],
    );
  }
}