import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../widgets/main_navigation.dart';
import 'home_content.dart';
import 'products_content.dart';
import 'apps_content.dart';
import 'support_content.dart';
import 'contact_content.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeContent(),
    const ProductsContent(),
    const AppsContent(),
    const SupportContent(),
    const ContactContent(),
  ];

  void _onNavigationChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
    final isSelected = _selectedIndex == index;
    
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
        _onNavigationChanged(index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWeb = kIsWeb;
    final isMobile = screenWidth < 768;
    
    // Only show drawer on very small web screens or mobile apps
    final showDrawer = isMobile && (!isWeb || screenWidth < 600);

    return Scaffold(
      appBar: MainNavigation(
        selectedIndex: _selectedIndex,
        onNavigationChanged: _onNavigationChanged,
      ),
      drawer: showDrawer ? _buildMobileDrawer(context) : null,
      body: _pages[_selectedIndex],
    );
  }
}