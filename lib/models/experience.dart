import 'package:json_annotation/json_annotation.dart';

part 'experience.g.dart';

/// Experience synchronized with the Django REST Framework API.
@JsonSerializable(fieldRename: FieldRename.snake)
class Experience {
  const Experience({
    required this.title,
    required this.description,
    this.category = 'full-time',
    this.thumbnail,
    this.endedAt,
    this.startedAt,
    this.id,
  });

  factory Experience.fromJson(Map<String, dynamic> json) =>
      _$ExperienceFromJson(json);

  @JsonKey(includeToJson: false)
  final String? id;
  final String title;
  final String description;
  @JsonKey(defaultValue: 'full-time')
  final String category;
  final String? thumbnail;
  @JsonKey(includeToJson: false)
  final DateTime? startedAt;
  final DateTime? endedAt;

  bool get isOngoing => endedAt == null;

  Map<String, dynamic> toJson() => _$ExperienceToJson(this);
}
