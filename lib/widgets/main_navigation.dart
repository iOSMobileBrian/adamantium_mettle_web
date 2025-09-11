import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class MainNavigation extends StatelessWidget implements PreferredSizeWidget {
  final int selectedIndex;
  final Function(int) onNavigationChanged;

  const MainNavigation({
    super.key,
    required this.selectedIndex,
    required this.onNavigationChanged,
  });

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
    final navItems = [
      {'title': 'Home', 'index': 0},
      {'title': 'Products', 'index': 1},
      {'title': 'Apps', 'index': 2},
      {'title': 'Support', 'index': 3},
      {'title': 'Contact', 'index': 4},
    ];

    return navItems.map((item) {
      final isSelected = selectedIndex == item['index'];
      return TextButton(
        onPressed: () => onNavigationChanged(item['index'] as int),
        child: Text(
          item['title'] as String,
          style: TextStyle(
            color: isSelected ? Colors.blue[300] : Colors.white,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 16,
          ),
        ),
      );
    }).toList();
  }

  List<Widget> _buildTabletNavigation() {
    final navItems = [
      {'title': 'Home', 'index': 0},
      {'title': 'Products', 'index': 1},
      {'title': 'Apps', 'index': 2},
      {'title': 'Contact', 'index': 4},
    ];

    return navItems.map((item) {
      final isSelected = selectedIndex == item['index'];
      return TextButton(
        onPressed: () => onNavigationChanged(item['index'] as int),
        child: Text(
          item['title'] as String,
          style: TextStyle(
            color: isSelected ? Colors.blue[300] : Colors.white,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 16,
          ),
        ),
      );
    }).toList();
  }

  Widget _buildMobileDrawer(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xFF2C3E50),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF34495E),
              ),
              child: Text(
                'Adamantium Mettle',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _buildDrawerItem(context, 'Home', Icons.home, 0),
            _buildDrawerItem(context, 'Products', Icons.inventory, 1),
            _buildDrawerItem(context, 'Apps', Icons.apps, 2),
            _buildDrawerItem(context, 'Support', Icons.support_agent, 3),
            _buildDrawerItem(context, 'Contact', Icons.contact_mail, 4),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context,
    String title,
    IconData icon,
    int index,
  ) {
    final isSelected = selectedIndex == index;
    
    return ListTile(
      leading: Icon(
        icon,
        color: isSelected ? Colors.blue[300] : Colors.white,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.blue[300] : Colors.white,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      onTap: () {
        Navigator.of(context).pop();
        onNavigationChanged(index);
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}