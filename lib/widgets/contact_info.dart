import 'package:flutter/material.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Get in Touch',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2C3E50),
              ),
            ),
            const SizedBox(height: 32),
            const ContactInfoItem(
              icon: Icons.business,
              title: 'Company',
              details: 'Adamantium Mettle, L.L.C.',
            ),
            const SizedBox(height: 24),
            const ContactInfoItem(
              icon: Icons.language,
              title: 'Website',
              details: 'adamantiummettle.com',
            ),
            const SizedBox(height: 24),
            const ContactInfoItem(
              icon: Icons.email,
              title: 'Email',
              details: 'contact@adamantiummettle.com',
            ),
            const SizedBox(height: 24),
            const ContactInfoItem(
              icon: Icons.support,
              title: 'Support',
              details: 'support@adamantiummettle.com',
            ),
            const SizedBox(height: 24),
            const ContactInfoItem(
              icon: Icons.phone,
              title: 'Phone',
              details: '+1 (555) 123-4567',
            ),
            const SizedBox(height: 32),
            const Text(
              'Business Hours',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2C3E50),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Monday - Friday: 9:00 AM - 6:00 PM PST\nSaturday: 10:00 AM - 4:00 PM PST\nSunday: Closed',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactInfoItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String details;

  const ContactInfoItem({
    super.key,
    required this.icon,
    required this.title,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: const Color(0xFF3498DB),
          size: 24,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2C3E50),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                details,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ],
          ),
        ),
      ],
    );
  }
}