import 'package:FirebaseUserSignIn/blocs/loginBloc/login_event.dart';
import 'package:FirebaseUserSignIn/blocs/loginBloc/login_state.dart';
import 'package:FirebaseUserSignIn/blocs/resetPassword/reset_event.dart';
import 'package:FirebaseUserSignIn/blocs/resetPassword/reset_state.dart';
import 'package:FirebaseUserSignIn/repositories/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class ResetBloc extends Bloc<ResetEvent, ResetState> {
  UserRepository userRepository;

  ResetBloc({@required UserRepository userRepository}) {
    this.userRepository = userRepository;
  }

  @override
  // TODO: implement initialState
  ResetState get initialState => ResetPasswordInitialState();

  @override
  Stream<ResetState> mapEventToState(ResetEvent event) async* {
    if (event is ResetPassword) {
      yield ResetPasswordLoadingState();
      try {
        await userRepository.resetPassword(event.email);
        yield ResetPasswordSuccessState();
      } catch (e) {
        yield ResetPasswordFailState(e.toString());
      }
      // print(event.email);
    }
  }
}
