import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:yobit/constants/infrastructure/paths.dart';

class Slider extends StatefulWidget {
  @override
  State<Slider> createState() {
    return _Slider();
  }
}

class _Slider extends State<Slider> {
  CarouselController controller = CarouselController();
  int _current = 0;

  @override
  Widget build(BuildContext context) {
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
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  child: Container(
                    margin: EdgeInsets.all(5),
                    child: InkWell(
                        child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)),
                            child: Stack(
                              children: [
                                Image.asset(
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
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [1, 2, 3, 4, 5].asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => controller.animateToPage(entry.key),
            child: Container(
              width: 12,
              height: 12,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black)
                      .withOpacity(_current == entry.key ? 0.9 : 0.4)),
            ),
          );
        }).toList(),
      )
    ]);
  }
}
