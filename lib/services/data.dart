import 'package:flutter/services.dart';

Future getData(
  String filePath,
) async {
  try {
    final data = await rootBundle.loadString(filePath);
    return data;
  } catch (e) {
    throw NoInternetException;
  }
}

class NoInternetException implements Exception {}
