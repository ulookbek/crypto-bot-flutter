import 'package:admin/screens/auth/components/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:admin/config/responsive.dart';
import 'package:admin/config/background.dart';
import 'components/login_screen_top_image.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();
  final TextEditingController _passwordRequiredCtrl = TextEditingController();

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    _passwordRequiredCtrl.dispose();
    super.dispose();
  }

  void register() {
    // sign-in request
    if (_emailCtrl.text == "ulukbek" && _passwordCtrl.text == "ulukbek") {
      Navigator.pushReplacementNamed(context, "/dashboard/main");
    }
  }

  Widget _buildSignInForm() {
    return SignUpForm(
      emailController: _emailCtrl,
      passwordController: _passwordCtrl,
      passwordRepeatController: _passwordRequiredCtrl,
      onButtonPressed: register,
    );
  }

  Widget _buildMobileLayout() {
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoginScreenTopImage(),
            Row(
              children: [
                Spacer(),
                Expanded(
                  flex: 8,
                  child: _buildSignInForm(),
                ),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Background(
      child: SingleChildScrollView(
        child: Row(children: [
          Expanded(
            child: LoginScreenTopImage(),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 450,
                  child: _buildSignInForm(),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Responsive.isMobile(context)
        ? _buildMobileLayout()
        : _buildDesktopLayout();
  }
}
