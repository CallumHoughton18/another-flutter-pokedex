import 'package:flutter/material.dart';

import '../configurations/colors.dart';

class MainAppBar extends AppBar {
  MainAppBar({super.key});

  @override
  Widget? get title => const Text("Pokedex!");

  @override
  double? get elevation => 0;

  @override
  Color? get backgroundColor => AppColors.red;
}
