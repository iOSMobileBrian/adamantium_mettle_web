import 'package:flutter/material.dart';
import 'dart:ui_web' as ui_web;
import 'package:web/web.dart' as web;
import '../widgets/footer.dart';

class PrivacyPolicyPage extends StatefulWidget {
  final String appName;
  final String policyUrl;

  const PrivacyPolicyPage({
    super.key,
    required this.appName,
    required this.policyUrl,
  });

  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  late String _viewType;

  @override
  void initState() {
    super.initState();
    _viewType = 'iubenda-privacy-${widget.appName.toLowerCase().replaceAll(' ', '-')}';
    ui_web.platformViewRegistry.registerViewFactory(
      _viewType,
      (int viewId) {
        final iframe = web.HTMLIFrameElement()
          ..src = widget.policyUrl
          ..style.border = 'none'
          ..style.width = '100%'
          ..style.height = '100%'
          ..allow = 'fullscreen';
        return iframe;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = screenWidth < 768;
    // Use most of the viewport height for the iframe (subtract AppBar + title + padding)
    final iframeHeight = screenHeight - (isMobile ? 160.0 : 200.0);

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(isMobile ? 16 : 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.appName} Privacy Policy',
                  style: TextStyle(
                    fontSize: isMobile ? 24 : 36,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF2C3E50),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: iframeHeight,
                  child: HtmlElementView(viewType: _viewType),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    web.window.open(widget.policyUrl, '_blank');
                  },
                  child: const Text('Open full policy in new tab'),
                ),
              ],
            ),
          ),
          const Footer(),
        ],
      ),
    );
  }
}