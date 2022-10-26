import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_task/core/functions/common_functions.dart';
import 'package:interview_task/core/utils/app_colors.dart';
import 'package:interview_task/core/utils/app_strings.dart';
import 'package:interview_task/core/utils/app_styles.dart';

import '../../core/utils/app_images.dart';
import 'package:flutter_svg/svg.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              AppImages.welcome,
              fit: BoxFit.fill,
              height: ScreenUtil().screenHeight,
              width: ScreenUtil().screenWidth,
            ),
            Positioned(
                top: 270.h,
                left: MediaQuery.of(context).size.width/4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.oranos),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      AppStrings.expert,
                      style: AppStyles.welcomeStyle,
                    ),
                    SizedBox(
                      height:300.h,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        CommonFunctions.navigateReplacement(
                            routeName: 'introduction', context: context);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary),
                      child: const Text(
                        AppStrings.getStarted,
                        style: AppStyles.buttonStyle,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: const TextSpan(
                        text: AppStrings.dontHaveAccount,
                        style: AppStyles.smallBlackStyle,
                        children: [
                          TextSpan(
                            text: AppStrings.signUp,
                            style: AppStyles.blueTextStyle,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
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
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
