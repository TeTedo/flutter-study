import 'package:alarm/component/alarm_bottom_sheet.dart';
import 'package:flutter/material.dart';

class AlarmDetailScreen extends StatelessWidget {
  final DateTime dateTime;
  final Function(DateTime) onTimeChanged;
  final Function onTimeDeleted;

  const AlarmDetailScreen({
    super.key,
    required this.dateTime,
    required this.onTimeChanged,
    required this.onTimeDeleted,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return AlarmBottomSheet(
                dateTime: dateTime,
                onTimeChanged: onTimeChanged,
                onTimeDeleted: onTimeDeleted,
              );
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('오늘 알림'),
              Text(
                '${dateTime.hour.toString().padLeft(2, '0')} : '
                '${dateTime.minute.toString().padLeft(2, '0')}',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
