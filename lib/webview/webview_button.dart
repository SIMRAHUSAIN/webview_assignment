import 'package:flutter/material.dart';
import 'package:webview_assignment/utils/dimensions.dart';
import 'package:webview_assignment/utils/string_resources.dart';
import 'package:webview_assignment/utils/text_styles.dart';
import '../utils/colors.dart';

class WebViewButton extends StatefulWidget {
  void Function()? onPressed;
  WebViewButton({Key? key, this.onPressed}) : super(key: key);

  @override
  State<WebViewButton> createState() => _WebViewButtonState();
}

class _WebViewButtonState extends State<WebViewButton> 
  with TickerProviderStateMixin {

  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: Dimensions.horizontalButtonMargin,
        vertical: Dimensions.verticalButtonMargin,
      ),
      height: Dimensions.webviewButtonHeight,
      width: Dimensions.webviewButtonWidth,
      decoration: BoxDecoration(
        color: commonAppThemeColor,
        borderRadius: BorderRadius.circular(Dimensions.webviewCircularRadius)
      ),
      child: TextButton(
        onPressed: widget.onPressed,
        child: Text(
          Strings.webviewButtonText,
          style: TextStylesFile.S16_W600_white,
        ),
      ),
    );
  }
}