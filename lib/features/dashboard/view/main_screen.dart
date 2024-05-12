import 'package:admin/config/responsive.dart';
import 'package:admin/features/dashboard/view/dashboard_screen.dart';
import 'package:admin/features/menu/bloc/menu_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../screens/main/components/side_menu.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final menuBloc = context.read<MenuBloc>();

    return Scaffold(
      key: menuBloc.scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                child: SideMenu(),
              ),
            Expanded(
              flex: 5,
              child: BlocBuilder<MenuBloc, MenuState>(
                builder: (context, state) {
                  if (state is CurrentPageState) {
                    return state.currentPage;
                  } else {
                    return DashboardScreen();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
