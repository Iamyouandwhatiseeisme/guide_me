// // ignore_for_file: public_member_api_docs, sort_constructors_first

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// import 'package:guide_me/data_layer/data.dart';

// import '../presentation_layer_widgets.dart';

// class ChangeUserInfoButton extends StatefulWidget {
//   final String label;
//   final TextEditingController passedController;
//   final User user;
//   final Function updateUI;
//   final TextEditingController? passedControllerForNewPassword;
//   const ChangeUserInfoButton({
//     Key? key,
//     required this.label,
//     required this.passedController,
//     this.passedControllerForNewPassword,
//     required this.user,
//     required this.updateUI,
//   }) : super(key: key);

//   @override
//   State<ChangeUserInfoButton> createState() => _ChangeUserInfoButtonState();
// }

// class _ChangeUserInfoButtonState extends State<ChangeUserInfoButton> {
//   bool hideText = true;

//   void showPassword() {
//     setState(() {
//       hideText = !hideText;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//         onTap: () {
//           widget.label.contains('name')
//               ? changeDisplayName(widget.passedController, widget.user, context,
//                   widget.updateUI)
//               : changePassword(widget.passedController, widget.user, context,
//                   widget.updateUI);
//         },
//         child: TextWithUnderLine(
//             color: Colors.grey.withOpacity(0.75), textToDisplay: widget.label));
//   }

//   Future changePassword(TextEditingController newPassword, User user,
//       BuildContext context, Function updateUI) async {
//     widget.passedController.clear();
//     widget.passedControllerForNewPassword!.clear();

//     textFieldForNewPassword(context, user, updateUI);
//   }

//   Future<dynamic> textFieldForNewPassword(
//       BuildContext context, User user, Function updateUI) {
//     var auth = FirebaseAuth.instance;
//     var currentUser = auth.currentUser;
//     return showDialog(
//         context: context,
//         builder: (context) => StatefulBuilder(
//                 builder: (BuildContext context, StateSetter setState) {
//               return Dialog(
//                 child: SizedBox(
//                   height: 300,
//                   width: double.infinity,
//                   child: Column(
//                     children: [
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       const Text(
//                         'Change password ',
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.w400),
//                       ),
//                       const SizedBox(
//                         height: 12,
//                       ),
//                       PasswordTextFormFieldForChangePasswordPage(
//                         setState: setState,
//                         controller: widget.passedController,
//                         updateUI: updateUI,
//                         showPassword: showPassword,
//                         label: 'Enter your old password',
//                         hideText: hideText,
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       PasswordTextFormFieldForChangePasswordPage(
//                           setState: setState,
//                           controller: widget.passedControllerForNewPassword!,
//                           label: "Enter your new password",
//                           hideText: hideText,
//                           updateUI: updateUI,
//                           showPassword: () => showPassword()),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       Align(
//                         alignment: Alignment.bottomRight,
//                         child: UpdatePasswordButton(
//                           currentUser: currentUser!,
//                           passedController: widget.passedController,
//                           passedControllerForNewPassword:
//                               widget.passedControllerForNewPassword!,
//                           updateUI: updateUI,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               );
//             }));
//   }
// }
