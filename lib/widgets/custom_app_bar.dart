import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:messenger/config/language/locale_keys.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    Key? key,
    Color? color,
    List<Widget>? tabs,
    ValueChanged<String>? onSearchChanged,
    ValueChanged<String>? onSearchSubmitted,
    bool isScrollable = false,
    List<Widget>? actions,
    TextEditingController? controller,
  }) : super(
          key: key,
          title: TextField(
            controller: controller,
            onChanged: onSearchChanged,
            onSubmitted: onSearchSubmitted,
            decoration: InputDecoration(
              filled: true,
              hintText: LocaleKeys.search.tr() + "...",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(26),
                  borderSide: BorderSide.none),
              contentPadding: EdgeInsets.symmetric(horizontal: 12),
            ),
          ),
          actions: actions,
          iconTheme: IconThemeData(color: color),
          bottom: (tabs != null)
              ? TabBar(
                  isScrollable: isScrollable,
                  labelColor: color,
                  tabs: tabs,
                )
              : null,
        );
}
