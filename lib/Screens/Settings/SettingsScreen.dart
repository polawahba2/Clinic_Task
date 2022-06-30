import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../Cubit/AppCubit/AppCubit.dart';
import '../../Res/Colors/AppColor.dart';
import '../../Res/CustomWidgets/Seperator.dart';
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
              padding: const EdgeInsets.symmetric(
                vertical: 30.0,
                horizontal: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'full Name : ${myCubit.fullNameController.text}',
                    style: settingScreenTextStyle(),
                  ),
                  const Seperator(),
                  Text(
                    'your Id : ${myCubit.dropBoxControllers['yourIdController']}',
                    style: settingScreenTextStyle(),
                  ),
                  const Seperator(),
                  Text(
                    'gender: ${myCubit.dropBoxControllers['genderController']}',
                    style: settingScreenTextStyle(),
                  ),
                  const Seperator(),
                  Text(
                    'date of birth : ${myCubit.dateOfBirthController.text}',
                    style: settingScreenTextStyle(),
                  ),
                  const Seperator(),
                  Text(
                    'person adress : ${myCubit.personalAdressController.text}',
                    style: settingScreenTextStyle(),
                  ),
                  const Seperator(),
                  Text(
                    'mobile : ${myCubit.mobileController.text}',
                    style: settingScreenTextStyle(),
                  ),
                  const Seperator(),
                  Text(
                    'E-mail : ${myCubit.emailController.text}',
                    style: settingScreenTextStyle(),
                  ),
                  const Seperator(),
                  Text(
                    'city : ${myCubit.dropBoxControllers['cityController']}',
                    style: settingScreenTextStyle(),
                  ),
                  const Seperator(),
                  Text(
                    'Region : ${myCubit.dropBoxControllers['regionController']}',
                    style: settingScreenTextStyle(),
                  ),
                  const Seperator(),
                  Text(
                    'Main Speciality : ${myCubit.dropBoxControllers['mainSpecialityController']}',
                    style: settingScreenTextStyle(),
                  ),
                  const Seperator(),
                  Text(
                    'Sub Speciality: ${myCubit.dropBoxControllers['subSpecialityController']}',
                    style: settingScreenTextStyle(),
                  ),
                  const Seperator(),
                  Text(
                    'Scientific Degree: ${myCubit.dropBoxControllers['scientificDegreeController']}',
                    style: settingScreenTextStyle(),
                  ),
                  const Seperator(),
                  Text(
                    'Profile Image :',
                    style: settingScreenTextStyle(),
                  ),
                  const Seperator(),
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
                  const Seperator(),
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
                  const Seperator(),
                  SizedBox(
                    height: 200,
                    width: 250,
                    child: Image.network(
                      '${myCubit.licensImageUrl}',
                      fit: BoxFit.fill,
                    ),
                  ),
                  if (myCubit.diagnosisImageUrl != null)
                    Text(
                      'Diagnosis Image :',
                      style: settingScreenTextStyle(),
                    ),
                  const Seperator(),
                  if (myCubit.diagnosisImageUrl != null)
                    SizedBox(
                      height: 200,
                      width: 250,
                      child: Image.network(
                        '${myCubit.diagnosisImageUrl}',
                        fit: BoxFit.fill,
                      ),
                    ),
                  if (myCubit.operationImageUrl != null)
                    Text(
                      'operations Image :',
                      style: settingScreenTextStyle(),
                    ),
                  const Seperator(),
                  if (myCubit.operationImageUrl != null)
                    SizedBox(
                      height: 200,
                      width: 250,
                      child: Image.network(
                        '${myCubit.operationImageUrl}',
                        fit: BoxFit.fill,
                      ),
                    ),
                  if (myCubit.medicationsImageUrl != null)
                    Text(
                      'medications Image :',
                      style: settingScreenTextStyle(),
                    ),
                  if (myCubit.medicationsImageUrl != null)
                    SizedBox(
                      height: 200,
                      width: 250,
                      child: Image.network(
                        '${myCubit.medicationsImageUrl}',
                        fit: BoxFit.fill,
                      ),
                    ),
                  Text(
                    'Condition Video Link:',
                    style: settingScreenTextStyle(),
                  ),
                  const Seperator(),
                  InkWell(
                    onTap: () {
                      try {
                        launchUrlString(
                          '${myCubit.conditionVideoUrl}',
                          mode: LaunchMode.externalApplication,
                        );
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Text(
                      '${myCubit.conditionVideoUrl}',
                      style: const TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  const Seperator(),
                  if (myCubit.conditionVideoUrl != null)
                    Text(
                      'Condition Voice Link:',
                      style: settingScreenTextStyle(),
                    ),
                  const Seperator(),
                  InkWell(
                    onTap: () {
                      try {
                        launchUrlString(
                          '${myCubit.conditionVoiceUrl}',
                          mode: LaunchMode.externalApplication,
                        );
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Text(
                      '${myCubit.conditionVoiceUrl}',
                      style: const TextStyle(
                        decoration: TextDecoration.underline,
                      ),
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
