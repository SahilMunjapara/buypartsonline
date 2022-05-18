import 'package:buypartsonline/UI_Helper/colors.dart';
import 'package:buypartsonline/UI_Helper/string.dart';
import 'package:buypartsonline/UI_Helper/text_style.dart';
import 'package:buypartsonline/Utils/size_utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Strings.aboutUs,
          style: size23PNregular(textColor: colorWhite)
            ..copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
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
      body: SingleChildScrollView(
        child: Html(
          data: htmlData,
        ),
      ),
    );
  }
}

const htmlData = ''' 
<div _ngcontent-vnt-c120="" class="icons_block"><h3 _ngcontent-vnt-c120="" style="text-align: center;"><span _ngcontent-vnt-c120="" style="color: #0B2637;"><b _ngcontent-vnt-c120="">About Us</b></span></h3><p _ngcontent-vnt-c120=""> BuyPartsOnline is an upcoming automotive spare parts e-commerce platform, to provide you with all your automotive related parts online. It is dominated and shaped by third party players from outside the industry. With new market players entering the market, and onset of new technologies and increasing customer requirements significantly and sustainably changing the global automotive landscape a new platform is required. Designing a new experience starts with a deep understanding of customers’ wants and needs as well as the consideration of their changing lifestyles and consumption of mobility services. Seamless and meaningful integration of online and offline touchpoints is a key aspect for the entire customer and dealer journey. BuyPartsOnline has tried to just do the same. With a deep understanding of customer requirements it put on offer most of the OES/OEM manufacturers in all the categories required to keep your two wheeler, four wheeler or heavy earth moving the best of condition and running. </p><p _ngcontent-vnt-c120=""> As keeping a check on your vehicle servicing is crucial, getting the best quality spares for a damaged part is essential too and as a matter of fact, we tend to provide both without fail. Buypartsonline is the ultimate source for quality stock. Here you'll find the lowest prices on aftermarket parts and other performance auto parts that you can count on to satisfy your requirements. We offer expert advice, unrivaled customer service, and the convenience of being able to shop right from the comfort of your home. We provide genuine tested products at a reasonable price with a 24×7 customer support centre. We provide you with the best additional services and support for the maximum satisfaction of the customers. That’s why we are the leading online platform to buy spares online at a compatible price. BuyPartsOnline now attempts to solve car spare parts supply issues in every nook and corner of the country. Apart from wide reach, BuyPartsOnline Spares also commands ease of access via its highly optimized mobile app. Keeping in mind the variety of possible spare parts needs, BuyPartsOnline provides the widest range of 100% genuine and top-quality spare parts available at just one tap. BuyPartsOnline hold a unique position in the automotive spares world by providing a large variety of OES and OEM manufacturing Brands. Following a holistic approach BuyPartsOnline also takes into account, the dealers and retailers settled in Tier-2 locations of the country. The very aim behind this initiative was to provide rare and costly automotive spares to small vendors easily at the best price </p><p _ngcontent-vnt-c120=""> Why choose BuyPartsOnline? <br _ngcontent-vnt-c120=""></p><p _ngcontent-vnt-c120=""> BuyPartsOnline Spares ensures complete durability and compatibility of its products, it has an upper hand over the automobile marketing industry. We have successfully established our name over the spare parts market with our loyalty and trustworthiness over customers because of the following reasons: </p><p _ngcontent-vnt-c120=""><span _ngcontent-vnt-c120="" class="font-weight-bold">Professional Advice </span><br _ngcontent-vnt-c120=""> We want to be your only stop for quality all your automobile spares , and we recognize that our customers may need some assistance in choosing the right products. At BuyPartsOnline, we put our customers first, and feel your experience working with us will be pleasant, affordable, straight forward and most importantly, memorable. We grow with our clients and keep your business and your staff equiped, safe and in compliance. We want you to be completely informed on what you can expect from us. Please keep searching our website for answers to many of these parts, service and general automotive maintenance needs. <br _ngcontent-vnt-c120=""></p><p _ngcontent-vnt-c120=""><span _ngcontent-vnt-c120="" class="font-weight-bold">Premium Products </span><br _ngcontent-vnt-c120=""> We stand behind our inventory. We only carry dependable automotive performance parts that allow you to take your vehicle to the next level. <br _ngcontent-vnt-c120=""></p><p _ngcontent-vnt-c120=""> We only sell the genuine aftermarket and general performance parts that we would feel comfortable using ourselves, so buy from BuyPartsonline with complete confidence. </p><p _ngcontent-vnt-c120=""><span _ngcontent-vnt-c120="" class="font-weight-bold">Competitive Pricing </span><br _ngcontent-vnt-c120=""> Whether you need some basic aftermarket parts or a full performance turbo upgrade, we have you covered. We realize that repeat customers are the key to business longevity, so we keep our prices as low as possible. When you shop with BuyPartsOnline, you know you are getting the most value for your money. <br _ngcontent-vnt-c120=""></p><p _ngcontent-vnt-c120=""> It is no secret that upgrading and maintaining your vehicle can get expensive, and that is why automobile users all over the globe choose us. We make it possible to keep your vehicle at the front of the pack—even on a tight budget. </p><p _ngcontent-vnt-c120=""><span _ngcontent-vnt-c120="" class="font-weight-bold">Great Shopping Experience </span><br _ngcontent-vnt-c120=""> Of course, upgrading or maintaining a vehicle is rarely a simple process, but we make getting all the parts you need painless. Our comprehensive website allows you to browse our massive inventory quickly and easily, then you just add the items you need to your cart and check out safely and securely. <br _ngcontent-vnt-c120=""></p><p _ngcontent-vnt-c120=""> We process your orders within 24 hours, and you are ready to hit the track in no time. Our awesome customers keep coming back again and again because we make shopping for performance auto parts fun. </p><p _ngcontent-vnt-c120=""> On the BuyPartsOnline app, you can find the hardest to procure spare parts in a jiffy, thanks to the abundant database of spares belonging to various manufacturers and compatible with most vehicle brands. </p></div>
''';

// class AboutUsScreen extends StatefulWidget {
//   const AboutUsScreen({Key? key}) : super(key: key);

//   @override
//   State<AboutUsScreen> createState() => _AboutUsScreenState();
// }

// class _AboutUsScreenState extends State<AboutUsScreen> {
//   var loadingPercentage = 0;
//   @override
//   Widget build(BuildContext context) {
//     SizeUtils().init(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           Strings.aboutUs,
//           style: size23PNregular(textColor: colorWhite),
//         ),
//         leading: GestureDetector(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: const Icon(
//             Icons.arrow_back_ios_rounded,
//             color: colorWhite,
//           ),
//         ),
//         elevation: 0,
//       ),
//       body: Stack(
//         children: [
//           WebView(
//             initialUrl: aboutUsPageURL,
//             javascriptMode: JavascriptMode.unrestricted,
//             onPageStarted: (url) {
//               setState(() {
//                 loadingPercentage = 0;
//               });
//             },
//             onProgress: (progress) {
//               setState(() {
//                 loadingPercentage = progress;
//               });
//             },
//             onPageFinished: (url) {
//               setState(() {
//                 loadingPercentage = 100;
//               });
//             },
//           ),
//           if (loadingPercentage < 100)
//             const Center(
//               child: CircularProgressIndicator(
//                 valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }
