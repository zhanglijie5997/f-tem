import 'package:art_app/db/db.tools.dart';
import 'package:art_app/db/home/database.dart';
import 'package:art_app/db/home/entity/home.dart';
import 'package:art_app/utils/log/log.utils.dart';
import 'home/dao/home_dao.dart';

class HomeDBUtils {
  /// 进入初始化
  static Future<HomeDataBase> get db =>
      $FloorHomeDataBase.databaseBuilder('app_datbase.db').build();

  /// 初始化dao
  static HomeDao? to() {
    return homeDataBase?.homeDao;
  }

  /// 插入列表数据
  static Future<bool> insert({required HomeEntity v}) async {
    try {
      await homeDataBase?.homeDao.insertHome(v);
      return Future.value(true);
    } catch (e) {
      LogUtil.e('home db error => $e');
      return Future.value(false);
    }
  }

  /// 获取列表数据
  static Future<List<HomeEntity>>? getList() {
    return homeDataBase?.homeDao.getList();
  }
}
