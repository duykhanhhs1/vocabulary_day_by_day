import 'package:flutter/cupertino.dart';
import 'package:vocabulary_day_by_day/common/extensions/datetime.extension.dart';
import 'package:vocabulary_day_by_day/common/extensions/message_dialog.extension.dart';
import 'package:vocabulary_day_by_day/common/theme/app_colors.dart';
import 'package:vocabulary_day_by_day/common/theme/app_texts.dart';
import 'package:vocabulary_day_by_day/common/theme/constants.dart';
import 'package:vocabulary_day_by_day/common/widgets/app_date_picker.widget.dart';
import 'package:vocabulary_day_by_day/common/widgets/rounded_container.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabulary_day_by_day/modules/home/presentation/blocs/home/home_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          // if (!state.isLoggedIn) {
          //   context.push(AuthRoutes.login);
          // }
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            toolbarHeight: 35,
          ),
          body: const Padding(
            padding:
                EdgeInsets.symmetric(horizontal: kHorizontalContentPadding),
            child: Column(
              children: [_HorizontalDatePicker()],
            ),
          ),
        ),
      ),
    );
  }
}

class _HorizontalDatePicker extends StatelessWidget {
  const _HorizontalDatePicker();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final currentDate = context.read<HomeBloc>().state.currentDate;
        final dates = _getWeekDays(currentDate);
        return RoundedContainer(
          width: context.width,
          height: 110,
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(
                height: 40,
                child: Row(
                  children: [
                    _buildMonth(context, currentDate),
                    const Spacer(),
                    Container(
                      alignment: Alignment.center,
                      child: const Icon(
                        CupertinoIcons.chevron_right,
                        size: 18,
                        color: ColorStyles.black5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: List.generate(
                  dates.length,
                  (index) {
                    final date = dates[index];
                    final isCurrent = date.day == currentDate.day;
                    final bgColor = isCurrent ? ColorStyles.deep : null;
                    final textColor =
                        isCurrent ? ColorStyles.white : ColorStyles.black5;
                    return Expanded(
                      child: InkWell(
                        onTap: () => _onDatePicked(context, date),
                        child: AnimatedContainer(
                          duration: animatedDuration,
                          decoration: BoxDecoration(
                            color: bgColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          height: 50,
                          child: Column(
                            children: [
                              Text(
                                date.abbreviatedDay,
                                style: TextStyles.mobileMedium
                                    .copyWith(color: textColor),
                              ),
                              Text(
                                date.day.toString(),
                                style: TextStyles.mobileMedium
                                    .copyWith(color: textColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  InkWell _buildMonth(BuildContext context, DateTime currentDate) {
    void onTap() {
      showDialog(
        context: context,
        builder: (_) {
          return AppDatePicker(
            isPickRange: false,
            initEndDate: currentDate,
            disablePrevious: false,
            onDateSave: (date) => _onDatePicked(
              context,
              date!,
            ),
          );
        },
      );
    }

    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          currentDate.fullMonthName,
          style: TextStyles.mobileMedium.copyWith(color: ColorStyles.black5),
        ),
      ),
    );
  }

  void _onDatePicked(BuildContext context, DateTime date) {
    return context.read<HomeBloc>().add(
          HomeDatePicked(date: date),
        );
  }

  List<DateTime> _getWeekDays(DateTime date) {
    // Calculate the start and end of the current week
    DateTime startOfWeek = date.subtract(Duration(days: date.weekday - 1));

    // Create a list to store the days of the week
    List<DateTime> weekDays = [];

    // Loop through the days of the week and add them to the list
    for (int i = 0; i < DateTime.daysPerWeek; i++) {
      DateTime currentDate = startOfWeek.add(Duration(days: i));
      weekDays.add(currentDate);
    }

    return weekDays;
  }
}
