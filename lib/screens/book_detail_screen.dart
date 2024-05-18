// lib/screens/book_detail_screen.dart
// lib/screens/book_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:examen_1/models/book.dart';
import 'package:examen_1/services/json_service.dart';

class BookDetailScreen extends StatelessWidget {
  final int bookId;

  const BookDetailScreen({super.key, required this.bookId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Details'),
      ),
      body: FutureBuilder<List<Book>>(
        future: JsonService().fetchBooks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final book = snapshot.data!.firstWhere((book) => book.id == bookId);
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(book.title,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold)),
                  Text('By ${book.publisher}',
                      style: const TextStyle(fontSize: 18)),
                  const SizedBox(height: 16),
                  const Text('Villains',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ...book.villains.map((villain) => ListTile(
                        title: Text(villain.name),
                        subtitle: Text(villain.url),
                      )),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
