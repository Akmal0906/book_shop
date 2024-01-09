import 'package:json_annotation/json_annotation.dart';

part 'categories_model.g.dart';

@JsonSerializable()

class CategoriesModel{
  final int id;
  final String name;
  final String description;
  CategoriesModel({required this.id,required this.name,this.description='Empty'});
  factory CategoriesModel.fromJson(Map<String, dynamic> json) => _$CategoriesModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoriesModelToJson(this);


}