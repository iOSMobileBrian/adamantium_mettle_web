import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavButton extends StatelessWidget {
  final String title;
  final String route;

  const NavButton({
    super.key,
    required this.title,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    final currentLocation = GoRouterState.of(context).uri.path;
    final isSelected = currentLocation == route;
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextButton(
        onPressed: () => context.go(route),
        style: TextButton.styleFrom(
          foregroundColor: isSelected ? const Color(0xFF3498DB) : Colors.white,
          backgroundColor: isSelected ? Colors.white.withValues(alpha: 0.1) : Colors.transparent,
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}