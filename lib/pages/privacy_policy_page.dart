import 'dart:convert';
import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import 'dart:ui_web' as ui_web;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
  late web.HTMLDivElement _container;
  bool _isLoading = true;
  String? _error;

  String get _apiUrl {
    // https://www.iubenda.com/privacy-policy/123 -> https://www.iubenda.com/api/privacy-policy/123
    return widget.policyUrl.replaceFirst(
      '/privacy-policy/',
      '/api/privacy-policy/',
    );
  }

  @override
  void initState() {
    super.initState();
    _viewType =
        'iubenda-privacy-${widget.appName.toLowerCase().replaceAll(' ', '-')}';

    _container = web.HTMLDivElement()
      ..style.width = '100%'
      ..style.height = '100%'
      ..style.overflow = 'auto';

    ui_web.platformViewRegistry.registerViewFactory(
      _viewType,
      (int viewId) => _container,
    );

    _fetchPolicy();
  }

  Future<void> _fetchPolicy() async {
    try {
      final response = await http.get(Uri.parse(_apiUrl));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        if (data['success'] == true) {
          _container.setProperty('innerHTML'.toJS, (data['content'] as String).toJS);
          if (mounted) setState(() => _isLoading = false);
        } else {
          if (mounted) {
            setState(() {
              _error = 'Policy not available';
              _isLoading = false;
            });
          }
        }
      } else {
        if (mounted) {
          setState(() {
            _error = 'Failed to load policy';
            _isLoading = false;
          });
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = 'Failed to load policy';
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = screenWidth < 768;
    final contentHeight = screenHeight - (isMobile ? 160.0 : 200.0);

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
                if (_isLoading)
                  SizedBox(
                    height: contentHeight,
                    child: const Center(child: CircularProgressIndicator()),
                  )
                else if (_error != null)
                  SizedBox(
                    height: contentHeight,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(_error!),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              web.window.open(widget.policyUrl, '_blank');
                            },
                            child: const Text('View policy on iubenda.com'),
                          ),
                        ],
                      ),
                    ),
                  )
                else
                  SizedBox(
                    height: contentHeight,
                    child: HtmlElementView(viewType: _viewType),
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