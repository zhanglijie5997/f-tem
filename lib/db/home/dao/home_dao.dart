import 'package:art_app/db/home/entity/home.dart';
import 'package:floor/floor.dart';

@dao
abstract class HomeDao {
  @Query('SELECT * FROM Person')
  Future<List<HomeEntity>> getList();

  @insert
  Future<void> insertHome(HomeEntity v);

  // @update

}