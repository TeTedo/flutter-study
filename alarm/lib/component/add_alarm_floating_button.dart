import 'package:flutter/material.dart';

class AddAlarmFloatingButton extends StatelessWidget {
  const AddAlarmFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40, right: 10),
      child: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.alarm_add_outlined),
      ),
    );
  }
}
