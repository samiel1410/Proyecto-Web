import 'package:flutter/material.dart';
import 'package:pagosapp_group/bloc/login_bloc.dart';
import 'package:pagosapp_group/bloc/signup_bloc.dart';
export 'package:pagosapp_group/bloc/login_bloc.dart';
export 'package:pagosapp_group/bloc/signup_bloc.dart';

class LoginProvider extends InheritedWidget {
  LoginProvider({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final loginBloc = LoginBloc();
  final signUpBloc = SignUpBloc();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBloc of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<LoginProvider>()!
        .loginBloc;
  }

  static SignUpBloc ofSing(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<LoginProvider>()!
        .signUpBloc;
  }
}
