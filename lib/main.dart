import 'package:flutter/material.dart';
import 'components/toggleMenu.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'imageForm.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File _image;
  final picker = ImagePicker();

  Future getImageFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        _showImageForm(_image);
      } else {
        print('No image selected.');
      }
    });
  }

  Future getImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        _showImageForm(_image);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            "Home",
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                  size: 25,
                ),
                onPressed: () {}),
          ],
        ),
        drawer: Drawer(),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [],
            ),
          ),
        ),
        floatingActionButton:
            ToggleMenu(getImageFromCamera, getImageFromGallery));
  }

  void _showImageForm(File image) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ImageForm(image)));
  }
}
