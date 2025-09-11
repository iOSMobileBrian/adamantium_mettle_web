import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/responsive_wrapper.dart';
import '../widgets/app_card.dart';
import '../widgets/footer.dart';

class AppsPage extends StatelessWidget {
  const AppsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;
    final isTablet = screenWidth >= 768 && screenWidth < 1024;
    final isMobile = screenWidth < 768;
    
    return ResponsiveWrapper(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(isMobile ? 16 : (isTablet ? 40 : 80)),
          child: Column(
            children: [
              Text(
                'Our Apps',
                style: TextStyle(
                  fontSize: isMobile ? 28 : (isTablet ? 36 : 42),
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF2C3E50),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                'Discover our collection of innovative mobile applications available on iOS and Android platforms.',
                style: TextStyle(
                  fontSize: isMobile ? 14 : (isTablet ? 16 : 18),
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 60),
              
              // App Store Section
              Text(
                'Available on iOS App Store',
                style: TextStyle(
                  fontSize: isMobile ? 22 : (isTablet ? 28 : 32),
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF2C3E50),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              
              // iOS Apps Grid
              Wrap(
                spacing: isMobile ? 16 : (isTablet ? 24 : 40),
                runSpacing: isMobile ? 16 : (isTablet ? 24 : 40),
                alignment: WrapAlignment.center,
                children: const [
                  AppCard(
                    appName: 'Swift Deliveries',
                    description: 'The Delivery Driver App',
                    category: 'Navigation',
                    platform: 'iOS',
                    price: 'Free',
                    iconUrl: 'https://is1-ssl.mzstatic.com/image/thumb/Purple211/v4/b8/d2/3c/b8d23c16-e447-5271-f5f4-f1ce68d27834/AppIcon-1x_U007ephone-0-1-0-85-220-0.png/1024x1024.jpg',
                    storeUrl: 'https://apps.apple.com/tz/app/swift-deliveries/id1110766374',
                  ),
                  AppCard(
                    appName: 'Stoppage Lite',
                    description: 'Simplified time tracking and productivity tool',
                    category: 'Lifestyle',
                    platform: 'iOS',
                    price: 'Free',
                    iconUrl: 'https://is1-ssl.mzstatic.com/image/thumb/Purple221/v4/58/f8/71/58f871de-0878-afac-b0c7-a403ff6e6317/AppIcon-0-0-1x_U007emarketing-0-10-0-0-85-220.png/1024x1024.jpg',
                    storeUrl: 'https://apps.apple.com/us/app/stoppage-lite/id1027415047',
                  ),
                  AppCard(
                    appName: 'BreakPoint',
                    description: 'The Tennis Recruiting app.',
                    category: 'Sports',
                    platform: 'iOS',
                    price: 'Free',
                    rating: '4.0',
                    iconUrl: 'https://is1-ssl.mzstatic.com/image/thumb/Purple113/v4/89/88/d0/8988d0cf-7c5d-d980-d7ac-9df4dbfb0073/AppIcon-0-1x_U007emarketing-0-0-GLES2_U002c0-512MB-sRGB-0-0-0-85-220-0-0-0-7.png/1024x1024.jpg',
                    storeUrl: 'https://apps.apple.com/tz/app/breakpoint/id1073143216',
                  ),
                ],
              ),
              
              const SizedBox(height: 80),
              
              // Google Play Section
              Text(
                'Available on Google Play Store',
                style: TextStyle(
                  fontSize: isMobile ? 22 : (isTablet ? 28 : 32),
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF2C3E50),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              
              // Android Apps Grid
              Wrap(
                spacing: isMobile ? 16 : (isTablet ? 24 : 40),
                runSpacing: isMobile ? 16 : (isTablet ? 24 : 40),
                alignment: WrapAlignment.center,
                children: const [
                  AppCard(
                    appName: 'Stoppage Lite',
                    description: 'Simplified time tracking and productivity tool',
                    category: 'Lifestyle',
                    platform: 'Android',
                    price: 'Free',
                    iconUrl: 'https://is1-ssl.mzstatic.com/image/thumb/Purple221/v4/58/f8/71/58f871de-0878-afac-b0c7-a403ff6e6317/AppIcon-0-0-1x_U007emarketing-0-10-0-0-85-220.png/1024x1024.jpg',
                    storeUrl: 'https://play.google.com/store/apps/details?id=com.MettleAdamantium.stoppage_lite',
                  ),
                  AppCard(
                    appName: 'ADKEats',
                    description: 'Food delivery and restaurant discovery app',
                    category: 'Food & Drink',
                    platform: 'Android',
                    price: 'Free',
                    iconUrl: 'assets/images/ADK ICON 1024.png',
                    storeUrl: 'https://play.google.com/store/apps/details?id=com.adamantiummettle.adk_eats',
                  ),
                ],
              ),
              
              const SizedBox(height: 60),
              
              // Store Buttons
              isMobile
                  ? Column(
                      children: [
                        _buildStoreButton(
                          'View on App Store',
                          Icons.apple,
                          [const Color(0xFF007AFF), const Color(0xFF0056CC)],
                          'https://apps.apple.com/us/developer/adamantium-mettle-l-l-c/id1027414490',
                        ),
                        const SizedBox(height: 16),
                        _buildStoreButton(
                          'View on Play Store',
                          Icons.android,
                          [const Color(0xFF01875F), const Color(0xFF006241)],
                          'https://play.google.com/store/apps/developer?id=Adamantium+Mettle',
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildStoreButton(
                          'View on App Store',
                          Icons.apple,
                          [const Color(0xFF007AFF), const Color(0xFF0056CC)],
                          'https://apps.apple.com/us/developer/adamantium-mettle-l-l-c/id1027414490',
                        ),
                        const SizedBox(width: 20),
                        _buildStoreButton(
                          'View on Play Store',
                          Icons.android,
                          [const Color(0xFF01875F), const Color(0xFF006241)],
                          'https://play.google.com/store/apps/developer?id=Adamantium+Mettle',
                        ),
                      ],
                    ),
              const SizedBox(height: 60),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStoreButton(
    String label,
    IconData icon,
    List<Color> gradientColors,
    String url,
  ) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(colors: gradientColors),
      ),
      child: ElevatedButton.icon(
        onPressed: () async {
          final uri = Uri.parse(url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          }
        },
        icon: Icon(icon, color: Colors.white),
        label: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        ),
      ),
    );
  }
}