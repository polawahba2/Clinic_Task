// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:technical_task/Res/CustomWidgets/BuildItemInExpansionTile.dart';
// import 'package:technical_task/Res/TextStyle/TextStyles.dart';

// class NameAdressPhoneBuilder extends StatelessWidget {
//   final clinicNameController;
//   final clinicAdressController;
//   final clinicPhoneController;

//   NameAdressPhoneBuilder({
//     Key? key,
//     required this.clinicNameController,
//     required this.clinicAdressController,
//     required this.clinicPhoneController,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         BuildItemInExpansionTile(
//           title: 'Clinic Name',
//           secoundBart: TextFormField(
//             decoration: textFormFieldInputDecoration(),
//             controller: clinicNameController,
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter some text';
//               }
//               return null;
//             },
//           ),
//         ),
//         BuildItemInExpansionTile(
//           title: 'Clinic Adress',
//           secoundBart: TextFormField(
//             decoration: textFormFieldInputDecoration(),
//             controller: clinicAdressController,
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter some text';
//               }
//               return null;
//             },
//           ),
//         ),
//         BuildItemInExpansionTile(
//           title: ' Phone',
//           secoundBart: TextFormField(
//             decoration: textFormFieldInputDecoration(),
//             controller: clinicPhoneController,
//             obscureText: true,
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter some text';
//               }
//               return null;
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
