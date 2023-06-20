import 'package:art_app/models/accountment_list/accountment_list.dart';
import 'package:art_app/models/home_position_list/home_position_list.dart';
import 'package:art_app/models/response/response.dart';
import 'package:equatable/equatable.dart';

typedef DataFactory<T extends Equatable> = T Function(Json json);

final Map<Type, DataFactory> dataModelFactories = <Type, DataFactory>{
  AccountmentList: AccountmentList.fromJson,
  HomePositionList: HomePositionList.fromJson
};
