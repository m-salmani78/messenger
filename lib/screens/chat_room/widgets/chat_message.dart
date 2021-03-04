import 'package:flutter/material.dart';
import 'package:messenger/constants/constants.dart';
import 'package:messenger/models/message_model.dart';
import 'package:messenger/screens/chat_room/repos/message_manager.dart';
import 'package:provider/provider.dart';

class MessageView extends StatelessWidget {
  final Message message;
  final String name;
  final bool isMyMessage;

  MessageView({
    @required this.message,
    this.name = "deleted account",
    this.isMyMessage = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeConfig>(context).theme;
    final handler = Provider.of<MessageHandler>(context);
    final animation = CurvedAnimation(
      parent: message.animController,
      curve: Curves.fastOutSlowIn,
    );
    return SizeTransition(
      sizeFactor: animation,
      child: FadeTransition(
        opacity: animation,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment:
                isMyMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 4),
                child: isMyMessage ? null : CircleAvatar(child: Text(name[0])),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomRight: isMyMessage
                        ? Radius.zero
                        : Radius.circular(cardCornerRadius),
                    bottomLeft: isMyMessage
                        ? Radius.circular(cardCornerRadius)
                        : Radius.zero,
                    topLeft: Radius.circular(cardCornerRadius),
                    topRight: Radius.circular(cardCornerRadius),
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  color: isMyMessage ? theme.myMessage : theme.othersMessage,
                  child: InkWell(
                    onTap: () {},
                    onLongPress: () {
                      handler.deleteMessage(message);
                    },
                    splashColor: Colors.transparent,
                    child: Container(
                      margin: EdgeInsets.all(8.0),
                      width: screenWidth(context) * 0.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 5.0),
                            child: isMyMessage
                                ? null
                                : Text(name,
                                    style:
                                        Theme.of(context).textTheme.headline6),
                          ),
                          Text(message.text),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "${message.dateTime.hour}:${message.dateTime.minute}",
                                style: TextStyle(
                                    color: isMyMessage
                                        ? theme.themeData.primaryColor
                                        : Colors.grey[600],
                                    fontSize: 12),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 2.0),
                                child: (!isMyMessage)
                                    ? null
                                    : Icon(
                                        Icons.done_all,
                                        size: 16,
                                        color: theme.themeData.primaryColor,
                                      ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
