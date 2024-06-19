class ProfilePicture {
  String? color;
  String? url;

  ProfilePicture({this.color, this.url});

  factory ProfilePicture.fromJson(Map<String, dynamic> json) {
    return ProfilePicture(
      color: json['color'] as String?,
      url: json['url'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'color': color,
        'url': url,
      };
}
