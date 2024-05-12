import 'package:admin/config/constants.dart';
import 'package:admin/config/responsive.dart';
import 'package:admin/features/bot/bloc/bot_bloc.dart';
import 'package:admin/features/bot/widgets/bots_table_widget.dart';
import 'package:admin/features/dashboard/widgets/header.dart';
import 'package:flutter/material.dart';

class BotsListScreen extends StatefulWidget {
  const BotsListScreen({Key? key}) : super(key: key);

  @override
  _BotsListScreenState createState() => _BotsListScreenState();
}

class _BotsListScreenState extends State<BotsListScreen> {
  final _botsList = BotBloc();

  @override
  void initState() {
    _botsList.add(LoadBotsList());
    super.initState();
  }

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
                      MyBots(),
                      if (Responsive.isMobile(context))
                        SizedBox(height: defaultPadding),
                      // if (Responsive.isMobile(context)) StorageDetails(),
                      // SizedBox(height: defaultPadding),
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
