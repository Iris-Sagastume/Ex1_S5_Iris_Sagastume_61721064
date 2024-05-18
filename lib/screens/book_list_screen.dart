// lib/screens/book_list_screen.dart
import 'package:flutter/material.dart';
import 'package:examen_1/models/book.dart';
import 'package:examen_1/services/json_service.dart';
import 'package:go_router/go_router.dart';

class BookListScreen extends StatefulWidget {
  const BookListScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BookListScreenState createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  late Future<List<Book>> futureBooks;

  @override
  void initState() {
    super.initState();
    futureBooks = JsonService().fetchBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stephen King Books'),
      ),
      body: FutureBuilder<List<Book>>(
        future: futureBooks,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final books = snapshot.data!;
            return ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) {
                final book = books[index];
                return ListTile(
                  title: Text(book.title),
                  subtitle: Text(book.publisher),
                  onTap: () {
                    context.go('/detail/${book.id}');
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
