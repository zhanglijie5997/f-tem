import 'package:art_app/db/db.dart';
import 'package:art_app/db/home/database.dart';

/// 首页数据库
HomeDataBase? homeDataBase;

class DBInits {
  static init() async{
    homeDataBase = await HomeDBUtils.db;
  }
}