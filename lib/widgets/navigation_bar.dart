import 'package:flutter/material.dart';
import 'nav_button.dart';

class CustomNavigationBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF2C3E50),
      elevation: 2,
      title: Row(
        children: [
          const Text(
            'Adamantium Mettle',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const Spacer(),
          const NavButton(title: 'Home', route: '/'),
          const NavButton(title: 'Products', route: '/products'),
          const NavButton(title: 'Apps', route: '/apps'),
          const NavButton(title: 'Support', route: '/support'),
          const NavButton(title: 'Contact', route: '/contact'),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}