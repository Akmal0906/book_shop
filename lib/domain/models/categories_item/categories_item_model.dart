import 'package:json_annotation/json_annotation.dart';

import 'item_list_model.dart';


part 'categories_item_model.g.dart';

@JsonSerializable()

class CateItemModel {
  final int id;
  final String title;
  final String price;
  final String description;
  final bool active;
  final String picture;
  @JsonKey(name: 'e_version')
  final String eVersion;
  final List<ItemListModel> author;

  CateItemModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.active,
      required this.picture,
      required this.eVersion,required this.author});
  CateItemModel.withError(this.id, this.title, this.price, this.active, this.picture, this.eVersion, this.author, {required this.description});


  factory CateItemModel.fromJson(Map<String, dynamic> json) => _$CateItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$CateItemModelToJson(this);
}
