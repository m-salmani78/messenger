import 'package:flutter/material.dart';

class CustomIconButton extends IconButton {
  CustomIconButton({
    Key key,
    @required Widget icon,
    @required VoidCallback onPressed,
    VisualDensity visualDensity,
    String tooltip,
  }) : super(
            icon: icon,
            onPressed: onPressed,
            tooltip: tooltip,
            visualDensity: visualDensity,
            splashRadius: 24,
            splashColor: Colors.transparent);
}
