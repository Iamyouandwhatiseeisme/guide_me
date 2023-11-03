import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guide_me/business_layer/widgets/business_widgets.dart';
import 'package:guide_me/data_layer/data.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Reset password'),
      ),
      body: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              const SizedBox(
                height: 200,
              ),
              const Center(
                child: Text(
                  'Receive an E-Mail to reset your password',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              MyTextField(
                  label: 'E-Mail',
                  hintText: 'Enter your E-Mail to reset password',
                  controller: emailController),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    resetPassword(emailController, context);
                  },
                  icon: const FaIcon(
                    Icons.email_outlined,
                    color: Colors.red,
                  ),
                  label: const Text("Reset Password"))
            ],
          )),
    );
  }
}
