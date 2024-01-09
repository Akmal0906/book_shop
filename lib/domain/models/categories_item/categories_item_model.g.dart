// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CateItemModel _$CateItemModelFromJson(Map<String, dynamic> json) =>
    CateItemModel(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      price: json['price'] as String,
      active: json['active'] as bool,
      picture: json['picture'] as String,
      eVersion: json['e_version'] as String,
      author: (json['author'] as List<dynamic>)
          .map((e) => ItemListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CateItemModelToJson(CateItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'description': instance.description,
      'active': instance.active,
      'picture': instance.picture,
      'e_version': instance.eVersion,
      'author': instance.author,
    };
