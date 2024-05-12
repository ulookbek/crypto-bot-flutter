import 'package:admin/features/dashboard/widgets/header.dart';
import 'package:admin/screens/bots/components/create_bot_form.dart';
import 'package:flutter/material.dart';

import '../../../config/constants.dart';

class AddBotScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(),
            CreateBotForm(),
          ],
        ),
      ),
    );
  }
}
