import 'package:flutter/material.dart';
import '../widgets/navigation_bar.dart';
import '../widgets/hero_section.dart';
import '../widgets/feature_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomNavigationBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeroSection(),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 60),
              child: Column(
                children: [
                  Container(
                    width: 400,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFF3498DB), Color(0xFF2C3E50)],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.2),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: const Stack(
                      alignment: Alignment.center,
                      children: [
                        Icon(
                          Icons.developer_mode,
                          size: 120,
                          color: Colors.white,
                        ),
                        Positioned(
                          bottom: 40,
                          child: Text(
                            'App Development Excellence',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(80),
              child: const Column(
                children: [
                  Text(
                    'Empowering Your Digital Distribution',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2C3E50),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: FeatureCard(
                          title: 'Secure Distribution',
                          description: 'Enterprise-grade security for your applications',
                          icon: Icons.security,
                        ),
                      ),
                      SizedBox(width: 40),
                      Expanded(
                        child: FeatureCard(
                          title: 'Global Reach',
                          description: 'Distribute your apps worldwide with confidence',
                          icon: Icons.public,
                        ),
                      ),
                      SizedBox(width: 40),
                      Expanded(
                        child: FeatureCard(
                          title: '24/7 Support',
                          description: 'Round-the-clock assistance for your business',
                          icon: Icons.support_agent,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}