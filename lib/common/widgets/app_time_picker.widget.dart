/*
import 'package:vocabulary_day_by_day/common/widgets/rounded_button.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimeRange {
  static List<String> hours =
      List.generate(24, (index) => index < 10 ? "0$index" : "$index");
  static List<String> minutes =
      List.generate(60, (index) => index < 10 ? "0$index" : "$index");
}

class AppTimePicker extends StatefulWidget {
  final Function(TimeOfDay) onSaveTime;
  final DateTime dueDate;
  final TimeOfDay? time;
  final int minuteInterval;
  final bool disablePrevious;
  final DateTime? minimumDate;
  final DateTime? maximumDate;

  const AppTimePicker({
    Key? key,
    required this.onSaveTime,
    required this.time,
    required this.dueDate,
    this.disablePrevious = true,
    this.minuteInterval = 1,
    this.minimumDate,
    this.maximumDate,
  }) : super(key: key);

  @override
  _AppTimePickerState createState() => _AppTimePickerState();
}

class _AppTimePickerState extends State<AppTimePicker> {
  final _now = DateTime.now();

  DateTime get _initTime =>
      DateTime(_now.year, _now.month, _now.day, _now.hour, _now.minute)
          .add(const Duration(minutes: 1));

  DateTime get _timeNow =>
      DateTime(_now.year, _now.month, _now.day, _now.hour, _now.minute)
          .add(const Duration(minutes: 1));

  int _hour = 0;
  int _minute = 0;

  @override
  void initState() {
    if (widget.time != null) {
      _hour = widget.time!.hour;
      _minute = widget.time!.minute;
    } else {
      _hour = _initTime.hour;
      _minute = _initTime.minute;
    }
    if (widget.minuteInterval != 1) {
      if (_minute % widget.minuteInterval != 0)
        _minute =
            ((_minute ~/ widget.minuteInterval) + 1) * widget.minuteInterval;
    }
    if (_minute >= 60) {
      _hour += _minute ~/ 60;
      _minute = _minute % 60;
      if (_hour >= 24) _hour = _hour - 24;
    }
    super.initState();
  }

  DateTime get datePicked => DateTime(widget.dueDate.year, widget.dueDate.month,
      widget.dueDate.day, _hour, _minute);

  @override
  Widget build(BuildContext context) {
    return AppBottomSheet(
      child: Column(
        children: [
          BottomSheetHeader(
            titleText: LocaleKeys.DatePicker_AddTime.tr,
            action: SaveButton(
              onPressed: () {
                Get.back();
                widget.onSaveTime(TimeOfDay(hour: _hour, minute: _minute));
              },
            ),
          ),
          SizedBox(
              height: 150,
              child: CupertinoDatePicker(
                onDateTimeChanged: (DateTime date) {
                  setState(() {
                    _hour = date.hour;
                    _minute = date.minute;
                  });
                },
                minimumDate: widget.minimumDate ??
                    (datePicked.isBefore(_timeNow) && widget.disablePrevious
                        ? _initTime
                        : null),
                maximumDate: widget.maximumDate,
                minuteInterval: widget.minuteInterval,
                mode: CupertinoDatePickerMode.time,
                use24hFormat: true,
                initialDateTime: datePicked,
              )),
        ],
      ),
    );
  }
}
*/
