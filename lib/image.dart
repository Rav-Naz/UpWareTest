import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';


class ImagePickerPage extends StatefulWidget {
  const ImagePickerPage({Key? key}) : super(key: key);

  @override
  State<ImagePickerPage> createState() => _ImagePickerPagePageState();
}

class _ImagePickerPagePageState extends State<ImagePickerPage> {

  ImagePicker picker = ImagePicker();
  File? _imageFile;

  Future<void> _pickImage() async {
    XFile? image = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if(image != null) {
        _imageFile = File(image.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Container(
        alignment: Alignment.center,
        child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _imageFile != null ? Image.file(_imageFile!) : Container(),
              ElevatedButton(
                  onPressed: _pickImage,
                  child: Text('Get picture')),
              ElevatedButton(
                  onPressed: () {
                    launch('https://www.youtube.com/watch?v=vzrP93xNW8g');
                  },
                  child: Text('Open tutorial')),
            ]));

  }
}