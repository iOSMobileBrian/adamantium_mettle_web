import 'package:flutter/material.dart';
import '../widgets/product_card.dart';
import '../widgets/footer.dart';

class ProductsContent extends StatelessWidget {
  const ProductsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;
    final isTablet = screenWidth >= 768 && screenWidth < 1024;
    final isMobile = screenWidth < 768;
    
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(isMobile ? 16 : (isTablet ? 40 : 80)),
        child: Column(
          children: [
            Text(
              'Our Development & Distribution Solutions',
              style: TextStyle(
                fontSize: isMobile ? 24 : (isTablet ? 32 : 42),
                fontWeight: FontWeight.bold,
                color: const Color(0xFF2C3E50),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              'Full-service app development, deployment, and ongoing maintenance solutions',
              style: TextStyle(
                fontSize: isMobile ? 14 : (isTablet ? 16 : 18),
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 60),
            isMobile
                ? Column(
                    children: [
                      const ProductCard(
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
                      const SizedBox(height: 20),
                      const ProductCard(
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
                      const SizedBox(height: 20),
                      const ProductCard(
                        title: 'Ultimate Package',
                        description: 'Full-scale enterprise solution with unlimited distribution and premium support.',
                        features: [
                          'Includes all features of Professional package',
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
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
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
                      SizedBox(width: isTablet ? 20 : 40),
                      const Expanded(
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
                      SizedBox(width: isTablet ? 20 : 40),
                      const Expanded(
                        child: ProductCard(
                          title: 'Ultimate Package',
                          description: 'Full-scale enterprise solution with unlimited distribution and premium support.',
                          features: [
                            'Includes all features of Professional package',
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
            const Footer(),
          ],
        ),
      ),
    );
  }
}