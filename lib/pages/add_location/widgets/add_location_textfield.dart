import 'package:ebutler_task/base/app_const/colors.dart';
import 'package:flutter/material.dart';

class AddLocationTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const AddLocationTextField({
    Key? key,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Text(hintText,
              textAlign: TextAlign.center,
              style:
                  const TextStyle(fontSize: 20, color: AppColors.colorBlack1)),
          const SizedBox(width: 8,),
          Expanded(
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }
}
