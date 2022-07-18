import 'package:amazon_clone/base/error/failures.dart';
import 'package:amazon_clone/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../repository/bottom_nav_repository.dart';

class ChangePageUseCase extends UseCase<int, Params3> {
  final BottomNavRepository bottomNavRepository;

  ChangePageUseCase({required this.bottomNavRepository});

  @override
  Future<Either<Failure, int>?>? call(Params3 params) {
    return bottomNavRepository.changePage(params.page);
  }
}

class Params3 extends Equatable {
  final int page;
  const Params3({required this.page});

  @override
  List<Object?> get props => [page];
}
