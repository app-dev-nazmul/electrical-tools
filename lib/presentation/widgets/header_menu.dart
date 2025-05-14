import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/routes/app_routes.dart';
import '../../presentation/controller/theme_controller.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:get/get.dart' as getx;
import 'package:responsive_framework/responsive_framework.dart' as rf;

/*
class HeaderMenu extends StatelessWidget implements PreferredSizeWidget {
  HeaderMenu({super.key});

  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Electrical Tools'),
      actions: [
        TextButton(
          onPressed: () => Get.toNamed(AppRoutes.home),
          child: const Text('Home', style: TextStyle(color: Colors.white)),
        ),
        TextButton(
          onPressed: () => Get.toNamed(AppRoutes.home),
          child: const Text('Tools', style: TextStyle(color: Colors.white)),
        ),
        Obx(() => IconButton(
          icon: Icon(
            themeController.isDarkMode ? Icons.light_mode : Icons.dark_mode,
          ),
          onPressed: () {
            themeController.toggleTheme();
          },
        )),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}*/


class HeaderMenu extends StatelessWidget implements PreferredSize {
  const HeaderMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        ...ResponsiveValue<List<Widget>>(
          context,
          defaultValue: _buildMenuItems(context),
          conditionalValues: [
            rf.Condition.equals(
              name: MOBILE,
              value: <Widget>[
                IconButton(onPressed: (){}, icon: Icon(Icons.menu))
              ],
            ),
          ],
        ).value,
      ],
    );
  }

  List<Widget> _buildMenuItems(BuildContext context) {
    return [
      TextButton(
        onPressed: () => {},
        child: Text('Home', style: TextStyle(color: Colors.black)),
      ),
      TextButton(
        onPressed: () =>{},
        child: Text('About', style: TextStyle(color: Colors.black)),
      ),
    ];
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}
