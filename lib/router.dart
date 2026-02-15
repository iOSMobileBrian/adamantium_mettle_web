import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'widgets/responsive_wrapper.dart';
import 'pages/home_content.dart';
import 'pages/apps_content.dart';
import 'pages/support_content.dart';
import 'pages/contact_content.dart';
import 'pages/products_content.dart';
import 'pages/privacy_policy_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return ResponsiveWrapper(body: child);
      },
      routes: [
        GoRoute(
          path: '/',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: HomeContent(),
          ),
        ),
        GoRoute(
          path: '/apps',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: AppsContent(),
          ),
        ),
        GoRoute(
          path: '/support',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: SupportContent(),
          ),
        ),
        GoRoute(
          path: '/contact',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: ContactContent(),
          ),
        ),
        GoRoute(
          path: '/products',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: ProductsContent(),
          ),
        ),
        GoRoute(
          path: '/privacy/breakpoint',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: PrivacyPolicyPage(
              appName: 'BreakPoint',
              policyUrl: 'https://www.iubenda.com/privacy-policy/7790752',
            ),
          ),
        ),
        GoRoute(
          path: '/privacy/swiftdeliveries',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: PrivacyPolicyPage(
              appName: 'Swift Deliveries',
              policyUrl: 'https://www.iubenda.com/privacy-policy/7935395',
            ),
          ),
        ),
        GoRoute(
          path: '/privacy/adkeats',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: PrivacyPolicyPage(
              appName: 'ADKEats',
              policyUrl: 'https://www.iubenda.com/privacy-policy/95073449',
            ),
          ),
        ),
      ],
    ),
  ],
);