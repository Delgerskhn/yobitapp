import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yobit/router/navigation.model.dart';

class UserGadget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserGadget();
}

class _UserGadget extends State<UserGadget> {
  @override
  Widget build(BuildContext context) {
    var navmodel = Provider.of<NavigationModel>(context, listen: false);
    return GestureDetector(
      onTap: () {
        navmodel.pushProfile();
      },
      child: HStack(
        [
          Image.asset('assets/images/profile.png')
              .box
              .transform(Matrix4.translationValues(-10, 0, 0))
              .make(),
        ],
      ),
    );
  }
}
