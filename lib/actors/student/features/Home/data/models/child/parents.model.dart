class Parents {
  dynamic motherId;
  String? fatherId;

  Parents({this.motherId, this.fatherId});

  factory Parents.fromJson(Map<String, dynamic> json) => Parents(
        motherId: json['motherId'] as dynamic,
        fatherId: json['fatherId'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'motherId': motherId,
        'fatherId': fatherId,
      };
}
