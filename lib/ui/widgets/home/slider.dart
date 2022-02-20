import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:yobit/constants/infrastructure/paths.dart';
import 'package:yobit/logic/models/challenge.dart';
import 'package:yobit/services/challenge.repository.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class Slider extends StatefulWidget {
  @override
  State<Slider> createState() {
    return _Slider();
  }
}

class _Slider extends State<Slider> {
  CarouselController controller = CarouselController();
  int _current = 0;
  final instance = firebase_storage.FirebaseStorage.instance;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getFeaturedChallenges(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasError) {
            return Center(
              child: Text(
                'Some error occured! Try refresh the page.',
                style: TextStyle(fontSize: 18),
              ),
            );
          } else if (snapshot.hasData) {
            final challenges = snapshot.data as List<Challenge>;
            print(challenges);
            return Column(children: [
              Container(
                child: CarouselSlider(
                  options: CarouselOptions(
                      aspectRatio: 16 / 9,
                      height: MediaQuery.of(context).size.height / 2.4,
                      viewportFraction: 0.65,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                  carouselController: controller,
                  items: challenges.map((challenge) {
                    return Builder(
                      builder: (context) {
                        return Container(
                          child: Container(
                            margin: EdgeInsets.all(5),
                            child: InkWell(
                                child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25.0)),
                                    child: Stack(
                                      children: [
                                        CachedNetworkImage(
                                          imageUrl: challenge.imgUrl,
                                          fit: BoxFit.cover,
                                          errorWidget: (context, url, error) =>
                                              Text('Error!'),
                                          placeholder: (context, url) =>
                                              CircularProgressIndicator(),
                                          width: 1000,
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
                                                      end:
                                                          Alignment.topCenter)),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10,
                                                  horizontal: 20)),
                                        )
                                      ],
                                    ))),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            ]);
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
