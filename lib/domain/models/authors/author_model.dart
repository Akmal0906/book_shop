import 'package:json_annotation/json_annotation.dart';

part 'author_model.g.dart';

@JsonSerializable(explicitToJson: true)
class AuthorModel {
  @JsonKey(defaultValue: 0)
  final int? id;
  @JsonKey(defaultValue: '')
  final String? name;
  @JsonKey(defaultValue: '')
  final String? description;

  AuthorModel({this.name, this.id, this.description});

  factory AuthorModel.fromJson(Map<String, dynamic> json) =>
      _$AuthorModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorModelToJson(this);
}
