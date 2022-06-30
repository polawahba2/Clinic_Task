// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> ar = {
    "personalInfo": "تفاصيل شخصية",
    "workInfo": "تفاصيل العمل",
    "medicalInfo": "تفاصيل طبية",
    "signUp": "تسجيل الدخول",
    "fullName": "الاسم كامل",
    "yourId": "رقم الهوية",
    "gender": "النوع",
    "dateOfBirth": "تاريخ الميلاد",
    "personalAdress": "العنوان",
    "city": "المدينة",
    "region": "المنطقة",
    "mobile": "الموبايل",
    "eMail": "البريد الالكترونى",
    "password": "الرقم السرى",
    "confirmPassword": "تاكيد الرقم السرى",
    "mainSpeciality": "التخصص",
    "subSpeciality": "التخصص الفرعى",
    "scientificDegree": "الدرجة العلمية",
    "clinicName": "اسم العيادة",
    "clinicAdress": "عنوان العيادة",
    "clinicPhone": "رقم العيادة",
    "uploadCertifications": "شهادات",
    "uploadLicens": "الرخص",
    "addPhoto": "اضافة صورة",
    "diagnosis": " التشخيصات ان وجدت",
    "operation": "العمليات ان وجدت",
    "medications": "ان وجدت الأدوية",
    "conditionVideo": "وصف الحالة بالفيديو",
    "conditionVoice": "وصف صوتى للحالة "
  };
  static const Map<String, dynamic> en = {
    "personalInfo": "Personal Info",
    "workInfo": "Work Info",
    "medicalInfo": "Medical Info",
    "signUp": "Sign Up",
    "fullName": "Full name",
    "yourId": "Your Id",
    "gender": "Gender",
    "dateOfBirth": "Date Of Pirth",
    "personalAdress": "Personal Adress",
    "city": "City",
    "region": "Region",
    "mobile": "Mobile",
    "eMail": "E-Mail",
    "password": "password",
    "confirmPassword": "Confirm password",
    "mainSpeciality": "Main Speciality",
    "subSpeciality": "Sub-Speciality",
    "scientificDegree": "Scientific Degree",
    "clinicName": "Clinic Name",
    "clinicAdress": "Clinic Adress",
    "clinicPhone": "Clinic Phone",
    "uploadCertifications": "Upload Certifications",
    "uploadLicens": "Upload Licens",
    "addPhoto": "Add Photo",
    "diagnosis": "Please add diagnosis if any",
    "operation": "Please add operations if any",
    "medications": "Please add medications if any",
    "conditionVideo": "Descripe your condition by video",
    "conditionVoice": "Descripe your condition by voice"
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {
    "ar": ar,
    "en": en
  };
}
