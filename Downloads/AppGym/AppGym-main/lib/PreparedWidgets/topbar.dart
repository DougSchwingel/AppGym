import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/Menus/sidemenu.dart';

class TopBar extends StatefulWidget implements PreferredSizeWidget {
  final IconButton? returnButton;
  final String title;
  final IconButton? isSignIn;
  const TopBar(
      {Key? key, required this.title, this.returnButton, this.isSignIn})
      : super(key: key);

  @override
  State<TopBar> createState() => _TopBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: widget.returnButton ?? Container(),
      title: Text(widget.title),
      centerTitle: true,
      actions: [
        InkWell(
          child: SizedBox(
            height: AppBar().preferredSize.height,
            width: AppBar().preferredSize.height,
            child: widget.isSignIn != null
                ? Container()
                : const Icon(Icons.person),
          ),
          onTap: () {
            showAlignedDialog(
              context: context,
              builder: (BuildContext context) => const SideMenu(),
              targetAnchor: Alignment.centerLeft,
              isGlobal: true,
              followerAnchor: Alignment.bottomRight,
              barrierDismissible: true,
              transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                  Widget child) {
                return SlideTransition(
                  position: Tween(
                    begin: const Offset(0.50, -0.03),
                    end: const Offset(0.30, -0.03),
                  ).animate(animation),
                  child: FadeTransition(
                    opacity: CurvedAnimation(
                      parent: animation,
                      curve: Curves.easeOut,
                    ),
                    child: child,
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
