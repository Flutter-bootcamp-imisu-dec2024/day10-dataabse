import 'package:day10_database/constants/spacing.dart';
import 'package:day10_database/extension/nav.dart';
import 'package:day10_database/pages/list_page.dart';
import 'package:day10_database/pages/login_page.dart';
import 'package:day10_database/services/database.dart';
import 'package:day10_database/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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
      appBar: AppBar(
        backgroundColor: Colors.red.shade200,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "Signup",
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
              mainAxisAlignment:  MainAxisAlignment.center,
              children: [
                const Text("if you have already account"),
                TextButton(
                  onPressed: () {
                    context.pushAndRemoveUntil(const LoginPage());
                  },
                  child: const Text("login"),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  await Database().signup(
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
                "signup",
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}
