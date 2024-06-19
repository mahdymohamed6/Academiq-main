class Name {
  String? first;
  String? last;

  Name({this.first, this.last});

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        first: json['first'] as String?,
        last: json['last'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'first': first,
        'last': last,
      };
}
