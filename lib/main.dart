import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_structure_with_riverpod/auth/auth.dart';
import 'package:project_structure_with_riverpod/routes.dart';
import 'package:project_structure_with_riverpod/utils/utils.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: GoogleFonts.workSans().fontFamily,
            scaffoldBackgroundColor: ColorConstants.whiteColor,
          ),
          home: child,
          routes: {...appRoutes},
        );
      },
      child: const LoginScreenView(),
    );
  }
}
