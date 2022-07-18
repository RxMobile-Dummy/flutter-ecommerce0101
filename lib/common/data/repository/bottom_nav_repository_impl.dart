import 'package:amazon_clone/common/data/datasource/bottom_nav_datasource.dart';
import 'package:dartz/dartz.dart';

import '../../../../base/error/failures.dart';
import '../../domain/repository/bottom_nav_repository.dart';

class BottomNavRepositoryImpl extends BottomNavRepository {
  final BottomNavDataSource bottomNavDataSource;

  BottomNavRepositoryImpl({required this.bottomNavDataSource});

  @override
  Future<Either<Failure, int>> changePage(int page) async =>
      await bottomNavDataSource.changePage(page);
}
