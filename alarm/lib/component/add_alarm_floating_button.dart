import 'package:alarm/component/alarm_bottom_sheet.dart';
import 'package:flutter/material.dart';

class AddAlarmFloatingButton extends StatelessWidget {
  final Function(DateTime) onTimeAdded;

  const AddAlarmFloatingButton({
    super.key,
    required this.onTimeAdded,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40, right: 10),
      child: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return AlarmBottomSheet(
                onTimeAdded: onTimeAdded,
              );
            },
          );
        },
        child: Icon(Icons.alarm_add_outlined),
      ),
    );
  }
}
