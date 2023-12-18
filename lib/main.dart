import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_habit_builder_app/res/strings.dart';
import 'package:flutter_habit_builder_app/routes/app_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  Paint.enableDithering = true;
  await preloadAssetFolder(imagesFolderPath);
  await preloadAssetFolder(iconsFolderPath);
  runApp(
    const MyApp(),
  );
}

// PreLoading Assets
Future<void> preloadAssetFolder(String folderPath) async {
  final assetManifest = await rootBundle.loadString('AssetManifest.json');
  final Map<String, dynamic> manifestMap = json.decode(assetManifest);

  final assets = manifestMap.keys
      .where((String key) => key.startsWith(folderPath))
      .toList();

  for (final assetPath in assets) {
    final imageProvider = AssetImage(assetPath);
    final imageStream = imageProvider.resolve(ImageConfiguration.empty);
    imageStream.addListener(
      ImageStreamListener((info, synchronousCall) {
        if (kDebugMode) {
          print('Asset preloaded and cached: $assetPath');
        }
      }),
    );
  }
}

Future<void> loadFonts() async {
  final fontLoader = FontLoader('Roboto');
  fontLoader.addFont(
    rootBundle.load('assets/fonts/Klasik/Klasik-Regular.otf'),
  );
  fontLoader.addFont(
    rootBundle.load('assets/fonts/Manrope/Manrope-Regular.ttf'),
  );
  await fontLoader.load();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (context, child) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: AppStrings.appName,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            scrolledUnderElevation: 0,
            elevation: 0,
          ),
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            },
          ),
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(
              0xffFDA758,
            ),
          ),
          useMaterial3: true,
        ),
        routerConfig: AppNavigation.router,
      ),
    );
  }
}
