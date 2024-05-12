import 'package:admin/config/constants.dart';
import 'package:admin/features/api_key/widgets/api_key_add_form.dart';
import 'package:admin/features/dashboard/widgets/header.dart';
import 'package:flutter/widgets.dart';

class CreateApiKeyScreen extends StatefulWidget {
  const CreateApiKeyScreen({Key? key}) : super(key: key);

  @override
  State<CreateApiKeyScreen> createState() => _CreateApiKeyScreenState();
}

class _CreateApiKeyScreenState extends State<CreateApiKeyScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [Header(), CreateApiKeyForm()],
        ),
      ),
    );
  }
}
