/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

class InvalidResultException implements Exception{
  String _message;
  InvalidResultException(String message) {
    _message = message;
  }

  String get message => _message;
}