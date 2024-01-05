import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vocabulary_day_by_day/common/extensions/datetime.extension.dart';
import 'package:vocabulary_day_by_day/common/theme/app_colors.dart';
import 'package:vocabulary_day_by_day/common/theme/app_texts.dart';
import 'package:vocabulary_day_by_day/common/theme/constants.dart';
import 'package:vocabulary_day_by_day/common/widgets/app_time_picker.widget.dart';
import 'package:vocabulary_day_by_day/common/widgets/rounded_button.widget.dart';
import 'package:vocabulary_day_by_day/common/widgets/spacer.dart';
import 'package:vocabulary_day_by_day/generated/assets.gen.dart';

//
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class AppDatePicker extends StatefulWidget {
  final Function(DateTime?)? onDateSave;
  final Function(DateRangeEntity)? onRangeSave;
  final bool isPickRange;
  final bool disablePrevious;
  final bool disableWeekend;
  final bool requiredRange;
  final bool isSelectTime;
  final DateTime? initEndDate;
  final DateTime? initStartDate;
  final List<DateTime> listBlackoutDates;
  final TimeOfDay? defaultTime;
  final TimeOfDay? initEndTime;
  final bool disableResetOption;
  final List<int> disableWeekDays;
  final DateTime? disablePreviousDate;
  final bool hasActionButton;
  final bool isAlertDialog;

  // If true then [AlertDialog] will be used for users to use with buttons.
  // If false, then when the user onChanged, the date will be returned without going through the Save button
  const AppDatePicker({
    Key? key,
    this.disablePrevious = true,
    this.requiredRange = false,
    this.disableWeekend = false,
    this.onDateSave,
    this.listBlackoutDates = const [],
    this.disableWeekDays = const [],
    this.onRangeSave,
    required this.isPickRange,
    this.initEndDate,
    this.initStartDate,
    this.defaultTime,
    this.isSelectTime = true,
    this.disableResetOption = false,
    this.isAlertDialog = true,
    this.initEndTime,
    this.disablePreviousDate,
    this.hasActionButton = true,
  }) : super(key: key);

  @override
  _AppDatePickerState createState() => _AppDatePickerState();
}

class DateRangeEntity {}

class _AppDatePickerState extends State<AppDatePicker> {
  DateTime? _startDate;
  DateTime? _endDate;
  TimeOfDay? _time;
  bool _activeStartDate = false;
  bool _activeEndDate = true;
  DateRangePickerController controller = DateRangePickerController();

  @override
  void initState() {
    setState(() {
      if (widget.requiredRange) {
        _activeStartDate = true;
      }
      if (widget.initStartDate != null) {
        _startDate = widget.initStartDate;
      }
      if (widget.initEndDate != null) {
        _endDate = widget.initEndDate;
        _activeStartDate = true;
        _activeEndDate = false;
        _time = TimeOfDay(hour: _endDate!.hour, minute: _endDate!.minute);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    return widget.isAlertDialog
        ? AlertDialog(
            insetPadding: const EdgeInsets.all(0),
            contentPadding: const EdgeInsets.symmetric(
                horizontal: kHorizontalContentPadding),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            content: Material(
              child: Container(
                // height: widget.isPickRange ? 520 : 445,
                // width: 300,
                constraints: BoxConstraints(
                    maxHeight: widget.isPickRange ? 520 : 445,
                    minWidth: 300,
                    maxWidth: 300),
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: _buildBody(today),
                  ),
                ),
              ),
            ),
          )
        : _buildBody(today);
  }

  Widget _buildBody(DateTime today) {
    return Column(
      children: [
        _buildCalendar(),
        Column(
          children: [
            // if (widget.isPickRange) _buildDisplayDateRow(),
            if (!widget.disablePrevious ||
                (_endDate != null &&
                    (_endDate!.isAfter(widget.disablePreviousDate ?? today) ||
                        _endDate! == (widget.disablePreviousDate ?? today))))
              // _buildTimePicker(),
              if (widget.isAlertDialog && widget.hasActionButton)
                Column(
                  children: [
                    const VSpacer(15),
                    _buildActionButtons(),
                  ],
                )
          ],
        ),
      ],
    );
  }

  Widget _buildCalendar() {
    final DateTime? minDate;
    if (widget.isPickRange) {
      minDate = widget.initStartDate != null &&
              widget.initStartDate!.isBefore(DateTime.now())
          ? widget.initStartDate!
          : DateTime.now();
    } else if (widget.disablePrevious) {
      minDate = widget.disablePreviousDate ?? DateTime.now();
    } else {
      minDate = null;
    }

    return SfDateRangePicker(
      controller: controller,
      minDate: minDate,
      initialSelectedDate: _endDate,
      initialDisplayDate: _endDate,
      initialSelectedRange: _startDate != null
          ? PickerDateRange(_startDate, _endDate)
          : PickerDateRange(_endDate, null),
      selectionMode: widget.isPickRange
          ? DateRangePickerSelectionMode.range
          : DateRangePickerSelectionMode.single,
      headerStyle: DateRangePickerHeaderStyle(
          textAlign: TextAlign.center,
          textStyle: TextStyles.mediumBody2.copyWith(
              color: ColorStyles.black10, fontWeight: FontWeight.w700)),
      headerHeight: 45,
      startRangeSelectionColor: ColorStyles.blue7,
      endRangeSelectionColor: ColorStyles.blue7,
      selectionTextStyle: TextStyles.smallCaption.copyWith(color: Colors.white),
      selectionRadius: 14,
      rangeSelectionColor: ColorStyles.blue3,
      rangeTextStyle: TextStyles.smallCaption.copyWith(color: Colors.white),
      selectableDayPredicate: (DateTime dateTime) {
        if (widget.disableWeekend &&
            (dateTime.weekday == DateTime.saturday ||
                dateTime.weekday == DateTime.sunday)) {
          return false;
        }
        if (widget.disableWeekDays.contains(dateTime.weekday)) return false;
        return true;
      },
      selectionColor: ColorStyles.blue7,
      todayHighlightColor: Colors.transparent,
      monthViewSettings: DateRangePickerMonthViewSettings(
        showTrailingAndLeadingDates: true,
        viewHeaderStyle: DateRangePickerViewHeaderStyle(
          textStyle: TextStyles.smallSmall.copyWith(color: ColorStyles.black7),
        ),
        weekendDays: widget.disableWeekend ? [6, 7] : [],
        //Locales.vi => 1
        firstDayOfWeek: 1,
        blackoutDates: widget.listBlackoutDates,
      ),
      monthCellStyle: DateRangePickerMonthCellStyle(
        trailingDatesTextStyle:
            TextStyles.smallCaption.copyWith(color: ColorStyles.black7),
        leadingDatesTextStyle:
            TextStyles.smallCaption.copyWith(color: ColorStyles.black7),
        todayCellDecoration: BoxDecoration(
            color: widget.listBlackoutDates
                        .indexWhere((e) => e.isSameDate(DateTime.now())) !=
                    -1
                ? Colors.transparent
                : ColorStyles.black3,
            shape: BoxShape.circle),
        todayTextStyle:
            TextStyles.smallCaption.copyWith(color: ColorStyles.black10),
        textStyle: TextStyles.smallCaption.copyWith(color: ColorStyles.black10),
        blackoutDateTextStyle:
            TextStyles.smallCaption.copyWith(color: ColorStyles.black3),
        weekendTextStyle:
            TextStyles.smallCaption.copyWith(color: ColorStyles.black3),
        disabledDatesTextStyle:
            TextStyles.smallCaption.copyWith(color: ColorStyles.black3),
      ),
      showNavigationArrow: true,
      onSelectionChanged: _onSelectionChanged,
      yearCellStyle: const DateRangePickerYearCellStyle(
        todayTextStyle: TextStyle(fontSize: 14, color: ColorStyles.blue7),
      ),
    );
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        final PickerDateRange range = args.value;
        if (_activeEndDate) {
          final lastSelectedDate = range.endDate
                      ?.isSameDate(_endDate ?? _startDate ?? DateTime.now()) ??
                  true
              ? range.startDate
              : range.endDate;
          if (_startDate == null || _startDate!.isAfter(range.startDate!)) {
            controller.selectedRange = PickerDateRange(lastSelectedDate, null);
            _startDate = null;
          } else {
            controller.selectedRange =
                PickerDateRange(_startDate, lastSelectedDate);
          }
          _endDate = lastSelectedDate;
        } else {
          final lastSelectedDate = range.startDate!
                  .isSameDate(_startDate ?? _endDate ?? DateTime.now())
              ? range.endDate
              : range.startDate;
          if (_endDate == null || range.startDate!.isAfter(_endDate!)) {
            controller.selectedRange = PickerDateRange(lastSelectedDate, null);
            _endDate = null;
          } else {
            controller.selectedRange =
                PickerDateRange(lastSelectedDate, _endDate);
          }
          _startDate = lastSelectedDate;
        }
      } else if (args.value is DateTime) {
        _endDate = args.value;
      }
      if (_time == null && widget.defaultTime != null) {
        _time = widget.defaultTime;
      }
      if (_time != null && _endDate != null) {
        _endDate = DateTime(
          _endDate!.year,
          _endDate!.month,
          _endDate!.day,
          _time!.hour,
          _time!.minute,
        );
      }
      if (!widget.isAlertDialog || !widget.hasActionButton) _onSave();
    });
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (!widget.disableResetOption)
          InkWell(
            onTap: () => _onReset(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(Assets.icons.reset),
                  const HSpacer(12),
                  Text(
                    "Reset",
                    style: TextStyles.mobileSubtitle2.copyWith(
                      color: ColorStyles.black7,
                    ),
                  ),
                ],
              ),
            ),
          ),
        const HSpacer(12),
        RoundedButton(
          disabled: _endDate == widget.initEndDate
              ? widget.isPickRange
                  ? _startDate == widget.initStartDate
                  : true
              : false,
          labelText: "Save",
          onPressed: () => _onSave(),
          height: 40,
        ),
      ],
    );
  }

/*
  Widget _buildTimePicker() {
    return widget.isSelectTime
        ? InkWell(
            onTap: () => Get.bottomSheet(
              AppTimePicker(
                disablePrevious: widget.disablePrevious,
                dueDate: _endDate!,
                time: _time,
                onSaveTime: (time) {
                  setState(() {
                    _time = time;
                    _endDate = DateTime(
                      _endDate!.year,
                      _endDate!.month,
                      _endDate!.day,
                      _time!.hour,
                      _time!.minute,
                    );
                  });
                },
              ),
            ),
            child: Container(
              width: Get.width,
              margin: const EdgeInsets.only(top: 15),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 40,
              decoration: BoxDecoration(
                  border: Border.all(color: ColorStyles.black3),
                  borderRadius: BorderRadius.circular(6)),
              child: Row(
                children: [
                  const Icon(
                    Icons.access_time_rounded,
                    color: ColorStyles.blue7,
                    size: 18,
                  ),
                  const SizedBox(width: 10),
                  _time != null
                      ? Text(
                          _time!.format(context),
                          style: TextStyles.smallCaption.copyWith(
                              color: ColorStyles.blue7,
                              fontWeight: FontWeight.w700),
                        )
                      : Text(
                          LocaleKeys.DatePicker_AddTime.tr,
                          style: TextStyles.smallCaption.copyWith(
                            color: ColorStyles.blue7,
                          ),
                        ),
                ],
              ),
            ),
          )
        : const SizedBox();
  }
*/

/*  Widget _buildDisplayDateRow() {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        children: [
          Expanded(
            child: DisplayDatePicker(
              onTap: () {
                setState(() {
                  _activeStartDate = true;
                  _activeEndDate = false;
                });
              },
              date: _startDate,
              active: _activeStartDate,
              hintText: LocaleKeys.DatePicker_StartDate.tr,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SvgPicture.asset(Assets.icons.strikethrough),
          ),
          Expanded(
            child: DisplayDatePicker(
              onTap: () {
                setState(() {
                  _activeEndDate = true;
                  _activeStartDate = false;
                });
              },
              date: _endDate,
              active: _activeEndDate,
              hintText: LocaleKeys.DatePicker_DueDate.tr,
            ),
          ),
        ],
      ),
    );
  }*/

  void _onSave() {
    if (_time != null && _endDate != null) {
      _endDate = DateTime(
        _endDate!.year,
        _endDate!.month,
        _endDate!.day,
        _time!.hour,
        _time!.minute,
      );
    }
    if (widget.isPickRange) {
      // widget.onRangeSave!(
      //     DateRangeEntity(startDate: _startDate, endDate: _endDate));
    } else {
      widget.onDateSave!(_endDate);
    }
    if (widget.isAlertDialog) context.pop();
  }

  void _onReset() {
    setState(() {
      _startDate = null;
      _endDate = null;
      _time = null;
      _activeStartDate = true;
      _activeEndDate = false;
      if (widget.isPickRange) {
        controller.selectedRange = null;
      } else {
        controller.selectedDate = null;
      }
    });
  }
}

class DisplayDatePicker extends StatelessWidget {
  const DisplayDatePicker({
    Key? key,
    required this.date,
    required this.hintText,
    required this.onTap,
    this.active = false,
  }) : super(key: key);

  final DateTime? date;
  final String hintText;
  final bool active;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: date != null
                ? Text(
                    date!.format(displayFormat: "dd/M"),
                    style: TextStyles.mobileBody
                        .copyWith(color: ColorStyles.black10),
                  )
                : Text(
                    hintText,
                    style: TextStyles.mobileBody
                        .copyWith(color: ColorStyles.black5),
                  ),
            height: 40,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                  color: active ? ColorStyles.blue6 : ColorStyles.black3),
              borderRadius: BorderRadius.circular(6),
              boxShadow: active
                  ? [
                      const BoxShadow(
                        color: ColorStyles.blue2,
                        spreadRadius: 2,
                      )
                    ]
                  : [],
            ),
          )
        ],
      ),
    );
  }
}
