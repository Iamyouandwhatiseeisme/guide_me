import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future changeDisplayName(TextEditingController nameController, User user,
    BuildContext context, Function updateUI) async {
  nameController.clear();
  showDialog(
      context: context,
      builder: (context) => Dialog(
            child: SizedBox(
              height: 140,
              width: double.infinity,
              child: Column(
                children: [
                  const Text(
                    'Please enter your name: ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (name) =>
                        name == null ? "Enter your name" : null,
                    onEditingComplete: () async {
                      await user.updateDisplayName(nameController.text);
                      updateUI;
                      nameController.clear();
                      if (context.mounted) Navigator.of(context).pop();
                    },
                    onChanged: (text) {
                      updateUI;
                    },
                    controller: nameController,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                          fontFamily: 'Telegraf',
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff292F32).withOpacity(0.75)),
                      hintText: 'Enter your name',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                          borderSide: BorderSide(
                              width: 0.5,
                              color: const Color(0xff292F32).withOpacity(0.5))),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                          borderSide: BorderSide(
                              width: 0.5,
                              color: const Color(0xff292F32).withOpacity(0.5))),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                          borderSide: BorderSide(
                              width: 0.5,
                              color: const Color(0xff292F32).withOpacity(0.5))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                          borderSide: BorderSide(
                              width: 0.5,
                              color: const Color(0xff292F32).withOpacity(0.5))),
                    ),
                  ),
                ],
              ),
            ),
          ));
}
