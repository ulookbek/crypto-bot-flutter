import 'package:admin/features/api_key/view/api_keys_list_screen.dart';
import 'package:admin/features/bot/view/bots_list_screen.dart';
import 'package:admin/features/dashboard/view/dashboard_screen.dart';
import 'package:admin/features/menu/bloc/menu_bloc.dart';
// import 'package:admin/screens/bots/add_bot_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  late ScrollController controller;

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final menuBloc = context.read<MenuBloc>();

    return Drawer(
      child: ListView(
        controller: controller,
        children: [
          DrawerHeader(
            child: Center(
              child: Text(
                "Logo",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          DrawerListTile(
            title: "Дашборд",
            svgSrc: "assets/icons/menu_dashbord.svg",
            press: () {
              menuBloc.add(SetCurrentPageEvent(DashboardScreen()));
            },
          ),
          DrawerListTile(
            title: "Статистика",
            svgSrc: "assets/icons/menu_tran.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Боты",
            svgSrc: "assets/icons/menu_task.svg",
            press: () {
              menuBloc.add(SetCurrentPageEvent(BotsListScreen()));
              // Navigator.of(context).pushNamed('dashboard/bots');

              // context.read<MenuAppController>().setCurrentPage(AddBotScreen());
            },
          ),
          DrawerListTile(
            title: "API ключи",
            svgSrc: "assets/icons/menu_doc.svg",
            press: () {
              menuBloc.add(SetCurrentPageEvent(ApiKeysListScreen()));

              // context.read<MenuAppController>().setCurrentPage(ApiKeysScreen());
            },
          ),
          DrawerListTile(
            title: "Инструменты",
            svgSrc: "assets/icons/menu_store.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Профиль",
            svgSrc: "assets/icons/menu_profile.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Выход",
            svgSrc: "assets/icons/menu_setting.svg",
            press: () {
              Navigator.pushReplacementNamed(context, "/signin");
            },
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: ColorFiltered(
        colorFilter: ColorFilter.mode(Colors.white54, BlendMode.srcIn),
        child: SvgPicture.asset(
          svgSrc, // Путь к SVG файлу
          height: 16,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
