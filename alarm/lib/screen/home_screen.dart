import 'package:alarm/component/add_alarm_floating_button.dart';
import 'package:alarm/component/alarm_detail_screen.dart';
import 'package:alarm/component/default_layout.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = ScrollController();
  bool isHideFloatingButton = false;
  final List<DateTime> alarmList = [];

  @override
  void initState() {
    super.initState();

    controller.addListener(scrollListener);
  }

  void scrollListener() {
    final shouldHideFloatingButton =
        controller.offset > controller.position.maxScrollExtent - 200;

    if (isHideFloatingButton != shouldHideFloatingButton) {
      setState(() {
        isHideFloatingButton = shouldHideFloatingButton;
      });
    }
  }

  void updateAlarm(DateTime newDateTime, int index) {
    setState(() {
      alarmList[index] = newDateTime;
    });
  }

  void deleteAlarm(int index) {
    setState(() {
      alarmList.removeAt(index);
    });
  }

  void addAlarm(DateTime newDateTime) {
    setState(() {
      alarmList.add(newDateTime);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '알람',
      child: ListView.separated(
        controller: controller,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 20,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          if (index == alarmList.length) {
            return SizedBox(height: 20);
          }

          return AlarmDetailScreen(
            dateTime: alarmList[index],
            onTimeChanged: (newDateTime) => updateAlarm(newDateTime, index),
            onTimeDeleted: () => deleteAlarm(index),
          );
        },
        itemCount: alarmList.length + 1,
      ),
      floatingActionButton: isHideFloatingButton
          ? null
          : AddAlarmFloatingButton(
              onTimeAdded: (newDateTime) => addAlarm(newDateTime),
            ),
    );
  }
}
