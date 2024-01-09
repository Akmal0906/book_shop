import 'package:json_annotation/json_annotation.dart';
part 'item_list_model.g.dart';

@JsonSerializable()
class ItemListModel{
  final int id;
  final String name;
  final String? description;
  ItemListModel({required this.id,required this.name,this.description});

  factory ItemListModel.fromJson(Map<String, dynamic> json) =>
      _$ItemListModelFromJson(json);
  Map<String, dynamic> toJson() => _$ItemListModelToJson(this);

}