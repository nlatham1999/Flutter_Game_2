import 'package:flutter/material.dart';

String getSpriteType(String str) {
  return str.substring(0, 1);
} 

num getSpriteAmount(String str) {
  String substring = str.substring(1);
  return num.parse(substring);
}