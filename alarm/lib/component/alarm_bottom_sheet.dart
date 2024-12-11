import 'package:flutter/material.dart';

class AlarmBottomSheet extends StatefulWidget {
  final DateTime? dateTime;
  final Function(DateTime)? onTimeChanged;
  final Function? onTimeDeleted;
  final Function(DateTime)? onTimeAdded;

  const AlarmBottomSheet({
    super.key,
    this.dateTime,
    this.onTimeChanged,
    this.onTimeAdded,
    this.onTimeDeleted,
  });

  @override
  State<AlarmBottomSheet> createState() => _AlarmBottomSheetState();
}

class _AlarmBottomSheetState extends State<AlarmBottomSheet> {
  late TimeOfDay selectedTime;

  @override
  void initState() {
    super.initState();

    if (widget.dateTime != null) {
      selectedTime = TimeOfDay.fromDateTime(widget.dateTime!);
    } else {
      selectedTime = TimeOfDay.now();
    }
  }

  void _pickTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );

    print('$picked');

    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  _updateDateTime() {
    final newDateTime = DateTime(
      widget.dateTime!.year,
      widget.dateTime!.month,
      widget.dateTime!.day,
      selectedTime.hour,
      selectedTime.minute,
    );

    widget.onTimeChanged!(newDateTime);
    Navigator.of(context).pop();
  }

  _deleteDateTime() {
    widget.onTimeDeleted!();
    Navigator.of(context).pop();
  }

  _addDateTime() {
    final now = DateTime.now();
    final newDateTime = DateTime(
      now.year,
      now.month,
      now.day,
      selectedTime.hour,
      selectedTime.minute,
    );

    widget.onTimeAdded!(newDateTime);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: _pickTime,
              child: Text('시간 선택'),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                ),
                child: Text(
                  '${selectedTime!.format(context)}',
                  style: TextStyle(
                    fontSize: 32,
                  ),
                ),
              ),
            ),
            if (widget.onTimeAdded != null)
              ElevatedButton(
                onPressed: _addDateTime,
                child: Text('생성'),
              ),
            if (widget.onTimeChanged != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: _deleteDateTime,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.red,
                    ),
                    child: Text('삭제'),
                  ),
                  ElevatedButton(
                    onPressed: _updateDateTime,
                    child: Text('완료'),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
