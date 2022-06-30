import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_task/Cubit/AppCubit/AppCubit.dart';
import 'package:technical_task/Cubit/AppCubit/AppStates.dart';
import 'package:technical_task/Res/Colors/AppColor.dart';
import 'package:technical_task/Res/Consts/Consts.dart';
import 'package:technical_task/Res/CustomWidgets/BaseExpansionTile.dart';
import 'package:technical_task/Res/CustomWidgets/BuildItemInExpansionTile.dart';
import 'package:technical_task/Res/TextStyle/TextStyles.dart';
import 'package:technical_task/Screens/HomeScreen/HomeScreen.dart';
import '../../Res/CustomWidgets/BuildClinicNAP.dart';
import '../../Res/CustomWidgets/BuildItemInMedicalInfo.dart';
import '../../Res/CustomWidgets/ShowToast.dart';
import '../../translation/Local_Key.g.dart';

class TakeInformationScreen extends StatelessWidget {
  TakeInformationScreen({Key? key}) : super(key: key);
  final personalInformationFormKey = GlobalKey<FormState>();
  final workInformationFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var myCubit = AppCubit.getCubit(context);

    return BlocConsumer<AppCubit, AppSataes>(
      listener: (context, state) {},
      builder: (context, state) {
        myCubit.dateOfBirthController.text = '20/8/1998';
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(
              top: 50.0,
              left: 20,
              right: 5,
              bottom: 15,
            ),
            child: SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    //Image setting icon
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 80,
                            decoration: BoxDecoration(
                                color: AppColor.white,
                                border: Border.all(
                                  color: AppColor.grey,
                                  width: 1,
                                )),
                            child: Column(
                              children: [
                                TextButton(
                                  onPressed: () async {
                                    await context.setLocale(const Locale('en'));
                                  },
                                  child: const Text(
                                    'English',
                                    style: TextStyle(
                                      color: AppColor.lightGreen,
                                    ),
                                  ),
                                ),
                                Container(
                                  color: AppColor.grey,
                                  height: 1,
                                  width: double.infinity,
                                ),
                                TextButton(
                                  onPressed: () async {
                                    await context.setLocale(const Locale(
                                      'ar',
                                    ));
                                  },
                                  child: const Text(
                                    'Arabic',
                                    style: TextStyle(
                                      color: AppColor.lightGreen,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: (() async {
                              myCubit.pickProfileImage();
                            }),
                            child: SizedBox(
                              height: 90,
                              width: 90,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional.center,
                                    child: SizedBox(
                                      height: 80,
                                      width: double.infinity,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(300.0),
                                        child: myCubit.profileImage == null
                                            ? Image.asset(
                                                'assets/icons/DoctorImage.jpg',
                                                fit: BoxFit.fill)
                                            : Image.file(myCubit.profileImage!),
                                      ),
                                    ),
                                  ),
                                  const Align(
                                    alignment: AlignmentDirectional.bottomEnd,
                                    child: Icon(
                                      Icons.camera_alt,
                                      color: AppColor.darkGreen,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                AppCubit.getCubit(context).changeTheme();
                              },
                              icon: const Icon(Icons.dark_mode))
                        ],
                      ),
                    ),
                    //Personal Information
                    BaseExpansionTile(
                        title: LocaleKeys.personalInfo.tr(),
                        body: [
                          Form(
                            key: personalInformationFormKey,
                            child: Column(
                              children: [
                                BuildItemInExpansionTile(
                                  title: 'Full Name',
                                  secoundBart: TextFormField(
                                    decoration: textFormFieldInputDecoration(),
                                    controller: myCubit.fullNameController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                BuildItemInExpansionTile(
                                  title: 'Your Id',
                                  secoundBart: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      onChanged: (value) {
                                        myCubit.changeDropBoxesValues(
                                          mapKey: 'yourIdController',
                                          value: value.toString(),
                                        );
                                      },
                                      hint: Text(myCubit.dropBoxControllers[
                                          'yourIdController']),
                                      items: <String>[
                                        'Passport',
                                        'Passport2',
                                        'Passport3',
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                                BuildItemInExpansionTile(
                                  title: 'Gender',
                                  secoundBart: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      onChanged: (value) {
                                        myCubit.changeDropBoxesValues(
                                          mapKey: 'genderController',
                                          value: value.toString(),
                                        );
                                      },
                                      hint: Text(
                                        myCubit.dropBoxControllers[
                                            'genderController'],
                                      ),
                                      items: <String>[
                                        'male',
                                        'female',
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                                BuildItemInExpansionTile(
                                  title: 'Date Of Birth',
                                  secoundBart: InkWell(
                                    onTap: () async {
                                      try {
                                        await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate:
                                              DateTime.parse("2023-08-07"),
                                        ).then((value) {
                                          myCubit.dateOfBirthController.text =
                                              DateFormat("dd/MM/yyyy")
                                                  .format(value!)
                                                  .toString();
                                          print(value);
                                        });
                                      } catch (e) {}
                                    },
                                    child: TextFormField(
                                      enabled: false,
                                      controller: myCubit.dateOfBirthController,
                                    ),
                                  ),
                                ),
                                BuildItemInExpansionTile(
                                  title: 'Personal Adress ',
                                  secoundBart: TextFormField(
                                    decoration: textFormFieldInputDecoration(),
                                    controller:
                                        myCubit.personalAdressController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                BuildItemInExpansionTile(
                                  title: 'City',
                                  secoundBart: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      onChanged: (value) {
                                        myCubit.changeDropBoxesValues(
                                          mapKey: 'cityController',
                                          value: value.toString(),
                                        );
                                      },
                                      hint: Text(myCubit.dropBoxControllers[
                                          'cityController']),
                                      items: <String>[
                                        'Cairo',
                                        'Alex',
                                        'Cairo',
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                                BuildItemInExpansionTile(
                                  title: 'Region',
                                  secoundBart: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      onChanged: (value) {
                                        myCubit.changeDropBoxesValues(
                                          mapKey: 'regionController',
                                          value: value.toString(),
                                        );
                                      },
                                      hint: Text(myCubit.dropBoxControllers[
                                          'regionController']),
                                      items: <String>[
                                        'region1',
                                        'region2',
                                        'region3',
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                                BuildItemInExpansionTile(
                                  title: 'Mobile  ',
                                  secoundBart: TextFormField(
                                    decoration: textFormFieldInputDecoration(),
                                    controller: myCubit.mobileController,
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                BuildItemInExpansionTile(
                                  title: 'E-mail',
                                  secoundBart: TextFormField(
                                    decoration: textFormFieldInputDecoration(),
                                    controller: myCubit.emailController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                BuildItemInExpansionTile(
                                  title: ' Password',
                                  secoundBart: TextFormField(
                                    decoration: textFormFieldInputDecoration(),
                                    controller: myCubit.passwordController,
                                    obscureText: true,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                BuildItemInExpansionTile(
                                  title: 'Confirm Password',
                                  secoundBart: TextFormField(
                                    decoration: textFormFieldInputDecoration(),
                                    controller:
                                        myCubit.confirmPasswordController,
                                    obscureText: true,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                    //'Work Info'
                    BaseExpansionTile(title: LocaleKeys.workInfo.tr(), body: [
                      Form(
                          key: workInformationFormKey,
                          child: Container(
                            color: AppColor.white,
                            child: Column(
                              children: [
                                BuildItemInExpansionTile(
                                  title: 'Main Speciality',
                                  secoundBart: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      onChanged: (value) {
                                        myCubit.changeDropBoxesValues(
                                          mapKey: 'mainSpecialityController',
                                          value: value.toString(),
                                        );
                                      },
                                      hint: Text(myCubit.dropBoxControllers[
                                          'mainSpecialityController']),
                                      items: <String>[
                                        'Speciality 1',
                                        'Speciality 2',
                                        'Speciality 3',
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                                BuildItemInExpansionTile(
                                  title: 'Sub-Speciality',
                                  secoundBart: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      onChanged: (value) {
                                        myCubit.changeDropBoxesValues(
                                          mapKey: 'subSpecialityController',
                                          value: value.toString(),
                                        );
                                      },
                                      hint: Text(myCubit.dropBoxControllers[
                                          'subSpecialityController']),
                                      items: <String>[
                                        'Sub-Speciality1',
                                        'Sub-Speciality2',
                                        'Sub-Speciality3',
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                                BuildItemInExpansionTile(
                                  title: 'Scientific Degree',
                                  secoundBart: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      onChanged: (value) {
                                        myCubit.changeDropBoxesValues(
                                          mapKey: 'scientificDegreeController',
                                          value: value.toString(),
                                        );
                                      },
                                      hint: Text(
                                        myCubit.dropBoxControllers[
                                            'scientificDegreeController'],
                                      ),
                                      items: <String>[
                                        'Scientific Degree 1',
                                        'Scientific Degree 2',
                                        'Scientific Degree 3',
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                                // Show Clinic Details from sqflite

                                ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return BuildClinicNAP(
                                      clincName: myCubit.clinicNAPValues[index]
                                          [kClinicName],
                                      clincAdress:
                                          myCubit.clinicNAPValues[index]
                                              [kClinicAdress],
                                      clincPhone: myCubit.clinicNAPValues[index]
                                          [kClinicPhone],
                                      index: index + 1,
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                    height: 6,
                                  ),
                                  itemCount: myCubit.clinicNAPValues.length,
                                ),

                                //Clinc NAP Text Fileds
                                BuildItemInExpansionTile(
                                  title: 'Clinic Name',
                                  secoundBart: TextFormField(
                                    decoration: textFormFieldInputDecoration(),
                                    controller: myCubit.clinicNameController,
                                  ),
                                ),
                                BuildItemInExpansionTile(
                                  title: 'Clinic Adress',
                                  secoundBart: TextFormField(
                                    decoration: textFormFieldInputDecoration(),
                                    controller: myCubit.clinicAdressController,
                                  ),
                                ),
                                BuildItemInExpansionTile(
                                  title: ' Phone',
                                  secoundBart: TextFormField(
                                    decoration: textFormFieldInputDecoration(),
                                    controller: myCubit.clinicPhoneController,
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    color: AppColor.white,
                                    child: InkWell(
                                      onTap: () {
                                        if (myCubit.clinicNameController
                                                    .text !=
                                                '' &&
                                            myCubit.clinicAdressController
                                                    .text !=
                                                '' &&
                                            myCubit.clinicPhoneController
                                                    .text !=
                                                '') {
                                          myCubit.insertToDB(
                                            name: myCubit
                                                .clinicNameController.text,
                                            adress: myCubit
                                                .clinicAdressController.text,
                                            phone: myCubit
                                                .clinicPhoneController.text,
                                          );
                                          myCubit.clinicNameController.text =
                                              '';
                                          myCubit.clinicAdressController.text =
                                              '';
                                          myCubit.clinicPhoneController.text =
                                              '';
                                        } else {
                                          showToast(
                                            text: 'enter valid information',
                                            color: AppColor.red,
                                          );
                                        }
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: const [
                                          Icon(
                                            Icons.add_circle_rounded,
                                            color: AppColor.lightGreen,
                                          ),
                                          Text('Add'),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                BuildItemInExpansionTile(
                                  title: ' Upload Certificatoin',
                                  secoundBart: InkWell(
                                    onTap: () {
                                      myCubit.pickCertificationImage();
                                    },
                                    splashColor: AppColor.lightGreen,
                                    child: Container(
                                      height: 40,
                                      color: AppColor.white,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          const Icon(Icons.upload),
                                          Text(
                                            'Upload a Photo',
                                            style:
                                                textFormFieldStyleWithDarkGreen(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  needElivation: false,
                                ),
                                BuildItemInExpansionTile(
                                  title: ' Upload Licens',
                                  secoundBart: InkWell(
                                    onTap: () {
                                      myCubit.picklicensImage();
                                    },
                                    splashColor: AppColor.lightGreen,
                                    child: Container(
                                      height: 40,
                                      color: AppColor.white,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          const Icon(Icons.upload),
                                          Text(
                                            'Upload a Photo',
                                            style:
                                                textFormFieldStyleWithDarkGreen(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  needElivation: false,
                                ),
                              ],
                            ),
                          ))
                    ]),
                    // 'Medical Info'
                    BaseExpansionTile(
                        title: LocaleKeys.medicalInfo.tr(),
                        body: [
                          Container(
                            color: AppColor.white,
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    myCubit.pickDiagnosisImage();
                                  },
                                  child: const BuildItemInMedicalInfo(
                                    title: 'Please add diagnosis if any',
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    myCubit.pickOperationsImage();
                                  },
                                  child: const BuildItemInMedicalInfo(
                                    title:
                                        'Please add previoud operations if any',
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    myCubit.pickMedicationsImage();
                                  },
                                  child: const BuildItemInMedicalInfo(
                                    title: 'Please add medications if any',
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: BuildItemInMedicalInfo(
                                    title: 'Describe your condition by video',
                                    secoundWidget: Row(
                                      children: const [
                                        Icon(Icons.upload),
                                        Icon(
                                          Icons.videocam,
                                          size: 35,
                                          color: AppColor.lightGreen,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: BuildItemInMedicalInfo(
                                    title: 'Describe your condition by voice',
                                    secoundWidget: Row(
                                      children: const [
                                        Icon(Icons.upload),
                                        Icon(
                                          Icons.mic,
                                          size: 40,
                                          color: AppColor.lightGreen,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: ConditionalBuilder(
                        condition: state != AddUserLoadingStateState(),
                        builder: (context) {
                          return InkWell(
                            onTap: () {
                              if (myCubit.fullNameController.text.isNotEmpty &&
                                  myCubit
                                      .dateOfBirthController.text.isNotEmpty &&
                                  myCubit.personalAdressController.text
                                      .isNotEmpty &&
                                  myCubit.personalAdressController.text
                                      .isNotEmpty &&
                                  myCubit.mobileController.text.isNotEmpty &&
                                  myCubit.emailController.text.isNotEmpty &&
                                  myCubit.passwordController.text.isNotEmpty &&
                                  myCubit.confirmPasswordController.text
                                      .isNotEmpty) {
                                if (myCubit.profileImageUrl != null &&
                                    myCubit.certificationImageUrl != null &&
                                    myCubit.licensImageUrl != null &&
                                    myCubit.clinicNAPValues.isNotEmpty) {
                                  myCubit.createNewUser(
                                    // profileImage: '${myCubit.profileImageUrl}',
                                    fullName: myCubit.fullNameController.text,
                                    yourId: myCubit
                                        .dropBoxControllers['yourIdController'],
                                    gender: myCubit
                                        .dropBoxControllers['genderController'],
                                    dateOfBirth:
                                        myCubit.dateOfBirthController.text,
                                    personalAdress:
                                        myCubit.personalAdressController.text,
                                    city: myCubit
                                        .dropBoxControllers['cityController'],
                                    region: myCubit
                                        .dropBoxControllers['regionController'],
                                    mobile: myCubit.mobileController.text,
                                    eMail: myCubit.emailController.text,
                                    mainSpeciality: myCubit.dropBoxControllers[
                                        'mainSpecialityController'],
                                    subSpeciality: myCubit.dropBoxControllers[
                                        'subSpecialityController'],
                                    scientificDegree:
                                        myCubit.dropBoxControllers[
                                            'scientificDegreeController'],
                                    certification:
                                        '${myCubit.certificationImageUrl}',
                                    licens: '${myCubit.licensImageUrl}',
                                  );
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const HomeScreen();
                                      },
                                    ),
                                  );
                                } else {
                                  showToast(
                                    text:
                                        'please enter all required fields in work info partition',
                                    color: AppColor.red,
                                  );
                                }
                              } else {
                                showToast(
                                  text:
                                      'please enter all required  fields in personal info partition',
                                  color: AppColor.red,
                                );
                              }
                            },
                            child: Container(
                              height: 37,
                              width: 110,
                              decoration: BoxDecoration(
                                color: AppColor.lightGreen,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Center(
                                  child: Text(
                                LocaleKeys.signUp.tr(),
                                style: const TextStyle(
                                  color: AppColor.white,
                                ),
                              )),
                            ),
                          );
                        },
                        fallback: (context) =>
                            const CircularProgressIndicator(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}