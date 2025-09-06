import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'pages/home_page.dart';
import 'pages/products_page.dart';
import 'pages/apps_page.dart';
import 'pages/support_page.dart';
import 'pages/contact_page.dart';

void main() {
  runApp(const MyApp());
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/products',
      builder: (context, state) => const ProductsPage(),
    ),
    GoRoute(
      path: '/apps',
      builder: (context, state) => const AppsPage(),
    ),
    GoRoute(
      path: '/support',
      builder: (context, state) => const SupportPage(),
    ),
    GoRoute(
      path: '/contact',
      builder: (context, state) => const ContactPage(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Adamantium Mettle, L.L.C.',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2C3E50),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Arial',
      ),
      routerConfig: _router,
    );
  }
}
