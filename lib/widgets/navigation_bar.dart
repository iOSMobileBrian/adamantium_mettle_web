import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'nav_button.dart';

class CustomNavigationBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWeb = kIsWeb;
    final isDesktop = screenWidth >= 1024;
    final isTablet = screenWidth >= 768 && screenWidth < 1024;
    final isMobile = screenWidth < 768;

    // On web, show website-style navigation even on smaller screens
    final showWebNavigation = isWeb && screenWidth >= 600;

    return AppBar(
      backgroundColor: const Color(0xFF2C3E50),
      elevation: 2,
      iconTheme: const IconThemeData(color: Colors.white),
      automaticallyImplyLeading: !showWebNavigation,
      title: Row(
        children: [
          Text(
            (isMobile && !isWeb) ? 'AM' : 'Adamantium Mettle',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: (isMobile && !isWeb) ? 18 : 20,
            ),
          ),
          const Spacer(),
          if (showWebNavigation || isDesktop) ..._buildFullNavigation(),
          if (isTablet && !isWeb) ..._buildTabletNavigation(),
        ],
      ),
    );
  }

  List<Widget> _buildFullNavigation() {
    return [
      const NavButton(title: 'Home', route: '/'),
      //const NavButton(title: 'Products', route: '/products'),
      const NavButton(title: 'Apps', route: '/apps'),
      const NavButton(title: 'Support', route: '/support'),
      const NavButton(title: 'Contact', route: '/contact'),
    ];
  }

  List<Widget> _buildTabletNavigation() {
    return [
      const NavButton(title: 'Home', route: '/'),
      //const NavButton(title: 'Products', route: '/products'),
      const NavButton(title: 'Apps', route: '/apps'),
      const NavButton(title: 'Contact', route: '/contact'),
    ];
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}