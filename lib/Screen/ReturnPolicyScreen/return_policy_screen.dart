import 'package:buypartsonline/UI_Helper/colors.dart';
import 'package:buypartsonline/UI_Helper/string.dart';
import 'package:buypartsonline/UI_Helper/text_style.dart';
import 'package:buypartsonline/Utils/size_utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class ReturnPolicyScreen extends StatelessWidget {
  const ReturnPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Strings.returnPolicy,
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
<div _ngcontent-vnt-c134="" _ngcontent-osd-c146=""><div _ngcontent-vnt-c134="" class="content_block text"><h3 _ngcontent-vnt-c134="" style="text-align: center;"><span _ngcontent-vnt-c134="" style="color: #0B2637;"><b _ngcontent-vnt-c134="">Return Policy</b></span></h3><p _ngcontent-vnt-c134=""><span _ngcontent-vnt-c134="" style="color: #000000;">Please, read this first before initiating a return. Raise a query by clicking the <strong _ngcontent-vnt-c134="">Support</strong> button in case of any concerns.</span></p><h3 _ngcontent-vnt-c134="" style="font-size: 14px;"><span _ngcontent-vnt-c134="" style="color: #000000;"><strong _ngcontent-vnt-c134="">Returns</strong> will be accepted only when the following conditions are met:</span></h3><ul _ngcontent-vnt-c134="" style="list-style: disc;"><li _ngcontent-vnt-c134="" style="float: none; display: list-item; padding: 0; margin-left: 40px; width: 100%;"><p _ngcontent-vnt-c134=""><span _ngcontent-vnt-c134="" style="color: #000000;">You may return the product only if request is made within 48 hours from receipt of material and also not later than 10 days from date of Invoice. We reserve the right to reject your request or refund after 10 days.</span></p></li><li _ngcontent-vnt-c134="" style="float: none; display: list-item; padding: 0; margin-left: 40px; width: 100%;"><p _ngcontent-vnt-c134=""><span _ngcontent-vnt-c134="" style="color: #000000;">You must provide our Invoice copy as proof of purchase to accept returns.</span></p></li><li _ngcontent-vnt-c134="" style="float: none; display: list-item; padding: 0; margin-left: 40px; width: 100%;"><p _ngcontent-vnt-c134=""><span _ngcontent-vnt-c134="" style="color: #000000;">You must preserve the packing in original condition and the product returned must be in similar condition at time of receipt and should not have been installed, used or have any signs of fitment. It is compulsory to make a video of unboxing(unpacking) of material at time of receipt. This video has to be sent to &nbsp;<a _ngcontent-vnt-c134="" href="mailto:contact@buypartsonline.in">contact@buypartsonline.in</a> along with return order no after which we would initiate the process of return from our end.</span></p></li><li _ngcontent-vnt-c134="" style="float: none; display: list-item; padding: 0; margin-left: 40px; width: 100%;"><p _ngcontent-vnt-c134=""><span _ngcontent-vnt-c134="" style="color: #000000;">In the case of item’s fault claim, decision will be taken after inspection done by the manufacturer or certified organization.</span></p></li><li _ngcontent-vnt-c134="" style="float: none; display: list-item; padding: 0; margin-left: 40px; width: 100%;"><p _ngcontent-vnt-c134=""><span _ngcontent-vnt-c134="" style="color: #000000;">No returns will be accepted and amount refunded for SPECIAL OFFER items whatsoever.</span></p></li><li _ngcontent-vnt-c134="" style="float: none; display: list-item; padding: 0; margin-left: 40px; width: 100%;"><p _ngcontent-vnt-c134=""><span _ngcontent-vnt-c134="" style="color: #000000;">No returns will be accepted for Imported parts, electrical parts, fragile parts.</span></p></li><li _ngcontent-vnt-c134="" style="float: none; display: list-item; padding: 0; margin-left: 40px; width: 100%;"><p _ngcontent-vnt-c134=""><span _ngcontent-vnt-c134="" style="color: #000000;">No refund for the parts wrongly ordered by the customer.</span></p></li><li _ngcontent-vnt-c134="" style="float: none; display: list-item; padding: 0; margin-left: 40px; width: 100%;"><p _ngcontent-vnt-c134=""><span _ngcontent-vnt-c134="" style="color: #000000;">No returns will be accepted if there is any damage/defect which is not covered under the manufacturer’s warranty.</span></p></li><li _ngcontent-vnt-c134="" style="float: none; display: list-item; padding: 0; margin-left: 40px; width: 100%;"><p _ngcontent-vnt-c134=""><span _ngcontent-vnt-c134="" style="color: #000000;">You may send us an email at &nbsp;<a _ngcontent-vnt-c134="" href="mailto:contact@buypartsonline.in">contact@buypartsonline.in</a> and send your return items only to: (mention address)</span></p></li><li _ngcontent-vnt-c134="" style="float: none; display: list-item; padding: 0; margin-left: 40px; width: 100%;"><p _ngcontent-vnt-c134=""><span _ngcontent-vnt-c134="" style="color: #000000;">Returns accepted by us will be eligible for refund after 20% deduction towards charges incurred by us. </span></p></li><li _ngcontent-vnt-c134="" style="float: none; display: list-item; padding: 0; margin-left: 40px; width: 100%;"><p _ngcontent-vnt-c134=""><span _ngcontent-vnt-c134="" style="color: #000000;">In case of exchange, the time taken for your exchanged product to reach may vary depending on the delivery address. </span></p></li><li _ngcontent-vnt-c134="" style="float: none; display: list-item; padding: 0; margin-left: 40px; width: 100%;"><p _ngcontent-vnt-c134=""><span _ngcontent-vnt-c134="" style="color: #000000;">We allow part shipment return based on above conditions being fulfilled or taken care of. </span></p></li><li _ngcontent-vnt-c134="" style="float: none; display: list-item; padding: 0; margin-left: 40px; width: 100%;"><p _ngcontent-vnt-c134=""><span _ngcontent-vnt-c134="" style="color: #000000;">Once your return is received and inspected, we will send you an email to intimate you that we have received your returned item. We will also intimate you of the approval or rejection of your refund. </span></p></li><li _ngcontent-vnt-c134="" style="float: none; display: list-item; padding: 0; margin-left: 40px; width: 100%;"><p _ngcontent-vnt-c134=""><span _ngcontent-vnt-c134="" style="color: #000000;">If it is approved, then your refund will be processed and a credit will automatically be applied to your original method of payment, within 10 days of our approval. </span></p></li><li _ngcontent-vnt-c134="" style="float: none; display: list-item; padding: 0; margin-left: 40px; width: 100%;"><p _ngcontent-vnt-c134=""><span _ngcontent-vnt-c134="" style="color: #000000;">In order to protect Payer, refunds will be done only through the Original Mode of Payment and to the same account from which it was originated. </span></p></li><li _ngcontent-vnt-c134="" style="float: none; display: list-item; padding: 0; margin-left: 40px; width: 100%;"><p _ngcontent-vnt-c134=""><span _ngcontent-vnt-c134="" style="color: #000000;">Refund will be done only to the bank account of the customer to whom the invoice was raised and Documents proving the ownership of account has to be provided by customer for processing of refund. </span></p></li><li _ngcontent-vnt-c134="" style="float: none; display: list-item; padding: 0; margin-left: 40px; width: 100%;"><p _ngcontent-vnt-c134=""><span _ngcontent-vnt-c134="" style="color: #000000;">Usually, it takes not more than 5 working days for the bank to reflect the refund. If you haven’t received a refund after 5 days, please, contact your bank first. Moreover, If you need details of refund to be presented to the bank, please contact us at &nbsp;<a _ngcontent-vnt-c134="" href="mailto:info@buypartsonline.in">info@buypartsonline.in</a></span></p></li></ul></div></div>
''';

// class ReturnPolicyScreen extends StatefulWidget {
//   const ReturnPolicyScreen({Key? key}) : super(key: key);

//   @override
//   State<ReturnPolicyScreen> createState() => _ReturnPolicyScreenState();
// }

// class _ReturnPolicyScreenState extends State<ReturnPolicyScreen> {
//   var loadingPercentage = 0;
//   @override
//   Widget build(BuildContext context) {
//     SizeUtils().init(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           Strings.returnPolicy,
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
//             initialUrl: returnPolicyURL,
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
