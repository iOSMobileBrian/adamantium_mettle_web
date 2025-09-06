import 'package:flutter/material.dart';
import '../widgets/navigation_bar.dart';
import '../widgets/product_card.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

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
                'Our Development & Distribution Solutions',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C3E50),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                'Full-service app development, deployment, and ongoing maintenance solutions',
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
                    child: ProductCard(
                      title: 'Starter Package',
                      description: 'Perfect for small applications and startups looking to distribute their first app.',
                      features: [
                        'Basic app distribution',
                        'Standard security protocols',
                        'Email support',
                        'Version control',
                        'Standard UX/UI Development',
                        'Multi-platform development for mobile'
                      ],
                      pricing: '\$499 development fee\n\$99/month\n(Monthly covers updates & support)',
                    ),
                  ),
                  SizedBox(width: 40),
                  Expanded(
                    child: ProductCard(
                      title: 'Professional Package',
                      description: 'Comprehensive solution for growing businesses with enhanced features and support.',
                      features: [
                        'Includes all features of Starter package',
                        'Advanced app distribution',
                        'Enhanced security & encryption',
                        'Priority support',
                        'Custom branding options',
                        'API access',
                        'Firebase integration',
                        'Auth services',
                        'Push Notifications',
                        'Web app options'
                      ],
                      pricing: '\$1,499 development fee\n\$299/month\n(Monthly covers updates & support)',
                    ),
                  ),
                  SizedBox(width: 40),
                  Expanded(
                    child: ProductCard(
                      title: 'Enterprise Package',
                      description: 'Full-scale enterprise solution with unlimited distribution and premium support.',
                      features: [
                        'Includes all features of Professional package',
                        'Enterprise-grade security',
                        'Dedicated account manager',
                        'Advanced analytics & reporting',
                        'Full API suite',
                        'AI Integration',
                        'Dedicated engineering team',
                        'AWS Integration',
                        'Unlimited feature development',
                        'Native app development options',
                        'Desktop application options'
                      ],
                      pricing: 'Custom development fee\nMonthly support fee\n(Contact for pricing)',
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