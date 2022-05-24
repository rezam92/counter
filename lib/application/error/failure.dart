import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

//
class FailureOperation extends Failure {
  final String errorReason;
  FailureOperation({this.errorReason = 'Error'});
}
