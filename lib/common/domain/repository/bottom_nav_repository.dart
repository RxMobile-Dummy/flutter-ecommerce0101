import 'package:dartz/dartz.dart';

import '../../../../base/error/failures.dart';

abstract class BottomNavRepository {
  Future<Either<Failure, int>> changePage(int page);
}
