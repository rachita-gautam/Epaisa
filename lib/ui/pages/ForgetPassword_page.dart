import 'package:FirebaseUserSignIn/blocs/resetPassword/reset_bloc.dart';
import 'package:FirebaseUserSignIn/blocs/resetPassword/reset_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/loginBloc/login_bloc.dart';
import '../../repositories/user_repository.dart';

class ForgetPasswordParent extends StatelessWidget {
  UserRepository userRepository;

  ForgetPasswordParent({@required this.userRepository});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ResetBloc>(
      create: (context) => ResetBloc(userRepository: userRepository),
      child: ForgetPassword(userRepository: userRepository),
    );
  }
}

class ForgetPassword extends StatelessWidget {
  @override
  TextEditingController emailCntrlr = TextEditingController();

  ResetBloc resetBloc;
  UserRepository userRepository;

  ForgetPassword({this.userRepository});

  @override
  Widget build(BuildContext context) {
    resetBloc = BlocProvider.of<ResetBloc>(context);
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text('Please enter your email to reset your password',
                style: TextStyle(
                  fontSize: 25,
                )),
          ),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15.0),
            child: TextField(
              controller: emailCntrlr,
              decoration: InputDecoration(
                errorStyle: TextStyle(color: Colors.white),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
                // labelText: "E-mail",
                hintText: "Please enter your email",
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          Container(
            child: RaisedButton(
              color: Colors.cyan,
              child: Text("Send Email"),
              textColor: Colors.white,
              onPressed: () {
                resetBloc.add(ResetPassword(email: emailCntrlr.text));
              },
            ),
          ),
        ],
      ),
    );
  }
}
