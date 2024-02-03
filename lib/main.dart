import 'package:coolroots/dependency_injection.dart' as di;
import 'package:drone/config/app_theme.dart';
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
          BlocProvider<UserDetailsCubit>(
            create: (context) => getIt<UserDetailsCubit>(),
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
