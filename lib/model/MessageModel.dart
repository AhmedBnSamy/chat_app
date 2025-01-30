import 'package:flutter/cupertino.dart';

class MessagesModel{
  final String message;
  final String id;
  MessagesModel(this.message, this.id);


  factory MessagesModel.fromjson(jsonData){
    return MessagesModel(jsonData['messages'],jsonData['id']);
  }



}
