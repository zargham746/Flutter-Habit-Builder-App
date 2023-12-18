import 'package:flutter/material.dart';
import 'package:flutter_habit_builder_app/models/lesson_model.dart';
import 'package:flutter_habit_builder_app/res/strings.dart';
import 'package:flutter_habit_builder_app/views/widgets/custom_icon_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';

class CourseDetailsPage extends StatelessWidget {
  const CourseDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<LessonModel> lessons = [
      LessonModel(name: "Introduction", isbeingWatched: true, duration: "2:16"),
      LessonModel(
          name: "Adopting prompts to Covid 19",
          isbeingWatched: false,
          duration: "3:08"),
      LessonModel(
          name: "Choosing a Network", isbeingWatched: false, duration: "6:06"),
      LessonModel(
          name: "Optional Supplies", isbeingWatched: false, duration: "2:04"),
      LessonModel(name: "Day 1", isbeingWatched: false, duration: "3:38"),
    ];
    return Scaffold(
      backgroundColor: AppStrings.appLightYellowColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "30 Day Journal Challenge - Establish a Habit of Daily Journaling",
          style: headerStyle.copyWith(
            fontSize: 18.sp,
            letterSpacing: 0,
            wordSpacing: -3,
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.all(
            8.w,
          ),
          child: CustomIconButton(
            onTap: () {
              context.pop(true);
            },
            iconUrl: AppStrings.backIcon,
          ),
        ),
      ),
      body: Column(
        children: [
          const VideoPlayerWidget(),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 20.w,
            ).copyWith(
              top: 10.h,
            ),
            padding: EdgeInsets.symmetric(
              vertical: 15.h,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  20.r,
                ),
                topRight: Radius.circular(
                  20.r,
                ),
              ),
            ),
            child: Wrap(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 5.h,
                  ),
                  child: Text(
                    "30 Day Journal Challenge - Establish a Habit of Daily Journaling",
                    style: bodyStyle.copyWith(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      wordSpacing: 0,
                      letterSpacing: 0,
                    ),
                  ),
                ),
                Divider(
                  thickness: 1.h,
                  color: AppStrings.appLightYellowColor,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 5.h,
                  ),
                  child: Text(
                    "37 Lessons (2h 41 m)",
                    style: bodyStyle.copyWith(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      wordSpacing: 0,
                      letterSpacing: 0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              primary: false,
              itemCount: lessons.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 20.w,
                  ).copyWith(
                    top: 3.h,
                  ),
                  width: double.infinity,
                  height: 60.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: index == lessons.length - 1
                        ? BorderRadius.only(
                            bottomLeft: Radius.circular(
                              20.r,
                            ),
                            bottomRight: Radius.circular(
                              20.r,
                            ),
                          )
                        : BorderRadius.zero,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                  ),
                  // Main Row/Wrop
                  child: Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    runAlignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      // Sub Wrap/Row
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Container(
                            height: 38.h,
                            width: 38.w,
                            margin: EdgeInsets.symmetric(
                              vertical: 5.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                10.r,
                              ),
                              color: AppStrings.appYellowColor.withAlpha(
                                15,
                              ),
                            ),
                            padding: EdgeInsets.all(
                              5.w,
                            ),
                            child: Image.asset(lessons[index].isbeingWatched
                                ? AppStrings.playIcon
                                : AppStrings.lockIcon),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            "${index + 1}. ${lessons[index].name}",
                            overflow: TextOverflow.ellipsis,
                            style: bodyStyle.copyWith(
                              color: AppStrings.appPurpleColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        lessons[index].duration,
                        style: bodyStyle.copyWith(
                          color: Colors.grey.shade300,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
        ],
      ),
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({super.key});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController controller;
  late Future<void> initializeVideoPlayer;

  IconData? videoIcon;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset(
      AppStrings.courseVideo,
    );
    initializeVideoPlayer = controller.initialize().then((_) {
      // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
      setState(() {
        videoIcon = Icons.play_arrow_rounded;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        FutureBuilder(
          future: initializeVideoPlayer,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  height: 250.h,
                  width: 374.w,
                  margin: EdgeInsets.symmetric(
                    horizontal: 20.w,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      20.r,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      20.r,
                    ),
                    child: VideoPlayer(
                      controller,
                    ),
                  ),
                ),
              );
            } else {
              return AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  height: 250.h,
                  width: 374.w,
                  margin: EdgeInsets.symmetric(
                    horizontal: 20.w,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      20.r,
                    ),
                  ),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircularProgressIndicator.adaptive(
                          backgroundColor: AppStrings.appYellowColor,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "Loading...",
                          style: bodyStyle.copyWith(),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
          },
        ),
        Center(
          child: IconButton(
            onPressed: () {
              controller.value.isPlaying
                  ? controller.pause()
                  : controller.play();
              if (controller.value.isPlaying) {
                setState(() {
                  videoIcon = Icons.pause_circle_filled_rounded;
                });
              } else {
                setState(() {
                  videoIcon = Icons.play_arrow_rounded;
                });
              }
            },
            icon: Icon(
              videoIcon,
              color: Colors.white,
              size: 40.sp,
            ),
          ),
        ),
      ],
    );
  }
}
