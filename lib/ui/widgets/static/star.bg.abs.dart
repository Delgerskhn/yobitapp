import 'package:flutter/cupertino.dart';

class StarBgAbs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/Stars.png"),
                fit: BoxFit.cover,
              ),
              gradient: LinearGradient(
                  colors: [Color(0xff080712), Color(0xff201F3A)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: null /* add child content here */,
        ),
        left: 0,
        top: 0,
        bottom: 0,
        right: 0);
  }
}
