import 'package:flutter/cupertino.dart';

class ChallengeContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChallengeContainerState();
  }
}

class _ChallengeContainerState extends State<ChallengeContainer> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.extent(
            maxCrossAxisExtent: 150,
            padding: const EdgeInsets.all(4),
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            children: _buildGridTileList(4)));
  }

  List<Container> _buildGridTileList(int count) => List.generate(
      count, (i) => Container(child: Text("Container number $i")));
}
