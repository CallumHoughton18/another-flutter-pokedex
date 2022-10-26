import 'package:flutter/material.dart';

import '../../configurations/colors.dart';

class DetailsLabel extends Text {
  const DetailsLabel(String text, {super.key})
      : super(text,
            style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: AppColors.grey));
}
