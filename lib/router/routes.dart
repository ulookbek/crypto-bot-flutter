// import 'package:admin/controllers/MenuAppController.dart';
import 'package:admin/screens/auth/signin_screen.dart';
import 'package:admin/screens/auth/signup_screen.dart';
import 'package:admin/screens/main/main_screen.dart';
// import 'package:provider/provider.dart';

var routes = {
  '/signin': (ctx) => SignInScreen(),
  '/signup': (ctx) => SignUpScreen(),
  '/': (ctx) => MainScreen(),
};
