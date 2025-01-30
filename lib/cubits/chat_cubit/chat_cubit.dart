import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../model/MessageModel.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  final CollectionReference messages =
  FirebaseFirestore.instance.collection('messages');//make me to access to database

  // Fetch messages from Firestore
   void fetchMessages() {
    emit(ChatLoading());
    messages.orderBy('createdAt', descending: true).snapshots().listen((snapshot) {
      final messagesList = snapshot.docs
          .map((doc) => MessagesModel.fromjson(doc))
          .toList();
      emit(ChatLoaded(messagesList));
    }, onError: (error) {
      emit(ChatError("Failed to fetch messages: $error"));
    });
  }

  // Send a message to Firestore
  Future<void> sendMessage(String message, String email) async {
    try {
      await messages.add({
        'messages': message,
        'createdAt': DateTime.now(),
        'id': email,
      });
    } catch (e) {
      emit(ChatError("Failed to send message: $e"));
    }
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      emit(ChatError("Failed to sign out: $e"));
    }
  }
}