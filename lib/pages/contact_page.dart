import 'package:flutter/material.dart';
import '../widgets/navigation_bar.dart';
import '../widgets/contact_form.dart';
import '../widgets/contact_info.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

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
                'Contact Us',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C3E50),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                'Ready to get started? We\'d love to hear from you and discuss how we can help with your app distribution needs.',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 60),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: ContactForm(),
                  ),
                  SizedBox(width: 40),
                  Expanded(
                    flex: 1,
                    child: ContactInfo(),
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