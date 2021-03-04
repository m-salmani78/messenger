import 'package:flutter/material.dart';

import 'custom_icon_btn.dart';

class MessageOptionsView extends StatelessWidget {
  final AnimationController animationController;

  const MessageOptionsView({Key key, this.animationController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    );
    return SizeTransition(
      sizeFactor: animation,
      axisAlignment: -1,
      child: ButtonBar(
        mainAxisSize: MainAxisSize.max,
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding: EdgeInsets.zero,
        children: [
          CustomIconButton(
            // visualDensity: VisualDensity.compact,
            icon: Icon(Icons.image),
            tooltip: "Emoji",
            onPressed: () {},
          ),
          CustomIconButton(
            // visualDensity: VisualDensity.compact,
            icon: Icon(Icons.insert_drive_file),
            tooltip: "Gif",
            onPressed: () {},
          ),
          CustomIconButton(
            // visualDensity: VisualDensity.compact,
            icon: Icon(Icons.location_on),
            tooltip: "Sticker",
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
            icon: Icon(Icons.account_circle),
            onPressed: () {},
          ),
          CustomIconButton(
            // visualDensity: VisualDensity.compact,
            icon: Icon(Icons.aspect_ratio),
            onPressed: () {
              // Navigator.pushNamed(context, AddPostScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
