import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'entity/home.dart';
import 'dao/home_dao.dart';
part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [HomeEntity])
abstract class HomeDataBase extends FloorDatabase {
  HomeDao get homeDao;
}
