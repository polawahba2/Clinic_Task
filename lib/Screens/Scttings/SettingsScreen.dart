import 'package:flutter/material.dart';

import '../../Cubit/AppCubit/AppCubit.dart';
import '../../Res/Colors/AppColor.dart';
import '../../Res/TextStyle/TextStyles.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myCubit = AppCubit.getCubit(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.topCenter,
              child: Container(
                height: 100,
                decoration: const BoxDecoration(
                  color: AppColor.darkGreen,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                ),
                width: double.infinity,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 17.0),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.arrow_back_ios_sharp,
                              color: AppColor.white,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'back',
                              style: settingBackTextStyle(),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 60,
                        ),
                        Text(
                          'Settings',
                          style: settingBackTextStyle(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'full Name : ${myCubit.fullNameController.text}',
                    style: settingScreenTextStyle(),
                  ),
                  Text(
                    'your Id : ${myCubit.dropBoxControllers['yourIdController']}',
                    style: settingScreenTextStyle(),
                  ),
                  Text(
                    'gender: ${myCubit.dropBoxControllers['genderController']}',
                    style: settingScreenTextStyle(),
                  ),
                  Text(
                    'date of birth : ${myCubit.dateOfBirthController.text}',
                    style: settingScreenTextStyle(),
                  ),
                  Text(
                    'person adress : ${myCubit.personalAdressController.text}',
                    style: settingScreenTextStyle(),
                  ),
                  Text(
                    'mobile : ${myCubit.mobileController.text}',
                    style: settingScreenTextStyle(),
                  ),
                  Text(
                    'E-mail : ${myCubit.emailController.text}',
                    style: settingScreenTextStyle(),
                  ),
                  Text(
                    'city : ${myCubit.dropBoxControllers['cityController']}',
                    style: settingScreenTextStyle(),
                  ),
                  Text(
                    'Region : ${myCubit.dropBoxControllers['regionController']}',
                    style: settingScreenTextStyle(),
                  ),
                  Text(
                    'Main Speciality : ${myCubit.dropBoxControllers['mainSpecialityController']}',
                    style: settingScreenTextStyle(),
                  ),
                  Text(
                    'Sub Speciality: ${myCubit.dropBoxControllers['subSpecialityController']}',
                    style: settingScreenTextStyle(),
                  ),
                  Text(
                    'Scientific Degree: ${myCubit.dropBoxControllers['scientificDegreeController']}',
                    style: settingScreenTextStyle(),
                  ),
                  Text(
                    'Profile Image :',
                    style: settingScreenTextStyle(),
                  ),
                  SizedBox(
                    height: 200,
                    width: 250,
                    child: Image.network(
                      '${myCubit.profileImageUrl}',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Text(
                    'Certification Image :',
                    style: settingScreenTextStyle(),
                  ),
                  SizedBox(
                    height: 200,
                    width: 250,
                    child: Image.network(
                      '${myCubit.certificationImageUrl}',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Text(
                    'licens Image :',
                    style: settingScreenTextStyle(),
                  ),
                  SizedBox(
                    height: 200,
                    width: 250,
                    child: Image.network(
                      '${myCubit.licensImageUrl}',
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
