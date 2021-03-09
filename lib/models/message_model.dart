import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';

class Message with ChangeNotifier {
  final int id = Random().nextInt(256);
  String _text = "";
  DateTime _dateTime = DateTime.now();
  final AnimationController animController;
  final File? imageFile;

  Message(
      {String? text,
      DateTime? dateTime,
      required this.animController,
      this.imageFile}) {
    this._text = text ?? "";
    this._dateTime = dateTime ?? DateTime.now();
  }

  DateTime get dateTime => _dateTime;

  String get text => _text;

  set text(String value) {
    _text = value;
    notifyListeners();
  }
}
