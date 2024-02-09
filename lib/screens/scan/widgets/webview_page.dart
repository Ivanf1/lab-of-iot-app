import 'package:flutter/material.dart';
import 'package:sm_iot_lab/constants/colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final String url;
  final String name;
  const WebViewPage({super.key, required this.url, required this.name});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late final WebViewController _controller;
  bool _isLoading = true;
  bool _error = false;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onProgress: (progress) {
          if (progress > 15 && _isLoading) {
            setState(() {
              _isLoading = false;
            });
          }
        },
        onWebResourceError: (error) {
          setState(() {
            _error = true;
          });
        },
      ))
      ..setJavaScriptMode(JavaScriptMode.disabled)
      ..loadRequest(
        Uri.parse(widget.url),
      );
  }

  Widget _buildView() {
    if (_isLoading) return const Center(child: CircularProgressIndicator());
    if (_error) return const Center(child: Text("error"));
    return WebViewWidget(controller: _controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        elevation: 0,
        // automaticallyImplyLeading: false,
        backgroundColor: AppColors.bgGray,
        bottomOpacity: 1,
        scrolledUnderElevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: _buildView(),
      ),
    );
  }
}
