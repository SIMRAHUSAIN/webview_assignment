// ignore_for_file: unused_field, avoid_print, depend_on_referenced_packages, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewService extends StatefulWidget {
  final url;
  const WebViewService({Key? key, this.url}) : super(key: key);

  @override
  State<WebViewService> createState() => _WebViewServiceState();
}

class _WebViewServiceState extends State<WebViewService> 
    with AutomaticKeepAliveClientMixin {
  
  WebViewController? _webViewController;
  bool isLoading=true;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SafeArea(
        child: IgnorePointer(
          ignoring: isLoading,
          child: Stack(
            children: [
              WebView(
                initialUrl: widget.url,
                javascriptMode: JavascriptMode.unrestricted,
                onPageFinished: (finish) {
                  setState(() {
                    isLoading = false;
                  });
                },
              ),
              isLoading ? Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.grey.withOpacity(0.4),
                child: const Center(child: CircularProgressIndicator()),
              ) : Container(),
            ],
          ),
        ),
      ),
    );
  }
}