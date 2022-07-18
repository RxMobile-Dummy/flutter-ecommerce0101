import 'package:dartz/dartz.dart';

import '../../../../base/error/failures.dart';


abstract class BottomNavDataSource{
  Future<Either<Failure,int>> changePage(int page);
}