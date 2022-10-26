import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:interview_task/core/utils/app_images.dart';
import 'package:interview_task/modules/home/cubit/home_cubit.dart';
import 'package:interview_task/modules/home/cubit/home_state.dart';

import '../../../core/utils/app_strings.dart';
import '../../../core/utils/app_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AppImages.home), label: ""),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AppImages.star), label: ""),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AppImages.wallet), label: ""),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AppImages.profile), label: ""),
        ],
      ),
      bottomSheet: Container(),
      appBar: AppBar(
        leading: CircleAvatar(
          backgroundImage: AssetImage(
            AppImages.man,
          ),
          radius: 10.sp,
        ),
        title: Image.asset(AppImages.oranos),
        centerTitle: true,
        actions: [
          SvgPicture.asset(
            AppImages.search,
          )
        ],
      ),
      body: BlocProvider(
        create: (context) => HomeCubit()..getEmployees(),
        child: BlocBuilder<HomeCubit, HomeState>(
            builder: (BuildContext context, HomeState state) {
          if (state is HomeInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeDone) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                children: [
                  SizedBox(height: 5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        AppStrings.recommended,
                        style: AppStyles.headerStyle,
                      ),
                      Icon(
                        Icons.more_horiz_rounded,
                        color: Colors.grey,
                      )
                    ],
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    height: 500.h,
                    child: ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          elevation: 5,
                          margin: EdgeInsets.only(right: 5.w),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Image.network(
                                context
                                    .read<HomeCubit>()
                                    .employeeList[index]
                                    .image!,
                                height: 30,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  Text(
                                      '${context.read<HomeCubit>().employeeList[index].rate!}'),
                                  const Spacer(),
                                  Icon(
                                    Icons.favorite,
                                    color: context
                                                .read<HomeCubit>()
                                                .employeeList[index]
                                                .isFav ==
                                            true
                                        ? Colors.red
                                        : Colors.grey,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                context
                                    .read<HomeCubit>()
                                    .employeeList[index]
                                    .name!,
                                style: AppStyles.smallBlackStyle,
                              ),
                              Text(
                                  context
                                      .read<HomeCubit>()
                                      .employeeList[index]
                                      .title!,
                                  style: AppStyles.smallBlackStyle),
                            ],
                          ),
                        );
                      },
                      physics: const BouncingScrollPhysics(),
                      itemCount: context.read<HomeCubit>().employeeList.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        AppStrings.onlineExperts,
                        style: AppStyles.headerStyle,
                      ),
                      Icon(
                        Icons.more_horiz_rounded,
                        color: Colors.grey,
                      )
                    ],
                  ),
                  ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      final cubit = context.read<HomeCubit>();
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: Alignment.topRight,
                            children: const [
                              CircleAvatar(
                                radius: 30,
                                foregroundColor: Colors.grey,
                              ),
                              CircleAvatar(
                                radius: 5,
                                foregroundColor: Colors.green,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            cubit.onlineExpertList[index].name,
                            style: AppStyles.smallBlackStyle,
                          ),
                        ],
                      );
                    },
                    physics: const BouncingScrollPhysics(),
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                  )
                ],
              ),
            );
          } else {
            return Text('ERROR');
          }
        }),
      ),
    );
  }
}
