import 'package:drone/bloc/drones_details_cubit/drones_details_cubit.dart';
import 'package:drone/config/app_theme.dart';
import 'package:drone/dependency_injection.dart' as di;
import 'package:drone/dependency_injection.dart';
import 'package:drone/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  // if (kDebugMode) Bloc.observer = AppBlocObserver();

  runApp(
    const CoolRootsApp(),
  );
}

class CoolRootsApp extends StatelessWidget {
  const CoolRootsApp({super.key});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<DronesDetailsCubit>(
            create: (context) => getIt(),
          ),
        ],
        child: ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            // title: 'CoolRoots',
            theme: AppTheme.lightTheme,
            home: const SplashPage(),
          ),
        ),
      );
}
