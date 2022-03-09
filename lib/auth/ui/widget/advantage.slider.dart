import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yobit/auth/api/advantages.dart';

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
    return FutureBuilder(
        future: getAdvantageImages(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData)
            return ImageSlider(
              callback: callback,
              images: snapshot.data as List<String>,
            );
          return CarouselLoader(height: 440);
        });
  }
}

class CarouselLoader extends StatelessWidget {
  final height;

  const CarouselLoader({Key? key, this.height}) : super(key: key);

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
                ))
            .toList(),
        options: CarouselOptions(
          height: height,
          enlargeCenterPage: true,
        ));
  }
}

class ImageSlider extends StatelessWidget {
  ImageSlider({Key? key, required this.callback, required this.images})
      : super(key: key) {
    print('init');
  }
  final List<String> images;
  final CallbackFn callback;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: images
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
              // callback(index);
            }));
  }
}
