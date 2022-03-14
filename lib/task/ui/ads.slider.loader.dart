import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AdsSliderLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: [1, 2, 3]
            .map((e) => Container(
                margin: EdgeInsets.all(5),
                child: InkWell(
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        child: Stack(children: [
                          VxBox(child: CircularProgressIndicator())
                              .alignCenter
                              .make(),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            top: 0,
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
                        ])))
                // child: ClipRRect(
                //     borderRadius: BorderRadius.circular(25),
                //     child: Image.asset('assets/images/specialchallenge.png')),
                ).box.width(143).make())
            .toList(),
        options: CarouselOptions(
          initialPage: 0,
          height: 200,
          viewportFraction: 0.4,
        ));
  }
}
