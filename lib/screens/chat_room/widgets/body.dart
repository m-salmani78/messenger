import 'package:flutter/material.dart';
import 'package:messenger/models/message_model.dart';
import 'package:messenger/screens/chat_room/repos/message_manager.dart';
import 'package:messenger/screens/chat_room/widgets/chat_message.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    final messages = Provider.of<MessageHandler>(context).messages;
    return ListView.builder(
      reverse: true,
      itemBuilder: (_, index) {
        Message message = messages[index];
        return ChangeNotifierProvider<Message>.value(
          value: message,
          child: MessageView(
            name: "Mahdi",
            message: message,
          ),
        );
      },
      itemCount: messages.length,
    );
  }
}
