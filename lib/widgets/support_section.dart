import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportSection extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String actionText;

  const SupportSection({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.actionText,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            Icon(
              icon,
              size: 64,
              color: const Color(0xFF3498DB),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2C3E50),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              description,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => _handleSupportAction(title),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3498DB),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
              child: Text(
                actionText,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSupportAction(String title) async {
    String url;
    switch (title) {
      case 'Knowledge Base':
        url = 'https://docs.adamantiummettle.com';
        break;
      case 'Live Support':
        url = 'mailto:support@adamantiummettle.com';
        break;
      case 'Training Resources':
        url = 'https://training.adamantiummettle.com';
        break;
      case 'Report Issues':
        url = 'mailto:support@adamantiummettle.com?subject=Issue Report';
        break;
      default:
        url = 'mailto:support@adamantiummettle.com';
    }
    
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}