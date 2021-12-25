import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yobit/constants/infrastructure/paths.dart';
import 'package:yobit/constants/infrastructure/strings.dart';
import 'package:yobit/logic/view_models/user.view.model.dart';
import 'package:yobit/ui/widgets/elements/text21.dart';
import 'package:yobit/ui/widgets/static/star.background.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel = Provider.of<UserViewModel>(context);
    return StarBackground(
        child: () => Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 35),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text21(
                        text: userViewModel.getWelcomeMsg(),
                      ),
                      Image(image: AssetImage(Paths.profile))
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  )
                ],
              ),
            ));
  }
}
