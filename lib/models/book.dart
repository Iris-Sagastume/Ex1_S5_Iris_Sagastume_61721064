// lib/models/book.dart
class Book {
  final String id;
  final String title;
  final String author;
  final List<Villain> villains;

  Book(
      {required this.id,
      required this.title,
      required this.author,
      required this.villains});

  factory Book.fromJson(Map<String, dynamic> json) {
    var list = json['villains'] as List;
    List<Villain> villainsList = list.map((i) => Villain.fromJson(i)).toList();

    return Book(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      villains: villainsList,
    );
  }
}

// lib/models/villain.dart
class Villain {
  final String name;
  final String description;

  Villain({required this.name, required this.description});

  factory Villain.fromJson(Map<String, dynamic> json) {
    return Villain(
      name: json['name'],
      description: json['description'],
    );
  }
}
