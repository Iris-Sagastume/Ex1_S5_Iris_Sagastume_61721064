// lib/core/routes.dart

// lib/core/routes.dart
//import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:examen_1/screens/book_list_screen.dart';
import 'package:examen_1/screens/book_detail_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const BookListScreen(),
    ),
    GoRoute(
      path: '/detail/:id',
      builder: (context, state) {
        final bookId = int.parse(state.pathParameters['id']!);
        return BookDetailScreen(bookId: bookId);
      },
    ),
  ],
);
