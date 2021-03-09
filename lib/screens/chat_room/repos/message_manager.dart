import 'package:flutter/material.dart';
import 'package:messenger/models/message_model.dart';

import 'message_handler_interface.dart';

class MessageHandler with ChangeNotifier {
  final IMessagesHandler handler;
  List<Message> _messages = [];

  List<Message> get messages => _messages;

  MessageHandler(this.handler, {List<Message>? messages}) {
    _messages = messages ?? [];
  }

  void sendMessage(Message message) {
    message.animController.forward();
    handler.onSend(messages, message);
    notifyListeners();
  }

  void deleteMessageAt(int index) async {
    await messages[index].animController.reverse();
    messages[index].animController.dispose();
    handler.onDelete(messages, index);
    notifyListeners();
  }

  bool deleteMessage(Message message) {
    int index = messages.indexOf(message);
    if (index == -1) return false;
    deleteMessageAt(index);
    return true;
  }
}
