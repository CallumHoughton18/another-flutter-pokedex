import 'package:flutter/material.dart';

import '../../configurations/colors.dart';
import '../../utils/extended_math.dart';

class StatBar extends StatelessWidget {
  const StatBar(
      {Key? key,
      required this.label,
      required this.value,
      required this.maxValue,
      required this.progressBarColor,
      required this.labelFlex,
      required this.valueFlex,
      required this.progressBarFlex})
      : super(key: key);

  final String label;
  final int value;
  final int maxValue;
  final Color progressBarColor;
  final int labelFlex;
  final int valueFlex;
  final int progressBarFlex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: labelFlex,
          child: Text(label,
              style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: AppColors.grey)),
        ),
        Expanded(
          flex: valueFlex,
          child: Text(value.toString(),
              style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: AppColors.darkGrey)),
        ),
        Expanded(
          flex: progressBarFlex,
          child: LinearProgressIndicator(
            value: ExtendedMath.normalize(
                value.toDouble(), 0, maxValue.toDouble()),
            backgroundColor: AppColors.offWhite,
            valueColor: AlwaysStoppedAnimation(progressBarColor),
          ),
        ),
      ],
    );
  }
}
