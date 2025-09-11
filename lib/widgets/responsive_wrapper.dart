import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'navigation_bar.dart';

class ResponsiveWrapper extends StatelessWidget {
  final Widget body;
  
  const ResponsiveWrapper({
    super.key,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWeb = kIsWeb;
    final isMobile = screenWidth < 768;
    
    // Only show drawer on very small web screens or mobile apps
    final showDrawer = isMobile && (!isWeb || screenWidth < 600);

    return Scaffold(
      appBar: const CustomNavigationBar(),
      drawer: showDrawer ? _buildMobileDrawer(context) : null,
      body: body,
    );
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
            _buildDrawerItem(
              context,
              'Home',
              Icons.home,
              '/',
            ),
            _buildDrawerItem(
              context,
              'Products',
              Icons.inventory,
              '/products',
            ),
            _buildDrawerItem(
              context,
              'Apps',
              Icons.apps,
              '/apps',
            ),
            _buildDrawerItem(
              context,
              'Support',
              Icons.support_agent,
              '/support',
            ),
            _buildDrawerItem(
              context,
              'Contact',
              Icons.contact_mail,
              '/contact',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context,
    String title,
    IconData icon,
    String route,
  ) {
    final isCurrentRoute = GoRouterState.of(context).uri.path == route;
    
    return ListTile(
      leading: Icon(
        icon,
        color: isCurrentRoute ? Colors.blue[300] : Colors.white,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isCurrentRoute ? Colors.blue[300] : Colors.white,
          fontWeight: isCurrentRoute ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      onTap: () {
        Navigator.of(context).pop();
        context.go(route);
      },
    );
  }
}