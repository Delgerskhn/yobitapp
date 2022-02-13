import 'package:flutter/material.dart';
import 'package:yobit/constants/infrastructure/paths.dart';

class UserGadget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserGadget();
}

class _UserGadget extends State<UserGadget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Positioned(
          child: Container(
              width: 90,
              height: 20,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Text("1700")),
        ),
        Positioned(
          child: Image(image: AssetImage(Paths.profile), width: 90, height: 90),
          right: 0,
        )
      ],
    );
  }
}
