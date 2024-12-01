import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final String? title;
  final BottomNavigationBar? bottomNavigationBar;
  final Widget? floatingActionButton;
  final Widget? child;
  final Color? backgroundColor;

  const DefaultLayout({
    super.key,
    this.title,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.child,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _renderAppBar(),
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
        body: child,
        backgroundColor: backgroundColor ?? Colors.white,
      ),
    );
  }

  AppBar? _renderAppBar() {
    if (title == null) {
      return null;
    } else {
      return AppBar(
        title: Center(
          child: Text(
            title!,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    }
  }
}
