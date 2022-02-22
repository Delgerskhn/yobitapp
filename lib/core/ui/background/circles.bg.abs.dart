import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CirclesBgAbs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: Container(), flex: 1),
                Expanded(
                    child: Container(
                      child: Image.asset(
                        'assets/images/bgcirclelg.png',
                        fit: BoxFit.cover,
                      ),
                      margin: EdgeInsets.only(bottom: 100),
                    ),
                    flex: 1),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Image.asset(
                    'assets/images/bgcircleleftlg.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                    child: Container(
                        child: Image.asset(
                          'assets/images/bgcirclemd.png',
                          fit: BoxFit.none,
                        ),
                        alignment: Alignment.topCenter)),
              ],
            ),
          ],
        ),
      ),
      top: 0,
      left: 0,
      right: 0,
    );
  }
}
