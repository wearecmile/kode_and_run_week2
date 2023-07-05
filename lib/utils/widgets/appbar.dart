import 'package:flutter/material.dart';

import '../constants/color_constants.dart';
import '../constants/number_constants.dart';
import '../constants/string_constants.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  final title;
  const Appbar({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title ?? StringConstant.textEmpty,
        style: const TextStyle(color: listTextPrimaryColor,
            fontSize: NumberConstant.doubleThirty,
            fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}
