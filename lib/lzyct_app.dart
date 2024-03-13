import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_clean_architecture/utils/helper/constant.dart';
import 'package:oktoast/oktoast.dart';

import 'core/app_route.dart';
import 'core/resources/styles.dart';
import 'utils/helper/common.dart';

class LzyctApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );

    log.d(const String.fromEnvironment('ENV'));
    return MultiBlocProvider(
      providers: [
        // BlocProvider(create: (_) => sl<SettingsCubit>()..getActiveTheme()),
        // BlocProvider(create: (_) => sl<AuthCubit>()),
      ],
      child: OKToast(
        child: ScreenUtilInit(
          designSize: const Size(375, 667),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, __) {
            AppRoute.setStream(context);

            return MaterialApp.router(
              routerConfig: AppRoute.router,
              localizationsDelegates: const [
                // Strings.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              debugShowCheckedModeBanner: false,
              builder: (BuildContext context, Widget? child) {
                final MediaQueryData data = MediaQuery.of(context);

                return MediaQuery(
                  data: data.copyWith(
                    textScaleFactor: 1,
                    alwaysUse24HourFormat: true,
                  ),
                  child: child!,
                );
              },
              title: Constants.get.appName,
              theme: themeLight(context),
              darkTheme: themeDark(context),
              locale: Locale("en"),
              // supportedLocales: L10n.all,
              // themeMode: data.activeTheme.mode,
            );
          },
        ),
      ),
    );
  }
}
