import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  Future<User?> login(String email, String password) async {
    emit(LoginLoading());
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccess(userCredential.user!));
      return userCredential.user;
    } catch (e) {
      emit(LoginError(
        message: e.toString(),
      ));
    }
  }
}
