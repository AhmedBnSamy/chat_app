
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';
class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<User?> login(String email, String password) async {
    emit(LoginLoading());
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(LoginSuccess(userCredential.user!));
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'user-not-found') {
        errorMessage = 'User not found. Please check your email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Incorrect password. Please try again.';
      } else if (e.code == 'invalid-email') {
        errorMessage = 'Invalid email format. Please check and try again.';
      } else {
        errorMessage = 'An unexpected error occurred. Please try again later.';
      }
      emit(LoginError(message: errorMessage));
    } catch (e) {
      emit(LoginError(message: 'An unexpected error occurred: ${e.toString()}'));
    }
    return null;
  }
}
