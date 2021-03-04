import 'package:messenger/models/message_model.dart';

import 'message_handler_interface.dart';

class OfflineMessageHandler implements IMessagesHandler {
  @override
  void onDelete(List<Message> messages, int index) {
    messages.removeAt(index);
  }

  @override
  void onEdit(List<Message> messages, int index, Message newMessage) {
    messages[index] = newMessage;
  }

  @override
  void onSend(List<Message> messages, Message newMessage) {
    messages.insert(0, newMessage);
  }
}
