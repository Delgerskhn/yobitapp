import 'package:flutter/cupertino.dart';
import 'package:yobit/constants/infrastructure/paths.dart';

class ChallengeContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChallengeContainerState();
  }
}

class _ChallengeContainerState extends State<ChallengeContainer> {
  var challenges = [1, 2, 3];

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Text('lkjsdf'));
    //  GridView.extent(
    //     maxCrossAxisExtent: 200,
    //     padding: const EdgeInsets.all(4),
    //     mainAxisSpacing: 15,
    //     crossAxisSpacing: 15,
    //     children: _buildGridTileList()));
  }

  List<Container> _buildGridTileList() => challenges
      .map((i) => Container(
              child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            child: Image.asset(
              Paths.specialChallenge,
              fit: BoxFit.cover,
            ),
          )))
      .toList();
}
