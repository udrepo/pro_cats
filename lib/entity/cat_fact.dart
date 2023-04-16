import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cat_fact.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class CatFact{

  @HiveField(0)
  String fact;
  
  @HiveField(1)
  DateTime? createdAt = DateTime.now();

  CatFact({required this.fact,});

  factory CatFact.fromJson(Map<String, dynamic> json) => _$CatFactFromJson(json);
  Map<String, dynamic> toJson() => _$CatFactToJson(this);
}