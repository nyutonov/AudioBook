import 'package:flutter/material.dart';

class AppBarComponent extends StatelessWidget implements PreferredSizeWidget {
  final String appBarName;
  final Color appBarColor;
  final Color textColor;
  final Icon leadingIcon;
  final Icon action;

  const AppBarComponent({
    super.key,
    required this.appBarName,
    required this.appBarColor,
    required this.textColor,
    required this.leadingIcon,
    required this.action
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
        child: Text(
          appBarName,
          style: TextStyle(
            color: textColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: 'Nui Neue'
          ),
        ),
      ),
      leading: IconButton(
        icon: leadingIcon,
        tooltip: 'Back',
        onPressed: () { Navigator.pop(context); },
      ),
      actions: [
        IconButton(
          icon: action,
          tooltip: 'More',
          onPressed: () {  },
        ),
      ],
      elevation: 0,
      backgroundColor: appBarColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}