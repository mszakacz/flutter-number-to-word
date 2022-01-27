import 'package:flutter_number_to_word/const/english_words.dart';
import 'dart:math';

String convertXX(int value) {
  if (value < 20) return to19[value];
  for (int v = 0; v < tens.length; v++) {
    String dcap = tens[v];
    int dval = 20 + 10 * v;
    if (dval + 10 > value) {
      if ((value % 10) != 0) return dcap + "-" + to19[value % 10];
      return dcap;
    }
  }
  return 'error';
}

String toBritish(int value) {
  int hundreds = (value / 100).floor();
  int rest = value % 100;
  String output = to19[hundreds] + ' hundred ' + convertXX(rest);
  return output;
}

String convertXXX(int value) {
  String str = '';
  int hundreds = (value / 100).floor();
  int rest = value % 100;
  if (hundreds > 0) {
    str = to19[hundreds] + ' hundred';
    if (rest > 0) {
      str = str + " and ";
    }
  }
  if (rest > 0) {
    str = str + convertXX(rest);
  }
  return str;
}

String toWord(int value, bool british) {
  if (value > 1000 && value < 2000 && british == true) return toBritish(value);
  if (value < 100) {
    return convertXX(value);
  }
  if (value < 1000) {
    return convertXXX(value);
  }
  for (int v = 0; v < denom.length; v++) {
    int didx = v - 1;
    int dval = pow(1000, v).toInt();
    if (dval > value) {
      int mod = pow(1000, didx).toInt();
      int l = (value / mod).floor();
      int r = value - (l * mod);
      String ret = convertXXX(l) + " " + denom[didx];
      if (r > 0) {
        ret = ret + ", " + toWord(r, british);
      }
      return ret;
    }
  }
  return 'error';
}
