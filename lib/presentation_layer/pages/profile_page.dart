import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:guide_me/data_layer/data.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final nameController = TextEditingController();
  @override
  void dispose() {
    nameController.dispose();
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
      backgroundColor: const Color(0xffF3F0E6),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 12),
                  child: Container(
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: ClipOval(child: Image.network(user.photoURL!))),
                ),
                const SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      user.displayName!,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    GestureDetector(
                        onTap: () {
                          changeDisplayName(
                              nameController, user, context, updateUI);
                        },
                        child: TextWithUnderLine(
                            color: Colors.grey.withOpacity(0.75),
                            textToDisplay: 'Change display name'))
                  ],
                ),
              ],
            ),
            Divider(
              color: Colors.grey.withOpacity(0.5),
              height: 1,
            ),
            Divider(
              color: Colors.grey.withOpacity(0.5),
              height: 1,
            ),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
