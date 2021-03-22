import 'package:flutter/material.dart';

class ToggleMenu extends StatefulWidget {
  final VoidCallback callbackPhoto;
  final VoidCallback callbackGallery;

  ToggleMenu(this.callbackPhoto, this.callbackGallery);

  @override
  _ToggleMenuState createState() => _ToggleMenuState();
}

class _ToggleMenuState extends State<ToggleMenu>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;
  AnimationController _animationController;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });
    _translateButton = Tween<double>(begin: _fabHeight, end: -14.0).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.0, 0.75, curve: _curve)));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  //widgets
  Widget buttonGallery() {
    return Container(
      child: FloatingActionButton(
        heroTag: "galleryBtn",
        onPressed: widget.callbackGallery,
        child: Icon(Icons.photo_library_outlined),
        tooltip: "Pick from gallery",
      ),
    );
  }

  Widget buttonCamera() {
    return Container(
      child: FloatingActionButton(
        heroTag: "photoBtn",
        onPressed: widget.callbackPhoto,
        child: Icon(Icons.camera_alt_outlined),
        tooltip: "Take a photo",
      ),
    );
  }

  Widget buttonToggle() {
    return Container(
      child: FloatingActionButton(
        heroTag: "toggleBtn",
        onPressed: animate,
        child: Icon(
          Icons.camera,
          color: Colors.white,
          size: 40,
        ),
        tooltip: "Toogle",
      ),
    );
  }

  animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Transform(
          transform:
              Matrix4.translationValues(0.0, _translateButton.value * 2.0, 0.0),
          child: buttonGallery(),
        ),
        Transform(
          transform:
              Matrix4.translationValues(0.0, _translateButton.value, 0.0),
          child: buttonCamera(),
        ),
        buttonToggle(),
      ],
    );
  }
}
