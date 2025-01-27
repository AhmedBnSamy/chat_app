import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';
class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Future<User?> register(String email, String password) async {
    emit(RegisterLoading());
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(RegisterSuccess(userCredential.user!));
      return userCredential.user;
    } catch (e) {
      emit(RegisterError(
        message: e.toString(),
      ));
      return null;
    }
  }
}
