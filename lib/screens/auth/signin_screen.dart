import 'package:flutter/material.dart';
import 'package:admin/config/responsive.dart';
import 'package:admin/config/background.dart';
import 'components/signin_form.dart';
import 'components/login_screen_top_image.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  void login() {
    // sign-in request
    if (_emailCtrl.text == "ulukbek" && _passwordCtrl.text == "ulukbek") {
      Navigator.pushReplacementNamed(context, "/dashboard/main");
    }
  }

  Widget _buildSignInForm() {
    return SignInForm(
      emailController: _emailCtrl,
      passwordController: _passwordCtrl,
      onButtonPressed: login,
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
