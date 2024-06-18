import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:greenoville_app/core/widgets/custom_app_bar.dart';

import '../../generated/l10n.dart';

class WebView extends StatefulWidget {
  final String url;
  const WebView(this.url, {super.key});

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).newsPage,
        leadingAction: () {
          Navigator.pop(context);
        },
        centerTitle: true,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri(widget.url),
        ),
      ),
    );
  }
}
