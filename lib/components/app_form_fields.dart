import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pretium_finance/resources/app_colors.dart';

class SearchTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final void Function()? onTap;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final int maxLines;
  final int? maxLength;
  final bool? obscureText;
  final bool autofocus;
  final bool enabled;

  const SearchTextFormField({
    super.key,
    this.controller,
    this.labelText = '',
    this.hintText = '',
    this.prefixWidget,
    this.suffixWidget,
    this.onChanged,
    this.validator,
    this.inputFormatters,
    this.keyboardType,
    this.maxLines = 1,
    this.autofocus = false,
    this.maxLength,
    this.obscureText,
    this.onTap,
    this.onSubmitted,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        autofocus: autofocus,
        cursorColor: AppColors.primaryColor,
        decoration: InputDecoration(
            prefixIconConstraints:
                const BoxConstraints(maxHeight: 36, maxWidth: 36),
            contentPadding: const EdgeInsets.only(top: 4, left: 10, right: 10),
            hintText: hintText ?? 'AppStrings.search',
            hintStyle: const TextStyle(
              color: AppColors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            border: InputBorder.none,
            prefixIcon: const Padding(
              padding: EdgeInsets.all(10),
              child: Icon(Icons.search),
            )),
        inputFormatters: inputFormatters,
        keyboardType: TextInputType.number,
        controller: controller,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        textInputAction: TextInputAction.search,
        textCapitalization: TextCapitalization.sentences,
      ),
    );
  }
}

class PrimaryTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final int maxLines;
  final int? maxLength;
  final bool obscureText;
  final bool required;
  final bool autofocus;
  final bool enabled;
  final String? helperText;
  final Color? labelTextColor;
  final Color? hintTextColor;

  const PrimaryTextFormField(
      {super.key,
      this.controller,
      this.labelText,
      this.hintText,
      this.prefixWidget,
      this.suffixWidget,
      this.onChanged,
      this.validator,
      this.inputFormatters,
      this.keyboardType,
      this.maxLines = 1,
      this.autofocus = false,
      this.maxLength,
      this.obscureText = false,
      this.onTap,
      this.enabled = true,
      this.required = false,
      this.helperText,
      this.labelTextColor,
      this.hintTextColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Visibility(
          //   visible: labelText != null,
          //   child: Padding(
          //     padding: const EdgeInsets.only(bottom: 6),
          //     child: Row(
          //       children: [
          //         Text(
          //           labelText ?? '',
          //           style: const TextStyle(
          //               color: AppColors.grey,
          //               fontSize: 16,
          //               fontWeight: FontWeight.w400),
          //         ),
          //         Visibility(
          //           visible: required,
          //           child: Text(
          //             helperText ?? ' (Optional)',
          //             style: const TextStyle(
          //                 color: Color.fromRGBO(154, 154, 154, 1),
          //                 fontSize: 13,
          //                 fontWeight: FontWeight.w400),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          SizedBox(
            height: 48,
            child: TextFormField(
              autofocus: autofocus,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              cursorColor: AppColors.primaryColor,
              decoration: InputDecoration(
                prefixIcon: prefixWidget,
                suffixIcon: suffixWidget,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                labelText: labelText ?? '',
                labelStyle:
                    TextStyle(color: labelTextColor ?? AppColors.grey300),
                floatingLabelStyle:
                    const TextStyle(color: AppColors.primaryColor),
                hintText: hintText ?? '',
                hintStyle: TextStyle(
                  color: hintTextColor ?? AppColors.grey300,
                  // color: Color.fromRGBO(166, 164, 164, 1),
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppColors.grey100),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppColors.grey100),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(
                      color: AppColors.primaryColor, width: 2.0),
                ),
              ),
              inputFormatters: inputFormatters,
              keyboardType: keyboardType,
              validator: validator,
              controller: controller,
              onChanged: onChanged,
              obscureText: obscureText,
            ),
          ),
        ],
      ),
    );
  }
}

class LongTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final bool? obscureText;
  final bool autofocus;
  final bool enabled;
  final TextCapitalization? textCapitalization;

  const LongTextFormField({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.prefixWidget,
    this.suffixWidget,
    this.onChanged,
    this.validator,
    this.inputFormatters,
    this.keyboardType,
    this.minLines = 5,
    this.maxLines,
    this.autofocus = false,
    this.maxLength,
    this.obscureText,
    this.onTap,
    this.enabled = true,
    this.textCapitalization,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Visibility(
            visible: labelText != null,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                labelText ?? '',
                style: const TextStyle(
                    color: AppColors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          TextFormField(
            autofocus: autofocus,
            minLines: minLines,
            maxLines: maxLines,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
            cursorColor: AppColors.primaryColor,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              hintText: hintText ?? '',
              hintMaxLines: 3,
              hintStyle: const TextStyle(
                color: AppColors.grey,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.grey100),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.grey100),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide:
                    const BorderSide(color: AppColors.primaryColor, width: 2.0),
              ),
            ),
            inputFormatters: inputFormatters,
            keyboardType: keyboardType,
            validator: validator,
            controller: controller,
            onChanged: onChanged,
            textCapitalization: textCapitalization ?? TextCapitalization.none,
          ),
        ],
      ),
    );
  }
}
