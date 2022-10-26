import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:interview_task/core/utils/app_strings.dart';
import 'package:interview_task/core/utils/app_styles.dart';
import '../../core/functions/common_functions.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_images.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30.h),
              const Text(
                AppStrings.welcomeString,
                style: AppStyles.welcomeStyle,
              ),
              SizedBox(height: 50.h),
              SvgPicture.asset(AppImages.robot),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  CommonFunctions.navigateReplacement(
                      routeName: 'home', context: context);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    minimumSize: Size(147.sp, 53.sp)),
                child: const Text(
                  AppStrings.next,
                  style: AppStyles.buttonStyle,
                ),
              ),
              SizedBox(height: 30.h),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppImages.world),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      AppStrings.english,
                      style: AppStyles.smallBlackStyle,
                    )
                  ],
                ),
              ),
              SizedBox(height: 15.h),
            ],
          ),
        ),
      ),
    );
  }
}
