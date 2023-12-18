import 'package:flutter/material.dart';
import 'package:flutter_habit_builder_app/res/strings.dart';
import 'package:flutter_habit_builder_app/views/widgets/continue_with_button.dart';
import 'package:flutter_habit_builder_app/views/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String fullName = "";
  bool _obscureText = true;
  bool isSignedInCheck = false;
  bool isEmailMe = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStrings.appLightYellowColor,
      body: SafeArea(
        child: AnimationLimiter(
          child: ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 500),
              childAnimationBuilder: (widget) => SlideAnimation(
                verticalOffset: 50.0,
                child: ScaleAnimation(
                  child: widget,
                ),
              ),
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Center(
                  child: Image.asset(
                    AppStrings.createAccount,
                    height: 200.h,
                    width: 187.w,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Center(
                  child: Text(
                    "CREATE YOUR ACCOUNT",
                    style: headerStyle.copyWith(
                      fontSize: 24.sp,
                      letterSpacing: 0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: nameController,
                          style: bodyStyle.copyWith(
                            color: AppStrings.appYellowColor,
                            fontSize: 14.sp,
                          ),
                          cursorColor: AppStrings.appYellowColor,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.r),
                              ),
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: Image.asset(
                              AppStrings.userIcon,
                              height: 14.h,
                              width: 14.w,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Full Name",
                            hintStyle: bodyStyle.copyWith(
                              color: AppStrings.appYellowColor,
                              fontSize: 14.sp,
                            ),
                          ),
                          onChanged: (val) {
                            setState(() {
                              fullName = val;
                            });
                          },
                          validator: (val) {
                            if (val!.isNotEmpty) {
                              return null;
                            } else {
                              return "Name cannot be empty";
                            }
                          },
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextFormField(
                          controller: emailController,
                          cursorColor: AppStrings.appYellowColor,

                          style: bodyStyle.copyWith(
                            color: AppStrings.appYellowColor,
                            fontSize: 14.sp,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.r),
                              ),
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: AppStrings.appYellowColor,
                              size: 24.sp,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Email",
                            hintStyle: bodyStyle.copyWith(
                              color: AppStrings.appYellowColor,
                              fontSize: 14.sp,
                            ),
                          ),
                          onChanged: (val) {
                            setState(() {
                              email = val;
                            });
                          },

                          // check tha validation
                          validator: (val) {
                            return RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(val!)
                                ? null
                                : "Please enter a valid email";
                          },
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextFormField(
                          controller: passwordController,
                          obscureText: _obscureText,
                          cursorColor: AppStrings.appYellowColor,
                          style: bodyStyle.copyWith(
                            color: AppStrings.appYellowColor,
                            fontSize: 14.sp,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.r),
                              ),
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: Icon(
                              Icons.lock_outline_rounded,
                              color: AppStrings.appYellowColor,
                              size: 24.sp,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              icon: Text(
                                _obscureText ? 'Show' : 'Hide',
                                style: bodyStyle.copyWith(
                                  decoration: TextDecoration.underline,
                                  color: AppStrings.appPurpleColor,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Password",
                            hintStyle: bodyStyle.copyWith(
                              color: AppStrings.appYellowColor,
                              fontSize: 14.sp,
                            ),
                          ),
                          validator: (val) {
                            if (val!.length < 6) {
                              return "Password must be at least 6 characters";
                            } else {
                              return null;
                            }
                          },
                          onChanged: (val) {
                            setState(() {
                              password = val;
                            });
                          },
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Transform.scale(
                            scale: 0.8,
                            child: Checkbox(
                              visualDensity: VisualDensity.compact,
                              checkColor: AppStrings.appPurpleColor,
                              activeColor: AppStrings.appYellowColor,
                              fillColor: const MaterialStatePropertyAll(
                                  AppStrings.appYellowColor),
                              side: BorderSide.none,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  5.r,
                                ),
                              ),
                              value: isSignedInCheck,
                              onChanged: (bool? newValue) {
                                setState(() {
                                  isSignedInCheck = newValue!;
                                });
                              },
                            ),
                          ),
                          Text(
                            'Keep me Signed in',
                            style: bodyStyle.copyWith(
                              color: AppStrings.appPurpleColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Transform.scale(
                            scale: 0.8,
                            child: Checkbox(
                              visualDensity: VisualDensity.compact,
                              checkColor: AppStrings.appPurpleColor,
                              activeColor: AppStrings.appYellowColor,
                              fillColor: const MaterialStatePropertyAll(
                                  AppStrings.appYellowColor),
                              side: BorderSide.none,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  5.r,
                                ),
                              ),
                              value: isEmailMe,
                              onChanged: (bool? newValue) {
                                setState(() {
                                  isEmailMe = newValue!;
                                });
                              },
                            ),
                          ),
                          Text(
                            'Email me about special pricing and more',
                            style: bodyStyle.copyWith(
                              color: AppStrings.appPurpleColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: CustomButton(
                      backgroundColor: const Color(0xffFDA758),
                      onpress: () {
                        if (formKey.currentState!.validate()) {
                          isLoading = true;
                          GoRouter.of(context).go(
                            "/HomePage",
                          );
                        }
                      },
                      text: "Create Account"),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.6.h,
                          color: AppStrings.appPurpleColor,
                        ),
                      ),
                      Text(
                        '  Or sign in with  ',
                        style: bodyStyle.copyWith(
                          color: AppStrings.appPurpleColor,
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.6.h,
                          color: AppStrings.appPurpleColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                  ).copyWith(
                    top: 10.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ContinueWithButton(
                        width: 181.w,
                        iconUrl: AppStrings.googleIcon,
                        text: "Google",
                        onpress: () {},
                      ),
                      ContinueWithButton(
                        width: 181.w,
                        iconUrl: AppStrings.facebookIcon,
                        text: "Facebook",
                        onpress: () {},
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      context.pushReplacementNamed(
                        "LoginPage",
                      );
                    },
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: "Already have an account?",
                        style: bodyStyle.copyWith(
                          fontSize: 14.sp,
                          color: AppStrings.appPurpleColor,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextSpan(
                        text: "\tSign In",
                        style: bodyStyle.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppStrings.appPurpleColor,
                          fontSize: 14.sp,
                        ),
                      ),
                    ])),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
