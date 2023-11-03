// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final passedControllerForNewPassword = TextEditingController();
  final passedControllerForOldPassword = TextEditingController();
  final List<String> listOfSettings = [
    'Edit name',
    'Change password',
    'Payments & cards',
    'Settings'
  ];
  final List<FaIcon> listofIcons = [
    const FaIcon(FontAwesomeIcons.pen),
    const FaIcon(FontAwesomeIcons.key),
    const FaIcon(
      FontAwesomeIcons.creditCard,
    ),
    const FaIcon(Icons.settings)
  ];

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    passedControllerForNewPassword.dispose();
    passedControllerForOldPassword.dispose();
    super.dispose();
  }

  void updateUI() {
    setState(() {
      // Update the UI as needed
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: const Text('Profile Page'),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushNamed(context, 'authPage');
                Navigator.popUntil(context, ModalRoute.withName('authPage'));
              },
              child: const Text(
                'Logout',
                style: TextStyle(color: Colors.blue),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(32)),
              child: const Center(
                child: Text(
                  'Profile information',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            ProfileInfo(user: user),
            ListViewBuilderForProfilePage(
              listOfSettings: listOfSettings,
              listofIcons: listofIcons,
              nameController: nameController,
              user: user,
              updateUI: updateUI,
              passedControllerForOldPassword: passedControllerForOldPassword,
              passedControllerForNewPassword: passedControllerForNewPassword,
            ),
            Divider(
              color: Colors.grey.withOpacity(0.5),
              height: 1,
            ),
            const SizedBox(
              height: 8,
            ),
            //
          ]),
        ),
      ),
    );
  }
}
