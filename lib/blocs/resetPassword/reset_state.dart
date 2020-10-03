import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

abstract class ResetState extends Equatable {}

class ResetPasswordInitialState extends ResetState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class ResetPasswordLoadingState extends ResetState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class ResetPasswordSuccessState extends ResetState {
  // FirebaseUser user;
  //
  // ResetPasswordSuccessState(@required this.user);

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class ResetPasswordFailState extends ResetState {
  String message;

  ResetPasswordFailState(@required this.message);

  @override
  // TODO: implement props
  List<Object> get props => null;
}
