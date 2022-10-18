// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drags_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Drugs _$DrugsFromJson(Map<String, dynamic> json) => Drugs(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      price: json['price'] as num? ?? 0,
      quantity: json['quantity'] as num? ?? 0,
    );

Map<String, dynamic> _$DrugsToJson(Drugs instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'price': instance.price,
      'quantity': instance.quantity,
    };
