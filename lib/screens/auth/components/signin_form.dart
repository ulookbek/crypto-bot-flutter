import 'package:flutter/material.dart';
import 'package:admin/screens/auth/components/already_have_account.dart';
import 'package:admin/config/constants.dart';

class SignInForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  final VoidCallback onButtonPressed;

  const SignInForm(
      {Key? key,
      required this.emailController,
      required this.passwordController,
      required this.onButtonPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: emailController,
            style: TextStyle(color: kPrimaryColor),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (email) {},
            decoration: const InputDecoration(
              hintStyle: TextStyle(color: kPrimaryColor),
              hintText: "Your email",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: passwordController,
              style: TextStyle(color: kPrimaryColor),
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintStyle: TextStyle(color: kPrimaryColor),
                hintText: "Your password",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          ElevatedButton(
            onPressed: () {
              if (emailController.text.isEmpty) {
                print("Please input your email");
              } else if (passwordController.text.isEmpty) {
                print("Please input your password");
              } else {
                onButtonPressed.call();
                // context
                //     .read<AuthLogic>()
                //     .loginLogic(_emailCtrl.text, _passwordCtrl.text, context);
              }
            },
            child: Text(
              "Login".toUpperCase(),
            ),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.pushReplacementNamed(context, "/signup");
            },
          ),
        ],
      ),
    );
  }
}
