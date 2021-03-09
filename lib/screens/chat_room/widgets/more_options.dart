import 'dart:io';

import 'package:flutter/material.dart';
import 'package:messenger/screens/chat_room/repos/message_manager.dart';
import 'package:messenger/utils/services/native_api_service.dart';
import 'package:provider/provider.dart';

import 'custom_icon_btn.dart';

class MessageOptionsView extends StatelessWidget {
  final AnimationController animationController;
  final Function(MessageHandler, File) sendMessage;

  const MessageOptionsView({this.animationController, this.sendMessage});

  @override
  Widget build(BuildContext context) {
    var handler = Provider.of<MessageHandler>(context);
    var animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    );
    return SizeTransition(
      sizeFactor: animation,
      axisAlignment: -1,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomIconButton(
            // visualDensity: VisualDensity.compact,
            icon: Icon(Icons.image),
            tooltip: "Picture",
            onPressed: () {
              getImage().then((value) {
                if (value == null) return;
                sendMessage(handler, value);
              });
            },
          ),
          CustomIconButton(
            // visualDensity: VisualDensity.compact,
            icon: Icon(Icons.videocam_rounded),
            tooltip: "Video",
            onPressed: () {},
          ),
          CustomIconButton(
            // visualDensity: VisualDensity.compact,
            icon: Icon(Icons.insert_drive_file),
            tooltip: "File",
            onPressed: () {},
          ),
          CustomIconButton(
            // visualDensity: VisualDensity.compact,
            icon: Icon(Icons.location_on),
            tooltip: "Place",
            onPressed: () {},
          ),
          CustomIconButton(
            // visualDensity: VisualDensity.compact,
            icon: Icon(Icons.insert_chart),
            tooltip: "Poll",
            onPressed: () {},
          ),
          CustomIconButton(
            // visualDensity: VisualDensity.compact,
            icon: Icon(Icons.aspect_ratio),
            tooltip: "Expand",
            onPressed: () {
              // Navigator.pushNamed(context, AddPostScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
