import 'package:equatable/equatable.dart';

class Material extends Equatable {
  final String? title;
  final String? type;
  final String? name;
  final DateTime? uploadDate;
  final List<dynamic>? tags;
  final String? id;

  const Material({
    this.title,
    this.type,
    this.name,
    this.uploadDate,
    this.tags,
    this.id,
  });

  factory Material.fromJson(Map<String, dynamic> json) => Material(
        title: json['title'] as String?,
        type: json['type'] as String?,
        name: json['name'] as String?,
        uploadDate: json['uploadDate'] == null
            ? null
            : DateTime.parse(json['uploadDate'] as String),
        tags: json['tags'] as List<dynamic>?,
        id: json['_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'type': type,
        'name': name,
        'uploadDate': uploadDate?.toIso8601String(),
        'tags': tags,
        '_id': id,
      };

  @override
  List<Object?> get props => [title, type, name, uploadDate, tags, id];
}
