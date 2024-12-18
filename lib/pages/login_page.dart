import 'package:day10_database/constants/spacing.dart';
import 'package:day10_database/extension/nav.dart';
import 'package:day10_database/pages/list_page.dart';
import 'package:day10_database/pages/signup_page.dart';
import 'package:day10_database/services/database.dart';
import 'package:day10_database/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

    @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "Login",
              style: TextStyle(fontSize: 24),
            ),
            height24,
            TextFieldWidget(
              controller: emailController,
              text: "enter email",
            ),
            height24,
            TextFieldWidget(
              controller: passwordController,
              text: "enter password",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("if you don't have an account"),
                TextButton(
                  onPressed: () {
                    context.pushAndRemoveUntil(const SignupPage());
                  },
                  child: const Text("signup"),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  await Database().login(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                  if (context.mounted) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ListPage(),
                        ));
                  }
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(e.toString()),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade100,
              ),
              child: const Text(
                "Login",
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}

