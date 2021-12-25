import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:yobit/logic/view_models/user.view.model.dart';

class MockUserViewModel extends Mock implements UserViewModel {}

class FakeContext extends Fake implements BuildContext {}
