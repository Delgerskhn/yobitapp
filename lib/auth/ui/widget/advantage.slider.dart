import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef CallbackFn = void Function(int);

class AdvantageSlider extends StatefulWidget {
  final CallbackFn callback;

  const AdvantageSlider({Key? key, required this.callback}) : super(key: key);
  @override
  State<AdvantageSlider> createState() => _AdvantageSliderState(callback);
}

class _AdvantageSliderState extends State<AdvantageSlider> {
  final CallbackFn callback;

  _AdvantageSliderState(this.callback);
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
                          Positioned(
                              child: Image.asset(
                                  'assets/images/specialchallenge.png',
                                  fit: BoxFit.cover),
                              top: 0,
                              bottom: 0,
                              left: 0,
                              right: 0),
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
                ))
            .toList(),
        options: CarouselOptions(
            height: 440,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              callback(index);
            }));
  }
}
