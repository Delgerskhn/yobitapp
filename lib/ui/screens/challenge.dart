//TODO: create the challenge screen here
import 'package:flutter/material.dart';

class ChallengeScreen extends StatelessWidget {
  const ChallengeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
          onPressed: () {},
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 30, top: 12),
              child: Image.asset(
                "assets/profile.png",
                // scale: 2.3,
                width: 35,
                height: 25,
              )
              // child: const Icon(Icons.ac_unit, color: Colors.green),
              )
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Stars.png"),
            fit: BoxFit.cover,
          ),
          gradient: LinearGradient(
              colors: [Color(0xff080712), Color(0xff201F3A)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Positioned(
                    top: 100,
                    left: 20,
                    right: 20,
                    child: SizedBox(
                      width: double.infinity,
                      //  new CustomPaint(painter: new Rectangle())
                      child: Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          color: const Color(0xFF0099FF),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/Garig4.png",
                          width: 200,
                          height: 200,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 40),
                          child: Text(
                            "Кпс-ийн гариг",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.only(left: 20, top: 15, bottom: 15),
                    margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/ruby.png",
                              width: 80,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Тайлбар",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "14 оролцогч - 7 даалгавар",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: const Color(0xFF0099FF),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Positioned(
                    right: 50,
                    top: 20,
                    child: Icon(Icons.star, color: Colors.amber, size: 30),
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, top: 35, bottom: 35),
                margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/kfc.png",
                          width: 80,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Шагнал",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "50.000 төгрөгт багтах бүтээгдэхүүний урамшуулал",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    color: const Color(0xFF0099FF),
                    borderRadius: BorderRadius.circular(10)),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * .2,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Icon(Icons.arrow_back,
                              color: Colors.deepOrangeAccent, size: 30),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.deepOrange),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.red),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .6,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Icon(Icons.arrow_forward_ios,
                              color: Colors.amber, size: 30),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.deepOrange),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.red),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
              // Stack(
              //   children: [
              //     Positioned(
              //       top: 15,
              //       left: 20,
              //       right: 20,
              //       child: SizedBox(
              //         width: double.infinity,
              //         // new CustomPaint(painter: new Rectangle())
              //         child: Container(
              //           width: MediaQuery.of(context).size.width * .8,
              //           height: MediaQuery.of(context).size.width * .2,
              //           decoration: BoxDecoration(
              //               color: const Color(0xFF0099FF),
              //               borderRadius: BorderRadius.circular(10)),
              //         ),
              //       ),
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.only(top: 50, left: 20, right: 0),
              //       child: Column(
              //         children: [
              //           Row(
              //             children: [
              //               Image.asset(
              //                 "assets/kfc.png",
              //                 width: MediaQuery.of(context).size.width * .3,
              //               ),
              //               Column(children: [
              //                 Text(
              //                   "Шагнал",
              //                   style: TextStyle(
              //                     color: Colors.white,
              //                     fontSize: 20,
              //                     fontWeight: FontWeight.bold,
              //                   ),
              //                 ),
              //                 Text(
              //                   "50.000 төгрөгт багтах бүтээгдэхүүний урамшуулал",
              //                   style: TextStyle(
              //                     color: Colors.white,
              //                     fontSize: 10,
              //                     // fontWeight: FontWeight.bold,
              //                   ),
              //                 ),
              //               ])
              //             ],
              //           ),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
