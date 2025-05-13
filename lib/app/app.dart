import 'package:electrical_tools/core/routes/app_router.dart';
import 'package:electrical_tools/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../core/di/di.dart';
import '../core/themes/app_theme.dart';
import '../presentation/controller/theme_controller.dart';

Future<Widget> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  return const MyApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize and inject ThemeController
    final themeController = Get.put(ThemeController());

    return Obx(() {
      final systemUiOverlayStyle = themeController.isDarkMode
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark;

      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle.copyWith(
        statusBarColor: Colors.transparent,
      ));

      return GetMaterialApp(
        title: 'Electrical Tools',
        debugShowCheckedModeBanner: false,
        theme: appThemeData[AppTheme.light],
        darkTheme: appThemeData[AppTheme.dark],
        themeMode:
        themeController.isDarkMode ? ThemeMode.dark : ThemeMode.light,
        initialRoute: AppRoutes.splash,
        onGenerateRoute: AppRouter.generateRoute,
        builder: (context, child) => ResponsiveBreakpoints.builder(
          child: ScrollConfiguration(
            behavior: const _GlobalScrollBehavior(),
            child: child!,
          ),
          breakpoints: [
            const Breakpoint(start: 0, end: 450, name: MOBILE),
            const Breakpoint(start: 451, end: 800, name: TABLET),
            const Breakpoint(start: 801, end: 1920, name: DESKTOP),
            const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
          ],
        ),
      );
    });
  }
}

class _GlobalScrollBehavior extends ScrollBehavior {
  const _GlobalScrollBehavior();

  @override
  ScrollPhysics getScrollPhysics(_) => const BouncingScrollPhysics();
}