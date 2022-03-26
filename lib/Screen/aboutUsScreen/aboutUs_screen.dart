import 'package:buypartsonline/UI_Helper/colors.dart';
import 'package:buypartsonline/UI_Helper/string.dart';
import 'package:buypartsonline/UI_Helper/text_style.dart';
import 'package:buypartsonline/Utils/size_utils/size_utils.dart';
import 'package:buypartsonline/service/network/network_string.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  var loadingPercentage = 0;
  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Strings.aboutUs,
          style: size23PNregular(textColor: colorWhite),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_rounded,
            color: colorWhite,
          ),
        ),
        elevation: 0,
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: aboutUsPageURL,
            javascriptMode: JavascriptMode.unrestricted,
            onPageStarted: (url) {
              setState(() {
                loadingPercentage = 0;
              });
            },
            onProgress: (progress) {
              setState(() {
                loadingPercentage = progress;
              });
            },
            onPageFinished: (url) {
              setState(() {
                loadingPercentage = 100;
              });
            },
          ),
          if (loadingPercentage < 100)
            const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
              ),
            ),
        ],
      ),
    );
    // return Scaffold(
    //   backgroundColor: colorWhiteBackground,
    //   body: Stack(
    //     children: [
    //       const BottomDesignBox(),
    //       Container(
    //         color: primaryColor,
    //         height: SizeUtils().hp(45),
    //         width: SizeUtils().screenWidth,
    //         child: Image.asset(AssetStrings.contactUs),
    //       ),
    //       Align(
    //         alignment: Alignment.bottomCenter,
    //         child: Padding(
    //           padding: const EdgeInsets.symmetric(horizontal: 18),
    //           child: Container(
    //             decoration: const BoxDecoration(
    //               color: colorWhite,
    //               borderRadius: BorderRadius.only(
    //                 topLeft: Radius.circular(18),
    //                 topRight: Radius.circular(18),
    //               ),
    //             ),
    //             height: SizeUtils().hp(65),
    //             width: SizeUtils().screenWidth,
    //             child: Column(
    //               children: [
    //                 verticalSpace(20),
    //                 Center(
    //                   child: Text(
    //                     'Contact Us',
    //                     style: size25PNregular(textColor: primaryColor),
    //                   ),
    //                 ),
    //                 Expanded(
    //                   child: ListView(
    //                     children: [
    //                       Padding(
    //                         padding: const EdgeInsets.symmetric(
    //                             horizontal: 18, vertical: 10),
    //                         child: Text(
    //                           contactUsText,
    //                           textAlign: TextAlign.justify,
    //                           style: size12PNregular(letterSpacing: 1.1),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 )
    //               ],
    //             ),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
