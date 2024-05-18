// lib/models/villain.dart
class Villain {
  final String name;
  final String url;

  Villain({
    required this.name,
    required this.url,
  });

  factory Villain.fromJson(Map<String, dynamic> json) {
    return Villain(
      name: json['name'] as String,
      url: json['url'] as String,
    );
  }
}
