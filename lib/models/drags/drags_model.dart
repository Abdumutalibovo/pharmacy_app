import 'package:json_annotation/json_annotation.dart';
part 'drags_model.g.dart';

@JsonSerializable()
class Drugs {

  @JsonKey(name: 'id', defaultValue: 0)
  int id;

  @JsonKey(name: 'name', defaultValue: '')
  String name;

  @JsonKey(name: 'description', defaultValue: '')
  String description;

  @JsonKey(name: 'imageUrl', defaultValue: '')
  String imageUrl;

  @JsonKey(name: 'price', defaultValue: 0)
  num price;

  @JsonKey(name: 'quantity', defaultValue: 0)
  num quantity;

  Drugs({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });

  factory Drugs.fromJson(Map<String, dynamic> json) => _$DrugsFromJson(json);
  Map<String, dynamic> toJson() => _$DrugsToJson(this);
}
