import 'package:flutter/material.dart';
import 'package:pretium_finance/resources/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color borderColor;
  final Color? overlayColor;
  final bool enabled;
  final EdgeInsets? contentPadding;
  final bool expand;

  const PrimaryButton({
    super.key,
    required this.child,
    this.onTap,
    this.backgroundColor = AppColors.primaryColor,
    this.foregroundColor = Colors.white,
    this.borderColor = Colors.transparent,
    this.overlayColor,
    this.enabled = true,
    this.expand = true,
    this.contentPadding,
  });

  ButtonStyle getStyle() {
    return ButtonStyle(
      fixedSize: MaterialStateProperty.all(
        const Size.fromHeight(55),
      ),
      enableFeedback: true,
      overlayColor: MaterialStateColor.resolveWith(
          (states) => overlayColor ?? Colors.grey.withOpacity(0.2)),
      padding: MaterialStateProperty.all(
        contentPadding ??
            const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
      ),
      textStyle: MaterialStateProperty.all(
        const TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(
            color: AppColors.transparent,
          ),
        ),
      ),
      backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return Colors.grey;
        }
        return backgroundColor;
      }),
      foregroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return AppColors.white;
        }
        return foregroundColor;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        expand
            ? Expanded(
                child: TextButton(
                style: getStyle(),
                onPressed: enabled
                    ? () {
                        onTap?.call();
                      }
                    : null,
                child: child,
              ))
            : TextButton(
                style: getStyle(),
                onPressed: enabled
                    ? () {
                        onTap?.call();
                      }
                    : null,
                child: child,
              )
      ],
    );
  }
}

class PrimaryOutlinedButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color borderColor;
  final Color? overlayColor;
  final bool enabled;
  final EdgeInsets? contentPadding;

  const PrimaryOutlinedButton({
    super.key,
    required this.child,
    this.onTap,
    this.backgroundColor = AppColors.white,
    this.foregroundColor = Colors.white,
    this.borderColor = AppColors.primaryColor,
    this.overlayColor,
    this.enabled = true,
    this.contentPadding,
  });

  ButtonStyle getStyle() {
    return ButtonStyle(
      fixedSize: MaterialStateProperty.all(
        const Size.fromHeight(45),
      ),
      enableFeedback: true,
      overlayColor: MaterialStateColor.resolveWith(
          (states) => overlayColor ?? Colors.grey),
      padding: MaterialStateProperty.all(
        contentPadding ??
            const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
      ),
      textStyle: MaterialStateProperty.all(
        const TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: borderColor,
          ),
        ),
      ),
      backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return Colors.grey;
        }
        return backgroundColor;
      }),
      foregroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return AppColors.white;
        }
        return foregroundColor;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TextButton(
          style: getStyle(),
          onPressed: enabled
              ? () {
                  onTap?.call();
                }
              : null,
          child: child,
        )),
      ],
    );
  }
}
