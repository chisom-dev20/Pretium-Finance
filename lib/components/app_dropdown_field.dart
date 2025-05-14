import 'package:flutter/material.dart';
import 'package:pretium_finance/resources/app_colors.dart';

class AppDropdownField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final dynamic valueHolder;
  final Widget? prefixWidget;
  final Color? fillColor;
  final bool hasFill;
  final bool required;
  final VoidCallback? onTap;
  final String? valueText;

  const AppDropdownField({
    super.key,
    this.hintText,
    this.labelText,
    this.valueHolder,
    this.prefixWidget,
    this.fillColor,
    this.hasFill = false,
    this.required = false,
    this.onTap,
    this.valueText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: AbsorbPointer(
          child: InputDecorator(
            decoration: InputDecoration(
              isDense: false,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Color.fromRGBO(166, 164, 164, 1),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: AppColors.grey100),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: AppColors.grey100),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  valueText ?? hintText ?? '',
                  style: TextStyle(
                    color: valueText != null ? AppColors.black : AppColors.grey,
                    fontSize: 14,
                  ),
                ),
                const Icon(Icons.arrow_drop_down, color: AppColors.grey),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
