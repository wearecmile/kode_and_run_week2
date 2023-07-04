import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WidgetEditTextField extends StatefulWidget {
  //String
  final String textFieldHint;
  final String? helperText;
  final String? counterText;

  //Boolean
  final bool obscureText;
  final bool? isFilled;
  final bool? isEnabled;
  final bool? isReadOnly;

  //Integers
  final int? maxLength;

  //Objects
  final TextInputAction? textInputAction;
  final TextInputType textInputType;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Function onSubmitField;
  final Function? onChanged;
  final Function? onTap;

  final List<TextInputFormatter>? inputFormatter;

  final FocusNode? focusNode;

  const WidgetEditTextField(
      {Key? key,
        required this.textFieldHint,
        required this.textInputType,
        this.textInputAction = TextInputAction.next,
        this.obscureText = false,
        required this.controller,
        this.suffixIcon,
        this.prefixIcon,
        this.maxLength,
        required this.onSubmitField,
        this.onChanged,
        this.helperText,
        this.isFilled = true,
        this.isEnabled,
        this.counterText,
        this.isReadOnly,
        this.inputFormatter,
        this.focusNode,
        this.onTap,
      })
      : super(key: key);

  @override
  State<WidgetEditTextField> createState() => _WidgetEditTextFieldState();
}

class _WidgetEditTextFieldState extends State<WidgetEditTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 10,
        ),
        child: TextField(
          cursorColor:  Color(0xFF6200EE),
          focusNode: widget.focusNode,
          inputFormatters: widget.inputFormatter,
          readOnly: widget.isReadOnly ?? false,
          enabled: widget.isEnabled,
          controller: widget.controller,
          style: const TextStyle(
              fontSize: 14,
              // fontFamily: StringConstant.fontIBMPlexMonoRegular,
              fontWeight: FontWeight.w400),
          decoration: InputDecoration(
            focusColor:  Color(0xFF6200EE),
              labelStyle: TextStyle(
                color: Color(0xFF6200EE),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black12),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF6200EE)),
              ),
              labelText: widget.textFieldHint,
              counterText: "",
              contentPadding: const EdgeInsets.only(
                top: 14,
                bottom: 13,
                left: 18,
              ),
              filled: widget.isFilled,
              hintStyle: const TextStyle(
                  color: Colors.black12,
                  fontSize: 14,
                  // fontFamily: StringConstant.fontIBMPlexMonoRegular,
                  fontWeight: FontWeight.w400),
              hintText: widget.textFieldHint,
               fillColor: Colors.black12,
              suffixIcon: widget.suffixIcon,
              helperText: widget.helperText,
              prefixIcon: widget.prefixIcon),
          keyboardType: widget.textInputType,
          onSubmitted: (value) {
            widget.onSubmitField();
          },
          obscureText: widget.obscureText,
          maxLength: widget.maxLength,
          onChanged: (value) {
            if (widget.onChanged != null) {
              widget.onChanged!();
            }
          },
          onTap: () {
            if (widget.onTap != null) {
              widget.onTap!();
            }
          },
        ));
  }
}
