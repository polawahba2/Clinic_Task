import 'package:flutter/material.dart';
import 'package:technical_task/Cubit/AppCubit/AppCubit.dart';
import 'package:technical_task/Res/Consts/Consts.dart';

import '../Colors/AppColor.dart';
import '../TextStyle/TextStyles.dart';

class BuildClinicNAP extends StatelessWidget {
  final String clincName;
  final String clincAdress;
  final String clincPhone;
  final int index;

  const BuildClinicNAP(
      {Key? key,
      required this.clincName,
      required this.clincAdress,
      required this.clincPhone,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Clinic $index Name:',
              style: textFormFieldStyle(),
            ),
            Text(
              clincName,
              style: clinicNAPValuresStyle(),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Clinic $index Adress:',
              style: textFormFieldStyle(),
            ),
            Text(
              clincAdress,
              style: clinicNAPValuresStyle(),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Clinic $index Phone:',
              style: textFormFieldStyle(),
            ),
            Text(
              clincPhone,
              style: clinicNAPValuresStyle(),
            ),
          ],
        ),
        Align(
          alignment: AlignmentDirectional.bottomEnd,
          child: TextButton(
              onPressed: () {
                AppCubit.getCubit(context).deleteElementFromDataBase(index);
              },
              child: const Text(
                'Delete Record',
                style: TextStyle(
                  color: AppColor.red,
                  decoration: TextDecoration.underline,
                  fontSize: 13,
                ),
              )),
        ),
      ],
    );
  }
}
