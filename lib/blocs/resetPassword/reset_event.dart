import 'package:equatable/equatable.dart';

abstract class ResetEvent extends Equatable {}

class ResetPassword extends ResetEvent {
  String email;

  ResetPassword({this.email});
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
