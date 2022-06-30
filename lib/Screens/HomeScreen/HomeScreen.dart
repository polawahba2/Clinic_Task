import 'package:flutter/material.dart';
import 'package:technical_task/Res/Colors/AppColor.dart';
import 'package:technical_task/Screens/Scttings/SettingsScreen.dart';
import 'package:technical_task/Screens/TakeInformationScreen/TakeInformationScreen.dart';

import '../../Cubit/AppCubit/AppCubit.dart';
import '../../Res/TextStyle/TextStyles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myCubit = AppCubit.getCubit(context);

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 290,
            width: double.infinity,
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Container(
                    width: 290,
                    height: 250,
                    decoration: const BoxDecoration(
                      color: AppColor.lightGreen,
                      boxShadow: [
                        BoxShadow(color: AppColor.darkGreen, spreadRadius: 12),
                      ],
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(170),
                        bottomLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100.0, left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Home',
                        style: homeScreenTextStyle(),
                      ),
                      Image.asset('assets/icons/Group 1205.png'),
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(300.0),
                          child: Image.asset(
                            'assets/icons/DoctorImage.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            child: Wrap(
              verticalDirection: VerticalDirection.down,
              spacing: 70,
              children: [
                Image.asset('assets/icons/Path 763.png', height: 90),
                Image.asset('assets/icons/Delete-Shield-11304.png', height: 90),
                Image.asset('assets/icons/Bar-Chart-12818.png', height: 90),
                Image.asset('assets/icons/Path 425.png', height: 90),
                Image.asset('assets/icons/Path 763.png', height: 90),
              ],
            ),
          ),
          const Spacer(),
          Container(
            height: 100,
            child: Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: AppColor.lightGreen,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25)),
                    ),
                    width: double.infinity,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SizedBox(
                      height: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              myCubit.clearAllControllers();
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return TakeInformationScreen();
                                  },
                                ),
                              );
                            },
                            child: Column(
                              children: const [
                                Icon(
                                  Icons.home,
                                  color: AppColor.white,
                                  size: 40,
                                ),
                                Text(
                                  'Home',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: AppColor.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const SettingsScreen();
                                  },
                                ),
                              );
                            },
                            child: Column(
                              children: const [
                                Icon(
                                  Icons.settings,
                                  color: AppColor.white,
                                  size: 40,
                                ),
                                Text(
                                  'Settings',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: AppColor.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
