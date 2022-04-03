import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yobit/auth/ui/widget/advantage.slider.dart';
import 'package:yobit/challenge/data/challenge.dart';
import 'package:yobit/router/navigation.model.dart';
import 'package:yobit/challenge/api/challenge.repository.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:yobit/userTask/api/user.task.repo.dart';
import 'package:yobit/userTask/data/user.task.dart';

class SliderTaskFile extends StatefulWidget {
  final ChallengeRepository challengeRepo;
  final UserTaskRepository userTaskRepo = UserTaskRepository();
  SliderTaskFile({Key? key, required this.challengeRepo}) : super(key: key);
  @override
  State<SliderTaskFile> createState() {
    return _SliderTaskFile();
  }
}

class _SliderTaskFile extends State<SliderTaskFile> {
  CarouselController controller = CarouselController();
  final instance = firebase_storage.FirebaseStorage.instance;
  @override
  Widget build(BuildContext context) {
    var navmodel = Provider.of<NavigationModel>(context);
    return FutureBuilder(
        future: this.widget.userTaskRepo.getRecents(),
        builder: (ctx, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            final tasks = snapshot.data as List<UserTask>;
            return Column(children: [
              Container(
                child: CarouselSlider(
                  options: CarouselOptions(
                      height: 413.0,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {}),
                  carouselController: controller,
                  items: tasks.map((task) {
                    return Builder(
                      builder: (context) {
                        return GestureDetector(
                          onTap: () {
                            // navmodel.pushChallengePage(challenge.id);
                          },
                          child: Container(
                            child: Container(
                              margin: EdgeInsets.all(5),
                              child: InkWell(
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(25.0)),
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            bottom: 0,
                                            left: 0,
                                            top: 0,
                                            right: 0,
                                            child: CachedNetworkImage(
                                              imageUrl: task.file,
                                              fit: BoxFit.cover,
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Text('Error!'),
                                              placeholder: (context, url) => VxBox(
                                                      child:
                                                          CircularProgressIndicator())
                                                  .alignCenter
                                                  .make(),
                                              width: 1000,
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            left: 0,
                                            top: 0,
                                            right: 0,
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                        colors: [
                                                      Color.fromARGB(
                                                          200, 0, 0, 0),
                                                      Color.fromARGB(0, 0, 0, 0)
                                                    ],
                                                        begin: Alignment
                                                            .bottomCenter,
                                                        end: Alignment
                                                            .topCenter)),
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 10,
                                                    horizontal: 20)),
                                          )
                                        ],
                                      ))),
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            ]);
          }

          return CarouselLoader(
            height: 413.0,
          );
        });
  }
}
