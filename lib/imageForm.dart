import 'package:flutter/material.dart';
import 'dart:io';

class ImageForm extends StatefulWidget {
  final File image;
  ImageForm(this.image);

  @override
  _ImageFormState createState() => _ImageFormState();
}

class _ImageFormState extends State<ImageForm> {
  GlobalKey<FormState> _formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Form",
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                print("testando");
              },
              child: Image.file(
                widget.image,
                height: 200,
              ),
            ),
            Form(
              key: _formState,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: "Campo 1",
                          labelStyle:
                              TextStyle(color: Colors.black, fontSize: 18)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: "Campo 1",
                          labelStyle:
                              TextStyle(color: Colors.black, fontSize: 18)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: "Campo 1",
                          labelStyle:
                              TextStyle(color: Colors.black, fontSize: 18)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
