import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yobit/challenge/api/challenge.repository.dart';
import 'package:yobit/challenge/data/challenge.dart';
import 'package:yobit/challenge/ui/widget/slider.dart' as ChallengeSlider;
import 'package:yobit/router/navigation.model.dart';
import './list_test.mocks.dart';
import '../seed.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([NavigationModel, ChallengeRepository, http.Client])
void main() {
  var repo;

  setUpAll(() {
    repo = MockChallengeRepository();
    when(repo.getFeaturedChallenges())
        .thenAnswer((_) => Future(() => challenges));
  });
  testWidgets('Slider should display given featured challenge collection',
      (WidgetTester tester) async {
    await tester.pumpWidget(ChangeNotifierProvider(
        create: (_) => NavigationModel(true),
        child: MaterialApp(
          home: Scaffold(
            body: VStack([
              ChallengeSlider.Slider(
                challengeRepo: repo,
              ),
            ]),
          ),
        )));

    //show loader when future is loading
    await tester.pump();
    expect(find.byType(CircularProgressIndicator), findsWidgets);

    //show actual sliders after loaded

    await tester.pumpAndSettle();

    expect(find.byKey(ValueKey('Title 1')), findsOneWidget);
    expect(find.byKey(ValueKey('Title 2')), findsOneWidget);
  });
}
