import 'package:flutter_number_to_word/const/english_words.dart';

String converter(int value) {
  String str = value.toString();
  if (value < 20)
    return to19[value];
  else
    return 'error';
}
