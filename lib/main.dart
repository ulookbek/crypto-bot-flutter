import 'package:admin/features/bot/bloc/bot_bloc.dart';
import 'package:admin/features/menu/bloc/menu_bloc.dart';
import 'package:admin/router/routes.dart';
import 'package:admin/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => BotBloc()),
      BlocProvider(create: (context) => MenuBloc())
      // Другие провайдеры...
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crypto Seven',
      theme: darkTheme,
      initialRoute: '/',
      routes: routes,
    );
  }
}
