import 'package:admin/config/constants.dart';
import 'package:admin/features/bot/widgets/create_bot_step_form.dart';
import 'package:admin/features/dashboard/widgets/header.dart';
// import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CreateBotScreen extends StatefulWidget {
  const CreateBotScreen({Key? key}) : super(key: key);

  @override
  State<CreateBotScreen> createState() => _CreateBotScreenState();
}

class _CreateBotScreenState extends State<CreateBotScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [Header(), CreateBotStepForm()],
        ),
      ),
    );
  }
}
