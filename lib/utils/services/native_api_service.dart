import 'dart:io';

import 'package:image_picker/image_picker.dart';

Future<File> getImage() async {
  File? _image;
  final picker = ImagePicker();
  final pickedFile = await picker.getImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    _image = File(pickedFile.path);
  } else {
    print('@@@@@@@@@@ Not image selected.');
  }
  return _image!;
}
