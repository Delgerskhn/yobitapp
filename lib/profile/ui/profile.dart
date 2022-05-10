import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yobit/auth/data/auth.view.model.dart';
import 'package:yobit/badge/api/badgeRepository.dart';
import 'package:yobit/core/ui/background/star.background.dart';
import 'package:yobit/core/ui/elements/floating.back.button.dart';
import 'package:yobit/profile/ui/profile.tabs.dart';
import 'package:yobit/profile/ui/summary.dart';

class ProfileScreen extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    var authModel = Provider.of<AuthViewModel>(context, listen: false);
    return Scaffold(
      body: StarBackground(
          child: () => VStack(
                [
                  Avatar(),
                  '${auth.currentUser?.displayName}'
                      .text
                      .white
                      .headline5(context)
                      .make()
                      .box
                      .py12
                      .make(),
                  ProfileSummary(
                    badgeRepository: BadgeRepository(),
                  )
                      .box
                      .width(345)
                      .customRounded(BorderRadius.circular(20))
                      .color(Theme.of(context).primaryColor)
                      .margin(EdgeInsets.only(top: 12))
                      .make(),
                  ProfileTabs().box.width(345).py16.make(),
                  ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20)))),
                      onPressed: () {
                        authModel.logout();
                      },
                      child: HStack(
                        [
                          Icon(
                            Icons.logout,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          VxBox(child: 'Гарах'.text.size(18).white.make())
                              .color(Theme.of(context).primaryColor)
                              .make()
                        ],
                      )).box.size(345, 68).make()
                ],
                crossAlignment: CrossAxisAlignment.center,
              ).wFull(context).scrollVertical()),
      floatingActionButton: FloatingBackButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    );
  }
}

class Avatar extends StatelessWidget {
  Avatar({
    Key? key,
  }) : super(key: key);

  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        // var imgInfo = await ImageAdapter().getImage();
        // if (imgInfo != null)
        //   UserRepository().updateUserPhoto(imgInfo.data, imgInfo.filename);
      },
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
        // side: BorderSide(color: Colors.red)
      ))),
      child: VxBox(
          child:
              // auth.currentUser!.photoURL != null
              //     ? FutureBuilder(
              //         builder: (ctx, snapshot) {
              //           if (snapshot.hasError) print(snapshot.error);
              //           if (snapshot.hasData)
              //             return CircleAvatar(
              //                 radius: 50,
              //                 foregroundImage: NetworkImage(
              //                   snapshot.data as String,
              //                 ));

              //           return CircularProgressIndicator();
              //         },
              //         future: getImgUrl(auth.currentUser!.photoURL!),
              //       )
              //     :
              CircleAvatar(
        radius: 50,
        backgroundImage: AssetImage('assets/images/profile.png'),
      )).make(),
    ).box.margin(EdgeInsets.only(top: 94)).size(100, 100).alignCenter.make();
  }
}
