import 'package:flutter/material.dart';

class AlarmBottomSheet extends StatelessWidget {
  final DateTime dateTime;

  const AlarmBottomSheet({
    super.key,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Column(
        children: [
          Text(
            '${dateTime.hour.toString().padLeft(2, '0')} : '
            '${dateTime.minute.toString().padLeft(2, '0')}',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
