import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AdsSlider extends StatelessWidget {
  final List<String> items;

  const AdsSlider({Key? key, required this.items}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: this
            .items
            .map((e) => Container(
                margin: EdgeInsets.all(5),
                child: InkWell(
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        child: Stack(children: [
                          VxBox(
                            child: CachedNetworkImage(
                              imageUrl: e,
                              fit: BoxFit.cover,
                              errorWidget: (context, url, error) =>
                                  Text('Error!'),
                              placeholder: (context, url) =>
                                  VxBox(child: CircularProgressIndicator())
                                      .alignCenter
                                      .make(),
                              width: 1000,
                            ),
                          ).alignCenter.make(),
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
