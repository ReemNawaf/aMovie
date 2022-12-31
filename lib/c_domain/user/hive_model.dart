import 'package:hive/hive.dart';
part 'hive_model.g.dart';

@HiveType(typeId: 1)
class HiveUserModel {
  @HiveField(0)
  final String name;

  HiveUserModel({required this.name});
}
