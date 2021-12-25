import 'package:flutter/cupertino.dart';

@immutable
class Token {
  final String accessToken;
  final String refreshToken;
  final String expireDate;
  const Token(this.accessToken, this.refreshToken, this.expireDate);
}
