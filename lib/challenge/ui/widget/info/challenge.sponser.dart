import 'package:flutter/material.dart';

class ChallengeSponser extends StatelessWidget {
  const ChallengeSponser({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, top: 35, bottom: 35),
      margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                "assets/images/kfc.png",
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
          color: Theme.of(context).primaryColor, // #E85937
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
