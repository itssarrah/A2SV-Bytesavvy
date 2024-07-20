
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';



class ChatbotScreen extends StatefulWidget {
  @override
  _ChatbotScreenState createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();

   /* if (Platform.isAndroid) {
      WebViewPlatform.instance = SurfaceAndroidWebView(); // Use SurfaceAndroidWebView for Android
    }*/

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            print('Page started loading: $url');
          },
          onPageFinished: (String url) {
            print('Page finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {
            print('Web resource error: ${error.description}');
          },
          /*onHttpError: (HttpResponseError error) {
            print('HTTP error: ${error.statusCode} ${error.reasonPhrase}');
          },*/
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://app.fastbots.ai/embed/clysy1shu006wr9bc3ky67ekg'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Farmy', 
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.w500,
            )
          ),
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}