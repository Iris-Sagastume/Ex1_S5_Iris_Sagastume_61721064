// lib/screens/book_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:examen_1/models/book.dart';
import 'package:examen_1/services/json_service.dart';

class BookDetailScreen extends StatelessWidget {
  final String bookId;

  BookDetailScreen({required this.bookId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Details'),
      ),
      body: FutureBuilder<List<Book>>(
        future: JsonService().fetchBooks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
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
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  Text('By ${book.author}', style: TextStyle(fontSize: 18)),
                  SizedBox(height: 16),
                  Text('Villains',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ...book.villains.map((villain) => ListTile(
                        title: Text(villain.name),
                        subtitle: Text(villain.description),
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
