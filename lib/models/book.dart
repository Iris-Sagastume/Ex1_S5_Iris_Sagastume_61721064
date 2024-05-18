// lib/models/book.dart
// lib/models/book.dart
import 'package:examen_1/models/villain.dart';

class Book {
  final int id;
  final int year;
  final String title;
  final String handle;
  final String publisher;
  final String isbn;
  final int pages;
  final List<String> notes;
  final DateTime createdAt;
  final List<Villain> villains;

  Book({
    required this.id,
    required this.year,
    required this.title,
    required this.handle,
    required this.publisher,
    required this.isbn,
    required this.pages,
    required this.notes,
    required this.createdAt,
    required this.villains,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    var notesJson = json['Notes'] as List<dynamic>? ?? [];
    var villainsJson = json['villains'] as List<dynamic>? ?? [];

    return Book(
      id: json['id'] as int,
      year: json['Year'] as int,
      title: json['Title'] as String,
      handle: json['handle'] as String,
      publisher: json['Publisher'] as String,
      isbn: json['ISBN'] as String,
      pages: json['Pages'] as int,
      notes: notesJson.map((note) => note as String).toList(),
      createdAt: DateTime.parse(json['created_at'] as String),
      villains: villainsJson.map((v) => Villain.fromJson(v)).toList(),
    );
  }
}
