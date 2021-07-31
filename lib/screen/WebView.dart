import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebView extends StatefulWidget {
  const MyWebView({Key? key}) : super(key: key);

  @override
  _MyWebViewState createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {
  @override
  Widget build(BuildContext context) {
    return _buildWebView();
  }

  Widget _buildWebView() {
    return Stack(
      children: <Widget>[
        WebView(
          // key: _key,
          initialUrl:
              'https://m.youtube.com/channel/UC6ZMcidkuQa0BfnbirJIbig/videos',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ],
    );
  }
}
