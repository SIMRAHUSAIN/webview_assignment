import 'package:flutter/material.dart';
import 'package:webview_assignment/utils/colors.dart';
import 'package:webview_assignment/utils/dimensions.dart';
import 'package:webview_assignment/utils/string_resources.dart';
import 'package:webview_assignment/utils/text_styles.dart';
import 'package:webview_assignment/utils/api_urls.dart';
import 'package:webview_assignment/webview/webview_button.dart';
import 'package:webview_assignment/webview/webview_service.dart';
import 'package:webview_flutter/webview_flutter.dart';
// import 'package:webview_assignment/webview/webview_button.dart';
// import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final bucket = PageStorageBucket();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> 
  with TickerProviderStateMixin {

  final PageController pageController = PageController(); 
  int page = 0;

  _onPageChanged(int value) {
    page = value;
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          page == 1 
          ? Strings.webviewPageTitle
          : Strings.homePageTitle,
          style: TextStylesFile.appBarStyle,
        ),
        centerTitle: true,
        leading: page == 1 
        ? IconButton(
          onPressed: () {
            if(page == 1) {
              pageController.jumpToPage(0);
            }
          },
          icon: const Icon(Icons.arrow_back),
        ) : Container()
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: _onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.horizontalButtonMargin,
              vertical: Dimensions.verticalButtonMargin,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    Strings.webviewNavText,
                    style: TextStylesFile.S15_W500_black,
                    textAlign: TextAlign.center,
                  ),
                  WebViewButton(
                    onPressed: () {
                      pageController.jumpToPage(1);
                    },
                  )
                ],
              ),
            ),
          ),
          const WebViewService(url: WebViewUrls.asthaTrades)
        ],
      ),
    );
  }
}