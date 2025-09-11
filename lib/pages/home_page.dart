import 'package:flutter/material.dart';
import '../widgets/responsive_wrapper.dart';
import '../widgets/hero_section.dart';
import '../widgets/feature_card.dart';
import '../widgets/footer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;
    final isTablet = screenWidth >= 768 && screenWidth < 1024;
    final isMobile = screenWidth < 768;
    
    return ResponsiveWrapper(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeroSection(),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: isMobile ? 30 : 60,
                horizontal: isMobile ? 16 : (isTablet ? 40 : 80),
              ),
              child: Column(
                children: [
                  Container(
                    width: isMobile ? screenWidth * 0.9 : (isTablet ? 350 : 400),
                    height: isMobile ? 250 : (isTablet ? 280 : 300),
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
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Icon(
                          Icons.developer_mode,
                          size: isMobile ? 80 : (isTablet ? 100 : 120),
                          color: Colors.white,
                        ),
                        Positioned(
                          bottom: isMobile ? 20 : 40,
                          child: Text(
                            'App Development Excellence',
                            style: TextStyle(
                              fontSize: isMobile ? 16 : (isTablet ? 18 : 20),
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: isMobile ? 20 : 40),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(isMobile ? 16 : (isTablet ? 40 : 80)),
              child: Column(
                children: [
                  Text(
                    'Empowering Your Digital Distribution',
                    style: TextStyle(
                      fontSize: isMobile ? 24 : (isTablet ? 30 : 36),
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF2C3E50),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: isMobile ? 20 : 40),
                  isMobile
                      ? Column(
                          children: [
                            const FeatureCard(
                              title: 'Secure Distribution',
                              description: 'Enterprise-grade security for your applications',
                              icon: Icons.security,
                            ),
                            const SizedBox(height: 20),
                            const FeatureCard(
                              title: 'Global Reach',
                              description: 'Distribute your apps worldwide with confidence',
                              icon: Icons.public,
                            ),
                            const SizedBox(height: 20),
                            const FeatureCard(
                              title: '24/7 Support',
                              description: 'Round-the-clock assistance for your business',
                              icon: Icons.support_agent,
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Expanded(
                              child: FeatureCard(
                                title: 'Secure Distribution',
                                description: 'Enterprise-grade security for your applications',
                                icon: Icons.security,
                              ),
                            ),
                            SizedBox(width: isTablet ? 20 : 40),
                            const Expanded(
                              child: FeatureCard(
                                title: 'Global Reach',
                                description: 'Distribute your apps worldwide with confidence',
                                icon: Icons.public,
                              ),
                            ),
                            SizedBox(width: isTablet ? 20 : 40),
                            const Expanded(
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
            const Footer(),
          ],
        ),
      ),
    );
  }
}