import 'package:bloc_auth/core/enum/button_type.dart';
import 'package:bloc_auth/design/atom/button/custom_button_args.dart';
import 'package:bloc_auth/design/theme/app_color.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.customButtonArgs,
    super.key,
  });

  final CustomButtonArgs customButtonArgs;

  static const Map<ButtonType, double> _buttonHeights = {
    ButtonType.large: 60.0,
    ButtonType.medium: 55.0,
    ButtonType.small: 50.0,
  };

  static const Map<ButtonType, double> _fontSizes = {
    ButtonType.large: 18.0,
    ButtonType.medium: 15.0,
    ButtonType.small: 13.0,
  };

  static const Map<ButtonType, double> _spinnerSizes = {
    ButtonType.large: 20.0,
    ButtonType.medium: 18.0,
    ButtonType.small: 16.0,
  };

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: customButtonArgs.isLoading ? null : customButtonArgs.onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return customButtonArgs.filled
                  ? customButtonArgs.filledColor
                  : Colors.transparent;
            }
            return customButtonArgs.filled
                ? customButtonArgs.filledColor
                : Colors.transparent;
          },
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return Colors.white;
            }
            return customButtonArgs.filled
                ? Colors.white
                : customButtonArgs.filledColor;
          },
        ),
        side: MaterialStateProperty.all(
          BorderSide(
            color: customButtonArgs.filledColor,
          ),
        ),
        elevation: MaterialStateProperty.all(0),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        minimumSize: MaterialStateProperty.all(
          Size(double.infinity, _buttonHeights[customButtonArgs.type]!),
        ),
      ),
      child: customButtonArgs.isLoading
          ? SizedBox(
              height: _spinnerSizes[customButtonArgs.type],
              width: _spinnerSizes[customButtonArgs.type],
              child: CircularProgressIndicator(
                key: const Key('buttonLoadingIndicator'),
                strokeWidth: 2,
                color: customButtonArgs.filled
                    ? Colors.white
                    : customButtonArgs.filledColor,
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (customButtonArgs.icon != null)
                  Icon(
                    customButtonArgs.icon,
                    color: customButtonArgs.filled
                        ? Colors.white
                        : customButtonArgs.onPressed == null
                            ? AppColors.primaryDisabled
                            : AppColors.primaryColor,
                    size: customButtonArgs.size,
                  ),
                if (customButtonArgs.icon != null)
                  const SizedBox(
                    width: 10,
                  ),
                Text(
                  customButtonArgs.label,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: _fontSizes[customButtonArgs.type],
                        fontWeight: FontWeight.w600,
                        color: customButtonArgs.filled
                            ? customButtonArgs.btnTextColor
                            : customButtonArgs.onPressed == null
                                ? AppColors.primaryDisabled
                                : AppColors.primaryColor,
                        height: 1.33,
                      ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
    );
  }
}
