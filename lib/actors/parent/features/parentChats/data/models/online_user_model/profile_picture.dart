class ProfilePicture {
  String? color;

  ProfilePicture({this.color});

  factory ProfilePicture.fromJson(Map<String, dynamic> json) {
    return ProfilePicture(
      color: json['color'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'color': color,
      };
}
