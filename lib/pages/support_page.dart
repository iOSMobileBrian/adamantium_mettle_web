import 'package:flutter/material.dart';
import '../widgets/responsive_wrapper.dart';
import '../widgets/support_section.dart';
import '../widgets/footer.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

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
                'Support & Resources',
                style: TextStyle(
                  fontSize: isMobile ? 28 : (isTablet ? 36 : 42),
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF2C3E50),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                'We\'re here to help you succeed with comprehensive support and resources',
                style: TextStyle(
                  fontSize: isMobile ? 14 : (isTablet ? 16 : 18),
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 60),
              Wrap(
                spacing: isMobile ? 16 : (isTablet ? 24 : 40),
                runSpacing: isMobile ? 16 : (isTablet ? 24 : 40),
                alignment: WrapAlignment.center,
                children: [
                  SizedBox(
                    width: isMobile ? screenWidth * 0.9 : (isTablet ? 350 : 400),
                    child: const SupportSection(
                      icon: Icons.help_center,
                      title: 'Knowledge Base',
                      description: 'Browse our comprehensive documentation, tutorials, and frequently asked questions to find answers quickly.',
                      actionText: 'Browse Documentation',
                    ),
                  ),
                  SizedBox(
                    width: isMobile ? screenWidth * 0.9 : (isTablet ? 350 : 400),
                    child: const SupportSection(
                      icon: Icons.support_agent,
                      title: 'Live Support',
                      description: 'Get real-time assistance from our expert support team available 24/7 to help resolve your issues.',
                      actionText: 'Start Live Chat',
                    ),
                  ),
                  SizedBox(
                    width: isMobile ? screenWidth * 0.9 : (isTablet ? 350 : 400),
                    child: const SupportSection(
                      icon: Icons.school,
                      title: 'Training Resources',
                      description: 'Access video tutorials, webinars, and training materials to maximize your distribution potential.',
                      actionText: 'View Training',
                    ),
                  ),
                  SizedBox(
                    width: isMobile ? screenWidth * 0.9 : (isTablet ? 350 : 400),
                    child: const SupportSection(
                      icon: Icons.bug_report,
                      title: 'Report Issues',
                      description: 'Found a bug or have a feature request? Submit a ticket and our development team will address it.',
                      actionText: 'Submit Ticket',
                    ),
                  ),
                ],
              ),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}