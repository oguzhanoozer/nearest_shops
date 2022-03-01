import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/constants/application_constants.dart';
import 'core/init/lang/codegen_loader.g.dart';
import 'core/init/lang/language_manager.dart';
import 'core/init/notifier/provider_list.dart';
import 'core/init/theme/app_theme.dart';
import 'view/authentication/login/view/login_view.dart';
import 'view/authentication/register/view/register_view.dart';
import 'view/home/dashboard/view/dashboard_view.dart';

Future<void> main() async {
  await _init();
  runApp(
    MultiProvider(
      providers: [...ApplicationProvider.instance.dependItems],
      child: EasyLocalization(
        path: ApplicationConstants.LANG_ASSET_PATH,
        supportedLocales: LanguageManager.instance.supportedLocales,
        fallbackLocale: LanguageManager.instance.trLocale,
        assetLoader: const CodegenLoader(),
        saveLocale:true,
        startLocale: LanguageManager.instance.trLocale,
        child: MainHome(),
      ),
    ),
  );
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
}

class MainHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,

      //onGenerateRoute: NavigationRoute.instance!.generateRoute,
      //navigatorKey: NavigationService.instance!.navigatorKey,
      title: 'Material App',
      theme: ThemeManager.createTheme(AppThemeLight()),
      home: SafeArea(child: DashboardView()),
    );
  }
}
