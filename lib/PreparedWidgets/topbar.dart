import 'package:flutter/material.dart';

class TopBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  const TopBar({Key? key, required this.title}) : super(key: key);

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
      leading: InkWell(
        child: const Icon(Icons.menu),
        onTap: () {},
      ),
      title: Text(widget.title),
      centerTitle: true,
      actions: [
        InkWell(
          child: SizedBox(
            height: AppBar().preferredSize.height,
            width: AppBar().preferredSize.height,
            child: const Icon(Icons.person),
          ),
          onTap: () {
            print('object');
          },
        ),
      ],
    );
  }
}
