import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:image_picker/image_picker.dart';
import 'package:sqflite/sqflite.dart';
import 'package:technical_task/Res/Consts/Consts.dart';
import 'package:technical_task/Res/TextStyle/TextStyles.dart';
import '../../Res/CustomWidgets/ShowToast.dart';
import 'AppStates.dart';

class AppCubit extends Cubit<AppSataes> {
  AppCubit() : super(InitialState());

  static AppCubit getCubit(context) {
    return BlocProvider.of(context);
  }

  var myDB;
  List clinicNAPValues = [];
  bool isDarkMode = false;
  int countOfNAP = 1;
  File? profileImage;
  File? certificationImage;
  File? licensImage;
  File? diagnosisImage;
  File? operationImage;
  File? medicationsImage;
  var picker = ImagePicker();
  String? certificationImageUrl;
  String? profileImageUrl;
  String? licensImageUrl;
  String? diagnosisImageUrl;
  String? operationImageUrl;
  String? medicationsImageUrl;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController personalAdressController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController clinicNameController = TextEditingController();
  TextEditingController clinicAdressController = TextEditingController();
  TextEditingController clinicPhoneController = TextEditingController();
  Map dropBoxControllers = {
    'yourIdController': 'passport',
    'genderController': 'male',
    'cityController': 'cairo',
    'regionController': 'region',
    'mainSpecialityController': 'Speciality',
    'subSpecialityController': 'Sub-Speciality',
    'scientificDegreeController': 'Scientific Degree 1',
  };
  void clearAllControllers() {
    fullNameController.text = '';
    dateOfBirthController.text = '';
    personalAdressController.text = '';
    mobileController.text = '';
    emailController.text = '';
    passwordController.text = '';
    confirmPasswordController.text = '';
    clinicNameController.text = '';
    clinicAdressController.text = '';
    clinicPhoneController.text = '';
    profileImage = null;
    certificationImage = null;
    licensImage = null;
    certificationImageUrl = null;
    profileImageUrl = null;
    licensImageUrl = null;
    clinicNAPValues = [];
    emit(ClearAllControllersState());
  }

  void changeDropBoxesValues({
    required String mapKey,
    required String value,
  }) {
    dropBoxControllers[mapKey] = value;

    emit(ChangeDropBoxValueSucessState());
  }

  void changeTheme() {
    isDarkMode = !isDarkMode;
    emit(ToggleThemeState());
  }

  Future<void> pickDiagnosisImage() async {
    try {
      var image = await picker.pickImage(source: ImageSource.gallery);
      if (image == null) return;
      var imageTemporery = File(image.path);
      diagnosisImage = imageTemporery;
      uploadDiagnosisImage();
      emit(PickImageSuccessState());
      showToast(text: 'Diagnosis image picked successfully');
    } on Exception catch (e) {
      emit(PickImageErrorState());
      print(e);
    }
  }

  Future uploadDiagnosisImage() async {
    emit(UploadingImageState());
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child(DateTime.now().toString());
    await ref.putFile(File(diagnosisImage!.path));
    diagnosisImageUrl = await ref.getDownloadURL();
  }

  Future<void> pickOperationsImage() async {
    try {
      var image = await picker.pickImage(source: ImageSource.gallery);
      if (image == null) return;
      var imageTemporery = File(image.path);
      operationImage = imageTemporery;
      uploadOperationsImage();
      emit(PickImageSuccessState());
      showToast(text: 'operations image picked successfully');
    } on Exception catch (e) {
      emit(PickImageErrorState());
      print(e);
    }
  }

  Future uploadOperationsImage() async {
    emit(UploadingImageState());
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child(DateTime.now().toString());
    await ref.putFile(File(operationImage!.path));
    operationImageUrl = await ref.getDownloadURL();
  }

  Future<void> pickMedicationsImage() async {
    try {
      var image = await picker.pickImage(source: ImageSource.gallery);
      if (image == null) return;
      var imageTemporery = File(image.path);
      medicationsImage = imageTemporery;
      uploadMedicationsImage();
      emit(PickImageSuccessState());
      showToast(text: 'medications image picked successfully');
    } on Exception catch (e) {
      emit(PickImageErrorState());
      print(e);
    }
  }

  Future uploadMedicationsImage() async {
    emit(UploadingImageState());
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child(DateTime.now().toString());
    await ref.putFile(File(medicationsImage!.path));
    medicationsImageUrl = await ref.getDownloadURL();
  }

  Future<void> pickProfileImage() async {
    try {
      var image = await picker.pickImage(source: ImageSource.gallery);
      if (image == null) return;
      var imageTemporery = File(image.path);
      profileImage = imageTemporery;
      uploadProfileImage();
      emit(PickProfileImageSuccessState());
      showToast(text: 'profile image picked successfully');
    } on Exception catch (e) {
      emit(PickProfileImageErrorState());

      print(e);
    }
  }

  Future<void> pickCertificationImage() async {
    try {
      var image = await picker.pickImage(source: ImageSource.gallery);
      if (image == null) return;
      var imageTemporery = File(image.path);
      certificationImage = imageTemporery;
      uploadCertificationImage();
      emit(PickCertificationImageSuccessState());
      showToast(text: 'certification image picked successfully');
    } on Exception catch (e) {
      emit(PickCertificationImageErrorState());

      print(e);
    }
  }

  Future<void> picklicensImage() async {
    try {
      var image = await picker.pickImage(source: ImageSource.gallery);
      if (image == null) return;
      var imageTemporery = File(image.path);
      licensImage = imageTemporery;
      uploadLicensImage();
      emit(PickLicensImageSuccessState());
      showToast(text: 'licens image picked successfully');
    } on Exception catch (e) {
      emit(PickLicensImageErrorState());

      print(e);
    }
  }

  Future uploadProfileImage() async {
    emit(UploadingImageState());
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child(DateTime.now().toString());
    await ref.putFile(File(profileImage!.path));
    profileImageUrl = await ref.getDownloadURL();
  }

  Future uploadCertificationImage() async {
    emit(UploadingImageState());
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child(DateTime.now().toString());
    await ref.putFile(File(certificationImage!.path));
    certificationImageUrl = await ref.getDownloadURL();
  }

  Future uploadLicensImage() async {
    emit(UploadingImageState());
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child(DateTime.now().toString());
    await ref.putFile(File(licensImage!.path));
    licensImageUrl = await ref.getDownloadURL();
  }

  void createDB() async {
    myDB = await openDatabase('app.db', version: 1,
        onCreate: (database, version) async {
      print('creating database');
      database
          .execute(
              'CREATE TABLE $kTableName (id INTEGER PRIMARY KEY, $kClinicName TEXT, $kClinicAdress TEXT,$kClinicPhone TEXT)')
          .then((value) {
        print('table created');
        emit(CreateDataBaseState());
      }).catchError((error) {
        print("error found on DB is : $error");
      });
    }, onOpen: (database) {
      readFromDB(database);
      print("DB is opened");
      emit(OpenDataBaseState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorCreateDataBaseState());
    });
  }

  void readFromDB(database) async {
    clinicNAPValues = await database.rawQuery('select * from "$kTableName"');
    print(clinicNAPValues);
    emit(ReadFromDataBaseState());
  }

  void insertToDB({
    required var name,
    required var adress,
    required var phone,
  }) async {
    myDB.transaction((txn) async {
      txn
          .rawInsert(
              'INSERT INTO "$kTableName" ("$kClinicName","$kClinicAdress","$kClinicPhone") VALUES("$name","$adress","$phone")')
          .then((value) {
        print('row number $value inserted Successfully');
        readFromDB(myDB);
        emit(InsertInDataBaseState());
      }).catchError((onError) {
        print("error found on DB is : $onError");
      });
    });
  }

  void deleteElementFromDataBase(int id) async {
    await myDB.rawDelete('DELETE FROM "$kTableName" WHERE id = "$id"');
    readFromDB(myDB);
    emit(DeleteElementFromDataBaseState());
  }

  void clearAllDataBase() async {
    await myDB.rawDelete('DELETE FROM $kTableName');

    emit(ClearAllDataBaseState());
  }

  Future createNewUser({
    String profileImage = '',
    required String fullName,
    required String yourId,
    required String gender,
    required String dateOfBirth,
    required String personalAdress,
    required String city,
    required String region,
    required String mobile,
    required String eMail,
    required String mainSpeciality,
    required String subSpeciality,
    required String scientificDegree,
    required String certification,
    required String licens,
    String diagnosis = '',
    String operations = '',
    String medications = '',
  }) async {
    emit(AddUserLoadingStateState());

    final docUser =
        FirebaseFirestore.instance.collection('Users').doc(fullName);
    final json = {
      'profileImage': profileImage,
      'fullName': fullName,
      'yourId': yourId,
      'gender': gender,
      'dateOfBirth': dateOfBirth,
      'personalAdress': personalAdress,
      'city': city,
      'region': region,
      'mobile': mobile,
      'eMail': eMail,
      'mainSpeciality': mainSpeciality,
      'subSpeciality': subSpeciality,
      'scientificDegree': scientificDegree,
      'certifications': certification,
      'diagnosis': diagnosis,
      'operations': operations,
      'medications': medications,
    };
    await docUser.set(json);
    showToast(text: 'User added Successfully');

    if (clinicNAPValues.isNotEmpty) {
      for (int i = 0; i < clinicNAPValues.length; i++) {
        FirebaseFirestore.instance
            .collection('Users')
            .doc(fullName)
            .collection('clinicNAP')
            .doc('${clinicNAPValues[i][kClinicName]}clinicInfo$fullName')
            .set({
          'clinicName': clinicNAPValues[i][kClinicName],
          'clinicAdress': clinicNAPValues[i][kClinicAdress],
          'clinicPhone': clinicNAPValues[i][kClinicPhone],
        });
      }
      clearAllDataBase();
    }
    emit(UserAddedSuccessfulStateState());
  }
}
