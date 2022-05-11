import 'package:flutter_test/flutter_test.dart';
import 'package:yobit/challenge/api/challenge.repository.dart';
import 'package:mockito/mockito.dart';

class MockChallengeRepo extends Mock implements IChallengeRepository {}

void main() {
  ChallengeRepository challengeRepo = ChallengeRepository();
  setUp(() {});

  test('get featured challenges', () async {
    var result = await challengeRepo.getFeaturedChallenges();
    print(result);
    expect(result.length, greaterThan(0));
  });
}
