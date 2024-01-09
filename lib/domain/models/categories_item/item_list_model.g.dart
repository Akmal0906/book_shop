// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemListModel _$ItemListModelFromJson(Map<String, dynamic> json) =>
    ItemListModel(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ItemListModelToJson(ItemListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };
