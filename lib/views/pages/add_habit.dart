// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'package:flutter_habit_builder_app/models/date_model.dart';
import 'package:flutter_habit_builder_app/models/habit_completion_model.dart';
import 'package:flutter_habit_builder_app/views/widgets/custom_icon_button.dart';

import '../../res/strings.dart';

class AddHabitPage extends StatefulWidget {
  const AddHabitPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AddHabitPage> createState() => _AddHabitPageState();
}

class _AddHabitPageState extends State<AddHabitPage> {
  final TextEditingController habitNameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController timeController = TextEditingController();
  String selectedTime = "10:00 AM";
  bool isSwitched = false;

  final List<HabitCompletionModel> habitFrequency = [
    HabitCompletionModel(
      completed: true,
    ),
    HabitCompletionModel(
      completed: true,
    ),
    HabitCompletionModel(
      completed: true,
    ),
    HabitCompletionModel(
      inProgress: true,
    ),
    HabitCompletionModel(
      completed: true,
    ),
    HabitCompletionModel(
      completed: true,
    ),
    HabitCompletionModel(
      inProgress: true,
    ),
  ];

  final List<DateModel> frequencyDate = [
    for (int i = 0; i < 7; i++)
      DateModel(
        DateTime(2023, 9, 16 + i),
      ),
  ];

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(), // Set the initial time (optional)
    );

    if (picked != null) {
      // Format the selected time and update the UI
      final formattedTime = DateFormat.Hm().format(
        DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
          picked.hour,
          picked.minute,
        ),
      );

      setState(() {
        String twelveHourTime = convertTo12HourFormat(formattedTime);
        selectedTime = twelveHourTime;

        timeController.text = twelveHourTime; // Update the text field if needed
      });
    }
  }

  String convertTo12HourFormat(String formattedDate) {
    // Parse the formatted date
    final DateTime parsedDate = DateFormat.Hm().parse(formattedDate);

    // Format the parsed date in 12-hour time format
    final String twelveHourFormat = DateFormat('h:mm a').format(parsedDate);

    return twelveHourFormat;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        color: AppStrings.appLightYellowColor,
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: AssetImage(
            AppStrings.homeBackground,
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "New Habit",
            style: bodyStyle.copyWith(
              fontSize: 18.spMax,
              fontWeight: FontWeight.bold,
              letterSpacing: 0,
            ),
          ),
          leading: Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: CustomIconButton(
              onTap: () {
                setState(() {
                  isHabitPage = !isHabitPage;
                });
                Navigator.pop(context);
              },
              iconUrl: AppStrings.backIcon,
            ),
          ),
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Form(
              key: formKey,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                      ),
                      margin: EdgeInsets.only(
                        left: 20.w,
                        right: 10.w,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          10.r,
                        ),
                      ),
                      child: TextFormField(
                        controller: habitNameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter Habit Name",
                          hintStyle: bodyStyle.copyWith(
                            color: AppStrings.appPurpleColor.withAlpha(
                              50,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        alignment: Alignment.topRight,
                        margin: EdgeInsets.only(
                          right: 20.w,
                        ),
                        height: 55.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            15.r,
                          ),
                        ),
                        child: Center(
                          child: Image.asset(
                            AppStrings.addHabitIcon,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        bottom: 50.h,
                        child: SizedBox(
                          height: 50.h,
                          width: 50.w,
                          child: const Icon(
                            Icons.add_circle,
                            color: Colors.orange,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                vertical: 10.h,
              ),
              margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    20.r,
                  ),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10.h),
                          child: Text(
                            "Habit Frequency",
                            style: bodyStyle.copyWith(
                              fontSize: 18.spMax,
                            ),
                          ),
                        ),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              20.r,
                            ),
                          ),
                          onPressed: () {},
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Custom",
                                style: bodyStyle.copyWith(
                                  fontSize: 18.sp,
                                  color: AppStrings.appYellowColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Container(
                                padding: EdgeInsets.all(
                                  3.w,
                                ),
                                decoration: BoxDecoration(
                                  color: AppStrings.appLightYellowColor,
                                  borderRadius: BorderRadius.circular(
                                    10.r,
                                  ),
                                ),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: AppStrings.appYellowColor,
                                  size: 16.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 0.2.w,
                    color: AppStrings.appPurpleColor,
                  ),
                  SizedBox(
                    height: 90.h,
                    width: 374.sp,
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: frequencyDate.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    right: 8.w,
                                  ),
                                  child: Text(
                                    frequencyDate[index].getFormattedDayName(),
                                    style: bodyStyle.copyWith(
                                      color:
                                          AppStrings.appPurpleColor.withAlpha(
                                        50,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                if (habitFrequency[index].completed)
                                  habitCompletedContainer,
                                if (habitFrequency[index].inProgress)
                                  habitInProgressContainer,
                                if (habitFrequency[index].notStarted)
                                  habitnotStartedContainer,
                              ],
                            ),
                            VerticalDivider(
                              thickness: 0.2.w,
                              color: AppStrings.appPurpleColor,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),

            // Reminder Container
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 10.h,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  20.r,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Reminder",
                    style: bodyStyle.copyWith(
                      fontSize: 16.spMax,
                    ),
                  ),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () => selectTime(context),
                        child: Text(
                          selectedTime,
                          style: bodyStyle.copyWith(
                            color: AppStrings.appYellowColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () => selectTime(context),
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          size: 18.sp,
                          color: AppStrings.appYellowColor,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            // Notification Container
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 20.h,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  20.r,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Notifications",
                    style: bodyStyle.copyWith(
                      fontSize: 16.spMax,
                    ),
                  ),
                  Row(
                    children: [
                      Text(isSwitched ? "ON" : "OFF"),
                      SizedBox(
                        width: 3.w,
                      ),
                      Transform.scale(
                        scale: 1.w,
                        child: Switch(
                          activeTrackColor:
                              AppStrings.appYellowColor.withAlpha(50),
                          inactiveTrackColor:
                              AppStrings.appPurpleColor.withAlpha(50),
                          activeColor: AppStrings.appYellowColor,
                          inactiveThumbColor: AppStrings.appPurpleColor,
                          value: isSwitched,
                          onChanged: (value) {
                            setState(() {
                              isSwitched = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Stack(
              children: [
                Container(
                  color: Colors.transparent,
                  height: 250.h,
                  width: double.infinity,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 10.h,
                      ),
                      margin: EdgeInsets.symmetric(
                        horizontal: 20.w,
                      ),
                      height: 180.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          20.r,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'START THIS HABIT',
                            style: headerStyle.copyWith(
                              fontSize: 24.sp,
                              letterSpacing: 0,
                              wordSpacing: 0,
                            ),
                          ),
                          Text(
                            "ullamco laboris nisi ut aliquip ex ea commodo consequat dolore. ",
                            textAlign: TextAlign.center,
                            style: bodyStyle.copyWith(
                              fontSize: 14.spMax,
                              color: AppStrings.appPurpleColor.withAlpha(
                                50,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Image.asset(
                            AppStrings.downArrow,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    height: 70.h,
                    width: 70.w,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          AppStrings.onBoarding1,
                        ),
                      ),
                      color: Colors.grey[300],
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
