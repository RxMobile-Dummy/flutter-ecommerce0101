import 'package:amazon_clone/base/error/failures.dart';

import 'package:dartz/dartz.dart';

import 'bottom_nav_datasource.dart';

class BottomNavDataSourceImpl extends BottomNavDataSource {
  int _page = 0;

  @override
  Future<Either<Failure, int>> changePage(int page) {
    _page = page;
    return Future.value(Right(_page));
  }
}
