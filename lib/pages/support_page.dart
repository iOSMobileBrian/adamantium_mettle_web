import 'package:flutter/material.dart';
import '../widgets/navigation_bar.dart';
import '../widgets/support_section.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

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
                'Support & Resources',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C3E50),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                'We\'re here to help you succeed with comprehensive support and resources',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 60),
              Wrap(
                spacing: 40,
                runSpacing: 40,
                alignment: WrapAlignment.center,
                children: [
                  SizedBox(
                    width: 400,
                    child: SupportSection(
                      icon: Icons.help_center,
                      title: 'Knowledge Base',
                      description: 'Browse our comprehensive documentation, tutorials, and frequently asked questions to find answers quickly.',
                      actionText: 'Browse Documentation',
                    ),
                  ),
                  SizedBox(
                    width: 400,
                    child: SupportSection(
                      icon: Icons.support_agent,
                      title: 'Live Support',
                      description: 'Get real-time assistance from our expert support team available 24/7 to help resolve your issues.',
                      actionText: 'Start Live Chat',
                    ),
                  ),
                  SizedBox(
                    width: 400,
                    child: SupportSection(
                      icon: Icons.school,
                      title: 'Training Resources',
                      description: 'Access video tutorials, webinars, and training materials to maximize your distribution potential.',
                      actionText: 'View Training',
                    ),
                  ),
                  SizedBox(
                    width: 400,
                    child: SupportSection(
                      icon: Icons.bug_report,
                      title: 'Report Issues',
                      description: 'Found a bug or have a feature request? Submit a ticket and our development team will address it.',
                      actionText: 'Submit Ticket',
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