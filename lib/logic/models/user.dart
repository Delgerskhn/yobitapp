import 'package:flutter/cupertino.dart';
import 'token.dart';

@immutable
class User {
  final Token token;
  final String userName;

  const User(this.token, this.userName);
}
