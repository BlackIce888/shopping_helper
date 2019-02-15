/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

class ArgumentException implements Exception{
  String _message;
  ArgumentException(String message) {
    _message = message;
  }

  String get message => _message;
}