import 'dart:io';

import 'package:flutter/material.dart';

class Message with ChangeNotifier {
  final String id;
  String _text;
  DateTime _dateTime;
  final AnimationController animController;
  final File imageFile;

  Message(
      {String text,
      DateTime dateTime,
      this.id,
      this.animController,
      this.imageFile}) {
    this._text = text;
    this._dateTime = dateTime ?? DateTime.now();
  }

  DateTime get dateTime => _dateTime;

  String get text => _text;

  set text(String value) {
    _text = value;
    notifyListeners();
  }
}
