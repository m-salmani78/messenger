import 'package:messenger/models/message_model.dart';

abstract class IMessagesHandler {
  void onSend(List<Message> messages, Message newMessage);

  void onEdit(List<Message> messages, int index, Message newMessage);

  void onDelete(List<Message> messages, int index);
}
