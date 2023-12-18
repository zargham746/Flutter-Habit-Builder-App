import 'package:flutter/material.dart';
import 'package:flutter_habit_builder_app/models/community_model.dart';
import 'package:flutter_habit_builder_app/res/strings.dart';
import 'package:flutter_habit_builder_app/views/widgets/custom_icon_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  @override
  Widget build(BuildContext context) {
    final List<CommunityModel> communityPosts = [
      CommunityModel(
        name: "Gretchen",
        imageUrl: AppStrings.user3Image,
        timeStamp: "41",
        message:
            "Man, you're my new guru! Viewing the lessons for a second time. Thoroughly pleased. And impressed that you draw from scientific literature in telling memorable...",
        liked: 3.1,
        comments: 22,
      ),
      CommunityModel(
        name: "AI",
        imageUrl: AppStrings.user4Image,
        timeStamp: "41",
        message:
            "Man, you're my new guru! Viewing the lessons for a second time. Thoroughly pleased. And impressed that you draw from scientific literature in telling memorable...",
        liked: 3.1,
        comments: 22,
      ),
      CommunityModel(
        name: "Jerome",
        imageUrl: AppStrings.user1Image,
        timeStamp: "41",
        message:
            "Man, you're my new guru! Viewing the lessons for a second time. Thoroughly pleased. And impressed that you draw from scientific literature in telling memorable...",
        liked: 3.1,
        comments: 22,
      ),
      CommunityModel(
        name: "AI",
        imageUrl: AppStrings.user2Image,
        timeStamp: "41",
        message:
            "Man, you're my new guru! Viewing the lessons for a second time. Thoroughly pleased. And impressed that you draw from scientific literature in telling memorable...",
        liked: 3.1,
        comments: 22,
      ),
      CommunityModel(
        name: "Gretchen",
        imageUrl: AppStrings.user3Image,
        timeStamp: "41",
        message:
            "Man, you're my new guru! Viewing the lessons for a second time. Thoroughly pleased. And impressed that you draw from scientific literature in telling memorable...",
        liked: 3.1,
        comments: 22,
      ),
      CommunityModel(
        name: "AI",
        imageUrl: AppStrings.user4Image,
        timeStamp: "41",
        message:
            "Man, you're my new guru! Viewing the lessons for a second time. Thoroughly pleased. And impressed that you draw from scientific literature in telling memorable...",
        liked: 3.1,
        comments: 22,
      ),
    ];
    return Scaffold(
      backgroundColor: AppStrings.appLightYellowColor,
      appBar: AppBar(
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: CustomIconButton(
            onTap: () {},
            iconUrl: AppStrings.menuIcon,
          ),
        ),
        title: Text(
          "Community",
          style: bodyStyle.copyWith(
            letterSpacing: 0,
            fontSize: 18.spMax,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: 10.w,
            ),
            child: GestureDetector(
              onTap: () {
                context.push(
                  context.namedLocation(
                    "ProfilePage",
                  ),
                );
              },
              child: CircleAvatar(
                backgroundColor: Colors.grey[300],
                backgroundImage: const AssetImage(
                  AppStrings.userImage,
                ),
              ),
            ),
          )
        ],
      ),
      body: ListView.builder(
        primary: true,
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 10.h,
        ),
        physics: const BouncingScrollPhysics(),
        itemCount: communityPosts.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(
              bottom: 10.h,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 10.w,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                20.r,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Main Row
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 8.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 14.r,
                            backgroundColor: Colors.grey[300],
                            backgroundImage: AssetImage(
                              communityPosts[index].imageUrl,
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                communityPosts[index].name,
                                style: bodyStyle.copyWith(
                                  fontSize: 14.sp,
                                  letterSpacing: 0,
                                  wordSpacing: -3,
                                  color: AppStrings.appPurpleColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "${communityPosts[index].timeStamp}m",
                                    style: bodyStyle.copyWith(
                                      color: Colors.grey[300],
                                      fontSize: 10.sp,
                                      letterSpacing: 0,
                                      wordSpacing: -3,
                                    ),
                                  ),
                                  Text(
                                    "\tago",
                                    style: bodyStyle.copyWith(
                                      color: Colors.grey[300],
                                      fontSize: 10.sp,
                                      letterSpacing: 0,
                                      wordSpacing: -3,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      CustomIconButton(
                        onTap: () {},
                        iconUrl: AppStrings.shareIcon,
                      )
                    ],
                  ),
                ),
                // Divider
                Divider(
                  thickness: 1.h,
                  color: AppStrings.appLightYellowColor,
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                      ),
                      child: Text(
                        communityPosts[index].message,
                        style: bodyStyle.copyWith(
                          color: AppStrings.appPurpleColor.withAlpha(230),
                          fontSize: 14.sp,
                          letterSpacing: 0,
                          wordSpacing: 0,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: 15.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppStrings.likeIcon,
                        height: 10.h,
                        width: 12.w,
                      ),
                      Text(
                        "${communityPosts[index].liked.toString()}k",
                        style: bodyStyle.copyWith(
                          color: Colors.grey[300],
                          fontSize: 10.sp,
                          letterSpacing: 0,
                          wordSpacing: -3,
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Image.asset(
                        AppStrings.commentIcon,
                        height: 10.h,
                        width: 12.w,
                      ),
                      Text(
                        "${communityPosts[index].comments}",
                        style: bodyStyle.copyWith(
                          color: Colors.grey[300],
                          fontSize: 10.sp,
                          letterSpacing: 0,
                          wordSpacing: -3,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
