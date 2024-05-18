// lib/services/json_service.dart
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:examen_1/models/book.dart';

class JsonService {
  Future<List<Book>> fetchBooks() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response);
    return (data['books'] as List).map((book) => Book.fromJson(book)).toList();
  }
}
