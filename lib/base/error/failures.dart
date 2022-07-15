

import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? message;
  const Failure({this.message = ""});

  @override
  String toString() {
    return message ?? "";
  }

  @override
  List<Object> get props => [];
}

// General failures
class ServerFailure extends Failure {
  const ServerFailure({super.message=""});

  @override
  String toString() {
    return message ?? "";
  }
}

class BadRequestFailure extends Failure {
  const BadRequestFailure({super.message = ""});

  @override
  String toString() {
    return message ?? "Invalid Request !!!";
  }
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure({super.message = ""});

  @override
  String toString() {
    return message ?? "Unauthorised !!!";
  }
}

class FailureMessage extends Failure {
  const FailureMessage({super.message = ""});
  @override
  String toString() {
    return message ?? "Something went wrong !!!";
  }
}

class CacheFailure extends Failure {
  const CacheFailure({super.message = ""});

  @override
  String toString() {
    return message ?? "";
  }
}

class AuthFailure extends Failure {
  const AuthFailure({super.message = ""});

  @override
  String toString() {
    return message ?? "";
  }
}

class NoDataFailure extends Failure {
  const NoDataFailure({super.message = ""});

  @override
  String toString() {
    return message ?? "No data found !!";
  }
}

class InternetFailure extends Failure {
  const InternetFailure({super.message = ""});

  @override
  String toString() {
    return message ?? "";
  }
}

class DataExists<T> extends Failure {
  const DataExists({super.message = ""});

  @override
  String toString() {
    return message ?? "";
  }
}
