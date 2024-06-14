class Sender {
  String? model;

  Sender({this.model});

  factory Sender.fromJson(Map<String, dynamic> json) => Sender(
        model: json['model'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'model': model,
      };
}
