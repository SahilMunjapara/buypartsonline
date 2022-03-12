import 'package:buypartsonline/UI_Helper/colors.dart';
import 'package:buypartsonline/UI_Helper/text_style.dart';
import 'package:buypartsonline/Utils/size_utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  final bool? autoFocus;
  final ValueChanged<String>? onChange;
  final TextStyle? style;
  final String? labelText;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final TextStyle? labelStyle;
  final bool? enabled;
  final bool? obscureText;
  final Widget? suffixIcon;
  final bool? suffixIconTap;
  final bool? readOnly;
  final EdgeInsetsGeometry? contentPadding;
  final FormFieldValidator<String>? validator;
  final Iterable<String>? autofillHints;
  final FocusNode? focusNode;
  final ValueChanged<String>? onFieldSubmitted;
  final EdgeInsetsGeometry? margin;
  final List<TextInputFormatter>? inputFormatters;
  final int maxLength;
  Color containerColor;
  bool passwordField = false;

  // ignore: use_key_in_widget_constructors
  CustomTextField(
      {this.autoFocus,
      this.onChange,
      this.controller,
      this.style,
      this.labelText,
      this.textInputType,
      this.textInputAction,
      this.enabled,
      this.labelStyle,
      this.onFieldSubmitted,
      this.focusNode,
      this.obscureText,
      this.validator,
      this.autofillHints,
      this.readOnly,
      this.contentPadding,
      this.suffixIcon,
      this.suffixIconTap,
      this.margin,
      this.inputFormatters,
      this.maxLength = 255,
      this.containerColor = colorWhite,
      this.passwordField = false});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;

  @override
  void initState() {
    _obscureText = widget.obscureText ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);

    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: Stack(
        children: [
          Container(
            height: SizeUtils().hp(7),
            decoration: BoxDecoration(
                color: widget.containerColor,
                borderRadius: BorderRadius.circular(4)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: TextFormField(
              readOnly: widget.readOnly ?? false,
              keyboardType: widget.textInputType,
              obscureText: _obscureText,
              controller: widget.controller,
              enabled: widget.enabled ?? true,
              maxLength: widget.maxLength,
              focusNode: widget.focusNode,
              validator: widget.validator,
              autofillHints: widget.autofillHints,
              onFieldSubmitted: widget.onFieldSubmitted,
              textInputAction: widget.textInputAction ?? TextInputAction.next,
              inputFormatters: widget.inputFormatters,
              onChanged: widget.onChange,
              autocorrect: false,
              maxLines: 1,
              buildCounter: (BuildContext context,
                      {int? currentLength, int? maxLength, bool? isFocused}) =>
                  null,
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                labelText: widget.labelText,
                contentPadding: widget.contentPadding ??
                    const EdgeInsets.symmetric(vertical: 5),
                labelStyle: widget.labelStyle ??
                    size16PNregular(textColor: colorGrey, letterSpacing: 0.42),
                errorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: colorTransparent),
                ),
                focusedErrorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: colorTransparent),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: colorTransparent),
                ),
                suffixIcon: widget.obscureText ?? false
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          size: 16,
                          color: colorGrey,
                        ),
                      )
                    : widget.suffixIcon,
              ),
              style: widget.style ?? size14PNregular(letterSpacing: 0.42),
            ),
          ),
        ],
      ),
    );
  }
}

/// Container Inside error show Code for Container outside error show above code available

//  return Padding(
//       padding: const EdgeInsets.only(left: 25, right: 25),
//       child: Container(
//         height: SizeUtils().hp(8),
//         decoration: BoxDecoration(
//             color: colorWhite, borderRadius: BorderRadius.circular(4)),
//         margin: widget.margin,
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.only(left: 16),
//             child: TextFormField(
//               readOnly: widget.readOnly ?? false,
//               keyboardType: widget.textInputType,
//               obscureText: _obscureText,
//               controller: widget.controller,
//               enabled: widget.enabled ?? true,
//               maxLength: widget.maxLength,
//               focusNode: widget.focusNode,
//               validator: widget.validator,
//               autofillHints: widget.autofillHints,
//               onFieldSubmitted: widget.onFieldSubmitted,
//               textInputAction: widget.textInputAction ?? TextInputAction.next,
//               inputFormatters: widget.inputFormatters,
//               onChanged: widget.onChange,
//               autocorrect: false,
//               maxLines: 1,
//               buildCounter: (BuildContext context,
//                       {int? currentLength, int? maxLength, bool? isFocused}) =>
//                   null,
//               decoration: InputDecoration(
//                 enabledBorder: InputBorder.none,
//                 labelText: widget.labelText,
//                 contentPadding: widget.contentPadding ??
//                     const EdgeInsets.symmetric(vertical: 5),
//                 labelStyle: widget.labelStyle ??
//                     size16PNregular(textColor: colorGrey, letterSpacing: 0.42),
//                 errorBorder: const UnderlineInputBorder(
//                   borderSide: BorderSide(color: colorTransparent),
//                 ),
//                 focusedErrorBorder: const UnderlineInputBorder(
//                   borderSide: BorderSide(color: colorTransparent),
//                 ),
//                 focusedBorder: const UnderlineInputBorder(
//                   borderSide: BorderSide(color: colorTransparent),
//                 ),
//                 suffixIcon: widget.obscureText ?? false
//                     ? GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             _obscureText = !_obscureText;
//                           });
//                         },
//                         child: Icon(
//                           _obscureText
//                               ? Icons.visibility_off
//                               : Icons.visibility,
//                           size: 16,
//                           color: colorGrey,
//                         ),
//                       )
//                     : widget.suffixIcon,
//               ),
//               style: widget.style ?? size14PNregular(letterSpacing: 0.42),
//             ),
//           ),
//         ),
//       ),
//     );
