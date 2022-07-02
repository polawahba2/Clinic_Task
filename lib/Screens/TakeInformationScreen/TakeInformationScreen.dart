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
    return BlocConsumer<AppCubit, AppSataes>(
      listener: (context, state) {},
      builder: (context, state) {
        var myCubit = AppCubit.getCubit(context);
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
                                  title: LocaleKeys.fullName.tr(),
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
                                  title: LocaleKeys.yourId.tr(),
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
                                  title: LocaleKeys.gender.tr(),
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
                                  title: LocaleKeys.dateOfBirth.tr(),
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
                                  title: LocaleKeys.personalAdress.tr(),
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
                                  title: LocaleKeys.city.tr(),
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
                                  title: LocaleKeys.region.tr(),
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
                                  title: LocaleKeys.mobile.tr(),
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
                                  title: LocaleKeys.eMail.tr(),
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
                                  title: LocaleKeys.password.tr(),
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
                                  title: LocaleKeys.confirmPassword.tr(),
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
                                  title: LocaleKeys.mainSpeciality.tr(),
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
                                  title: LocaleKeys.subSpeciality.tr(),
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
                                  title: LocaleKeys.scientificDegree.tr(),
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
                                  title: LocaleKeys.clinicName.tr(),
                                  secoundBart: TextFormField(
                                    decoration: textFormFieldInputDecoration(),
                                    controller: myCubit.clinicNameController,
                                  ),
                                ),
                                BuildItemInExpansionTile(
                                  title: LocaleKeys.clinicAdress.tr(),
                                  secoundBart: TextFormField(
                                    decoration: textFormFieldInputDecoration(),
                                    controller: myCubit.clinicAdressController,
                                  ),
                                ),
                                BuildItemInExpansionTile(
                                  title: LocaleKeys.clinicPhone.tr(),
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
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                BuildItemInExpansionTile(
                                  title: LocaleKeys.uploadCertifications.tr(),
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
                                            LocaleKeys.addPhoto.tr(),
                                            style:
                                                textFormFieldStyleWithDarkGreen(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  needElivation: false,
                                ),
                                if (myCubit.certificationImage != null)
                                  Text("${myCubit.certificationImage}"),
                                if (myCubit.certificationImage != null)
                                  Align(
                                    alignment: AlignmentDirectional.topEnd,
                                    child: InkWell(
                                      onTap: () {
                                        myCubit.clearCertificationUrl();
                                      },
                                      child: const Icon(
                                        Icons.delete,
                                        color: AppColor.red,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                BuildItemInExpansionTile(
                                  title: LocaleKeys.uploadLicens.tr(),
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
                                            LocaleKeys.addPhoto.tr(),
                                            style:
                                                textFormFieldStyleWithDarkGreen(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  needElivation: false,
                                ),
                                if (myCubit.licensImage != null)
                                  Text("${myCubit.licensImage}"),
                                if (myCubit.licensImage != null)
                                  Align(
                                    alignment: AlignmentDirectional.topEnd,
                                    child: InkWell(
                                      onTap: () {
                                        myCubit.clearLicensUrl();
                                      },
                                      child: const Icon(
                                        Icons.delete,
                                        color: AppColor.red,
                                        size: 30,
                                      ),
                                    ),
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
                                  child: BuildItemInMedicalInfo(
                                    title: LocaleKeys.diagnosis.tr(),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    myCubit.pickOperationsImage();
                                  },
                                  child: BuildItemInMedicalInfo(
                                    title: LocaleKeys.operation.tr(),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    myCubit.pickMedicationsImage();
                                  },
                                  child: BuildItemInMedicalInfo(
                                    title: LocaleKeys.medications.tr(),
                                  ),
                                ),
                                BuildItemInMedicalInfo(
                                  title: LocaleKeys.conditionVideo.tr(),
                                  secoundWidget: Row(
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            if (myCubit.conditionVideo !=
                                                null) {
                                              myCubit.uploadConditionVideo();
                                            }
                                          },
                                          child: const Icon(Icons.upload)),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          myCubit.pickConditionVideo();
                                        },
                                        child: const Icon(
                                          Icons.videocam,
                                          size: 35,
                                          color: AppColor.lightGreen,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (myCubit.conditionVideo != null &&
                                    !myCubit.isConditionVideoUploaded)
                                  Text("${myCubit.conditionVideo}"),
                                if (myCubit.conditionVideo != null &&
                                    !myCubit.isConditionVideoUploaded)
                                  Align(
                                    alignment: AlignmentDirectional.topEnd,
                                    child: InkWell(
                                      onTap: () {
                                        myCubit.clearConditionVideo();
                                      },
                                      child: const Icon(
                                        Icons.delete,
                                        color: AppColor.red,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                if (state is UploadConditionVideoLoadingState)
                                  const LinearProgressIndicator(),
                                BuildItemInMedicalInfo(
                                  title: LocaleKeys.conditionVoice.tr(),
                                  secoundWidget: Row(
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            if (myCubit.recordedFile != null) {
                                              myCubit.uploadConditionVoice();
                                            }
                                          },
                                          child: const Icon(Icons.upload)),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          // myCubit.pickConditionVoice();
                                          await myCubit.startAndEndRecording();
                                        },
                                        child: Icon(
                                          myCubit.buttonIcon,
                                          size: 40,
                                          color: myCubit.buttonColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (myCubit.recordDuration != null &&
                                    !myCubit.isConditionVoiceUploaded)
                                  Text(
                                      "0${myCubit.recordDuration!.inMinutes}:0${myCubit.recordDuration!.inSeconds}"),
                                if (myCubit.recordedFile != null &&
                                    !myCubit.isConditionVoiceUploaded)
                                  Text("${myCubit.recordPath}"),
                                if (myCubit.recordedFile != null &&
                                    !myCubit.isConditionVoiceUploaded)
                                  Align(
                                    alignment: AlignmentDirectional.topEnd,
                                    child: InkWell(
                                      onTap: () {
                                        myCubit.clearConditionVoice();
                                      },
                                      child: const Icon(
                                        Icons.delete,
                                        color: AppColor.red,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                if (state is UploadConditionVoiceLoadingState)
                                  const LinearProgressIndicator(),
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
                                  if (myCubit.conditionVideoUrl != null &&
                                      myCubit.conditionVoiceUrl != null) {
                                    myCubit.createNewUser(
                                      // profileImage: '${myCubit.profileImageUrl}',
                                      fullName: myCubit.fullNameController.text,
                                      yourId: myCubit.dropBoxControllers[
                                          'yourIdController'],
                                      gender: myCubit.dropBoxControllers[
                                          'genderController'],
                                      dateOfBirth:
                                          myCubit.dateOfBirthController.text,
                                      personalAdress:
                                          myCubit.personalAdressController.text,
                                      city: myCubit
                                          .dropBoxControllers['cityController'],
                                      region: myCubit.dropBoxControllers[
                                          'regionController'],
                                      mobile: myCubit.mobileController.text,
                                      eMail: myCubit.emailController.text,
                                      mainSpeciality:
                                          myCubit.dropBoxControllers[
                                              'mainSpecialityController'],
                                      subSpeciality: myCubit.dropBoxControllers[
                                          'subSpecialityController'],
                                      scientificDegree:
                                          myCubit.dropBoxControllers[
                                              'scientificDegreeController'],
                                      certification:
                                          '${myCubit.certificationImageUrl}',
                                      licens: '${myCubit.licensImageUrl}',
                                      conditionVideo:
                                          '${myCubit.conditionVideoUrl}',
                                      conditionVoice:
                                          '${myCubit.conditionVoiceUrl}',
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
                                      text: 'please upload video or voice',
                                      color: AppColor.red,
                                    );
                                  }
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
