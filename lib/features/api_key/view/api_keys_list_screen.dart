import 'package:admin/config/constants.dart';
import 'package:admin/features/api_key/widgets/api_keys_table.dart';
import 'package:admin/features/dashboard/widgets/header.dart';
import 'package:flutter/widgets.dart';

class ApiKeysListScreen extends StatefulWidget {
  const ApiKeysListScreen({Key? key}) : super(key: key);

  @override
  State<ApiKeysListScreen> createState() => _ApiKeysListScreenState();
}

class _ApiKeysListScreenState extends State<ApiKeysListScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      MyApiKeysTable(),
                      // MyBots(),
                      // if (Responsive.isMobile(context))
                      //   SizedBox(height: defaultPadding),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
