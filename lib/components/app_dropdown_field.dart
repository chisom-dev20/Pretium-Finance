import 'package:flutter/material.dart';
import 'package:pretium_finance/resources/app_colors.dart';

// class AppDropdownField extends StatelessWidget {
//   final List<String>? items;
//   final List<DropdownMenuItem<dynamic>>? dropdownItems;
//   final bool stringItems;
//   final void Function(dynamic)? onChanged;
//   final String? Function(dynamic)? validator;
//   final String? hintText;
//   final String? labelText;
//   final dynamic valueHolder;
//   final Widget? prefixWidget;
//   final Color? fillColor;
//   final bool hasFill;
//   final bool required;

//   const AppDropdownField({
//     super.key,
//     this.items,
//     this.stringItems = true,
//     this.dropdownItems,
//     this.onChanged,
//     this.hintText,
//     this.prefixWidget,
//     this.fillColor,
//     this.hasFill = false,
//     this.required = false,
//     this.validator,
//     this.valueHolder,
//     this.labelText,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 15),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Visibility(
//             visible: labelText != null,
//             child: Padding(
//               padding: const EdgeInsets.only(bottom: 6),
//               child: Row(
//                 children: [
//                   Text(
//                     labelText ?? '',
//                     style: const TextStyle(
//                         color: AppColors.primaryColor,
//                         fontSize: 14,
//                         fontWeight: FontWeight.w400),
//                   ),
//                   Visibility(
//                     visible: required,
//                     child: const Text(
//                       '*',
//                       style: TextStyle(
//                           color: Color.fromRGBO(255, 54, 36, 0.5),
//                           fontSize: 14,
//                           fontWeight: FontWeight.w400),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 48,
//             child: DropdownButtonFormField<dynamic>(
//               //menuMaxHeight: 100,
//               isExpanded: true,
//               validator: validator,
//               value: valueHolder,
//               icon: const Icon(
//                 Icons.arrow_drop_down,
//                 color: AppColors.grey,
//               ),
//               style: const TextStyle(
//                 overflow: TextOverflow.ellipsis,
//                 color: AppColors.black,
//                 // fontFamily: AppFonts.defaultFont,
//               ),
//               decoration: InputDecoration(
//                 contentPadding: const EdgeInsets.only(
//                     left: 10,
//                     top: 10,
//                     right: 10),
//                 hintText: hintText,
//                 hintStyle: const TextStyle(
//                   color: Color.fromRGBO(166, 164, 164, 1),
//                   fontSize: 14,
//                   fontWeight: FontWeight.w400,
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius:
//                       BorderRadius.circular(10),
//                   borderSide: const BorderSide(color: AppColors.grey100),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius:
//                       BorderRadius.circular(10),
//                   borderSide: const BorderSide(color: AppColors.grey100),
//                 ),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(4),
//                   borderSide: const BorderSide(
//                       color: AppColors.grey100, width: 2.0),
//                 ),
//               ),
//               items: stringItems == true
//                   ? (items ?? [])
//                       .map((e) => DropdownMenuItem<String>(
//                             value: e,
//                             child: Text(e),
//                           ))
//                       .toList()
//                   : (dropdownItems ?? []),
//               onChanged: onChanged,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

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
