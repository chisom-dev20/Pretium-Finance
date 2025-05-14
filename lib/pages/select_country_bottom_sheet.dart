import 'package:flutter/material.dart';
import 'package:pretium_finance/resources/app_colors.dart';

class SelectCountryBottomSheet extends StatefulWidget {
  const SelectCountryBottomSheet({super.key, required this.onCountrySelected});

  final Function(String) onCountrySelected;

  @override
  State<SelectCountryBottomSheet> createState() =>
      _SelectCountryBottomSheetState();
}

class _SelectCountryBottomSheetState extends State<SelectCountryBottomSheet> {
  List<String> dropDownItems = [
    'Kenya',
    'Nigeria',
    'Ghana',
    'Uganda',
    'Rwanda',
    'Malawi',
    'Zambia',
    'Global Users [chinese]'
  ];

  String? selectedCountry;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...dropDownItems.map(
          (option) => singleCountry(
            country: option,
            selected: option == selectedCountry,
            onTap: () {
              widget.onCountrySelected.call(option);
              setState(() {
                selectedCountry = option;
              });
            },
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget singleCountry(
      {required String country,
      required bool selected,
      required VoidCallback onTap}) {
    return Material(
      color: AppColors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                country,
                style: TextStyle(
                    color: selected ? AppColors.primaryColor : AppColors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
              Visibility(
                visible: selected,
                child: const Icon(
                  Icons.check_rounded,
                  color: AppColors.primaryColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
