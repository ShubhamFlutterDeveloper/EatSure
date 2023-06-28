  // ignore_for_file: must_be_immutable, depend_on_referenced_packages, file_names
  import 'package:flutter/services.dart';
  import 'package:sizer/sizer.dart';
  import 'package:flutter/material.dart';

  class TextFieldWidget extends StatefulWidget {
    final String hintText;
    final String ?labelText;
    final TextEditingController controller;
    final FormFieldValidator<String?>? validatorText;
    final InputBorder? border;
    final Widget? suffixIcon;
    final bool? readonly;
     bool? expands;
    final int? maxLines;
    final int? minLines;
    final Widget? prefixIcon;
    final TextStyle? hintStyle;
    final TextStyle? style;
    final TextInputType? textInputType;
    final EdgeInsetsGeometry? contentPadding;
    final TextInputAction? textInputAction;
    final VoidCallback? onTap;
    final double? borderRadius;
    final FocusNode? focusNode;
    final bool? autofocus;
    final bool? isTextFilled;
    final TextInputFormatter? textInputFormatter;
    bool obscureText;
    void Function(String)? onChanged;
    void Function(String)? onSubmitted;
    final bool? isNameScreen;
    final bool? isOtpScreen;
    final TextAlign? textAlign;
    final Color? cursorColor;
    final Color? fillcolor;
    final VoidCallback? onEditingComplete;
    Gradient? gradient;

    TextFieldWidget({
      Key? key,
      required this.hintText,
      this.labelText,
      required this.controller,
      this.validatorText,
      this.border,
      this.fillcolor,
      this.gradient,
      this.minLines,
      this.suffixIcon,
      this.obscureText = false,
      this.isTextFilled = false,
      this.textInputType,
      this.textInputAction,
      this.onTap,
      this.textInputFormatter,
      this.prefixIcon,
      this.contentPadding,
      this.readonly,
      this.borderRadius,
      this.focusNode,
      this.autofocus,
      this.hintStyle,
      this.maxLines,
      this.onChanged,
      this.onSubmitted,
      this.style,
      this.isNameScreen,
      this.isOtpScreen,
      this.textAlign,
      this.cursorColor,
      this.onEditingComplete, this.expands,
    }) : super(key: key);

    @override
    State<TextFieldWidget> createState() => _TextFieldWidgetState();
  }

  class _TextFieldWidgetState extends State<TextFieldWidget> {
    @override
    Widget build(BuildContext context) {
      return TextFormField(
        onChanged: widget.onChanged,
        onFieldSubmitted: widget.onSubmitted,
        maxLines: widget.maxLines ?? 1,
        expands: widget.expands ?? false,
        minLines: widget.minLines,
        readOnly: widget.readonly ?? false,
        style: widget.style??TextStyle(color: Colors.black,fontSize: 14.sp),
        controller: widget.controller,
        cursorColor: widget.cursorColor??Colors.black,
        textAlign: widget.textAlign ?? TextAlign.start,
        inputFormatters: [
          widget.textInputFormatter ??
              FilteringTextInputFormatter.singleLineFormatter,
          widget.isNameScreen == true
              ? FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]"))
              : FilteringTextInputFormatter.singleLineFormatter,
        ],
        obscureText: widget.obscureText,
        autofocus: widget.autofocus ?? false,
        focusNode: widget.focusNode,
        onEditingComplete: widget.onEditingComplete,
        validator: widget.validatorText,
        keyboardType: widget.textInputType ?? TextInputType.visiblePassword,
        onTap: widget.onTap,

        textInputAction: widget.textInputAction,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(10.0),),
          enabledBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(10.0),),
          fillColor: widget.fillcolor,
          border: InputBorder.none,
          errorMaxLines: 2,
          filled: true,
          contentPadding: widget.contentPadding,
          hintText: widget.hintText,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          hintStyle: widget.hintStyle??TextStyle(color: Colors.white.withOpacity(0.1)),
        ),
      );
    }
  }
