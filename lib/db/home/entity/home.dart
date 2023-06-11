import 'package:floor/floor.dart';
@entity
class HomeEntity {
  @primaryKey
  final int id;
  final String name;
  
  HomeEntity({required this.id, required this.name});
}