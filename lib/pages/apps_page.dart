import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/navigation_bar.dart';
import '../widgets/app_card.dart';

class AppsPage extends StatelessWidget {
  const AppsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomNavigationBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(80),
          child: Column(
            children: [
              const Text(
                'Our Apps',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C3E50),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                'Discover our collection of innovative mobile applications available on iOS and Android platforms.',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 60),
              
              // App Store Section
              const Text(
                'Available on iOS App Store',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C3E50),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              
              // iOS Apps Grid
              Wrap(
                spacing: 40,
                runSpacing: 40,
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
              const Text(
                'Available on Google Play Store',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C3E50),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              
              // Android Apps Grid
              Wrap(
                spacing: 40,
                runSpacing: 40,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF007AFF), Color(0xFF0056CC)],
                      ),
                    ),
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        final uri = Uri.parse('https://apps.apple.com/us/developer/adamantium-mettle-l-l-c/id1027414490');
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri);
                        }
                      },
                      icon: const Icon(Icons.apple, color: Colors.white),
                      label: const Text(
                        'View on App Store',
                        style: TextStyle(
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
                  ),
                  const SizedBox(width: 20),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF01875F), Color(0xFF006241)],
                      ),
                    ),
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        final uri = Uri.parse('https://play.google.com/store/apps/developer?id=Adamantium+Mettle');
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri);
                        }
                      },
                      icon: const Icon(Icons.android, color: Colors.white),
                      label: const Text(
                        'View on Play Store',
                        style: TextStyle(
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
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}