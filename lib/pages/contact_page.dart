import 'package:flutter/material.dart';
import '../widgets/responsive_wrapper.dart';
import '../widgets/contact_form.dart';
import '../widgets/contact_info.dart';
import '../widgets/footer.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

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
                'Contact Us',
                style: TextStyle(
                  fontSize: isMobile ? 28 : (isTablet ? 36 : 42),
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF2C3E50),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                'Ready to get started? We\'d love to hear from you and discuss how we can help with your app distribution needs.',
                style: TextStyle(
                  fontSize: isMobile ? 14 : (isTablet ? 16 : 18),
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 60),
              isMobile
                  ? const Column(
                      children: [
                        ContactForm(),
                        SizedBox(height: 40),
                        ContactInfo(),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(
                          flex: 2,
                          child: ContactForm(),
                        ),
                        SizedBox(width: isTablet ? 20 : 40),
                        const Expanded(
                          flex: 1,
                          child: ContactInfo(),
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