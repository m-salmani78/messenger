import 'package:flutter/material.dart';
import 'package:messenger/constants/app_constants.dart';
import 'package:messenger/models/message_model.dart';
import 'package:messenger/screens/chat_room/repos/message_manager.dart';
import 'package:messenger/config/themes/theme_config.dart';
import 'package:provider/provider.dart';

class MessageView extends StatelessWidget {
  final Message message;
  final String name;
  final bool alignRight;

  MessageView({
    required this.message,
    this.name = "deleted account",
    this.alignRight = true,
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
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment:
                alignRight ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 4),
                child: alignRight ? null : CircleAvatar(child: Text(name[0])),
              ),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomRight: alignRight
                        ? Radius.zero
                        : Radius.circular(cardCornerRadius),
                    bottomLeft: alignRight
                        ? Radius.circular(cardCornerRadius)
                        : Radius.zero,
                    topLeft: Radius.circular(cardCornerRadius),
                    topRight: Radius.circular(cardCornerRadius),
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () {},
                  onLongPress: () {
                    handler.deleteMessage(message);
                  },
                  // splashColor: Colors.transparent,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    color: alignRight ? theme.myMessage : theme.othersMessage,
                    width: screenWidth(context) * 0.6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      verticalDirection: VerticalDirection.down,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: alignRight ? 0.0 : 4.0, left: 8),
                          child: alignRight
                              ? null
                              : Text(name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(color: Colors.blue)),
                        ),
                        Container(
                          child: message.imageFile == null
                              ? null
                              : Image.file(message.imageFile!),
                        ),
                        Container(
                          padding: EdgeInsets.all(message.text.isEmpty ? 0 : 8),
                          child:
                              message.text.isEmpty ? null : Text(message.text),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                "${message.dateTime.hour}:${message.dateTime.minute}",
                                style: TextStyle(
                                    color: alignRight
                                        ? theme.themeData.primaryColor
                                        : Colors.grey[600],
                                    fontSize: 12),
                              ),
                              Container(
                                child: (!alignRight)
                                    ? null
                                    : Icon(
                                        Icons.done_all,
                                        size: 16,
                                        color: theme.themeData.primaryColor,
                                      ),
                              )
                            ],
                          ),
                        )
                      ],
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
