import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:yobit/constants/infrastructure/paths.dart';

class Slider extends StatelessWidget {
  CarouselController controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 16 / 9,
        enlargeCenterPage: true,
      ),
      carouselController: controller,
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              child: Container(
                margin: EdgeInsets.all(5),
                child: InkWell(
                    onTap: () {
                      controller.animateToPage(i,
                          duration: Duration(seconds: 1), curve: Curves.linear);
                    },
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        child: Stack(
                          children: [
                            Image.network(
                              Paths.specialChallenge,
                              fit: BoxFit.cover,
                              width: 1000,
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [
                                        Color.fromARGB(200, 0, 0, 0),
                                        Color.fromARGB(0, 0, 0, 0)
                                      ],
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter)),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20)),
                            )
                          ],
                        ))),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
