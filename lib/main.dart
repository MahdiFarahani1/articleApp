import 'package:flutter/material.dart';
import 'package:flutter_application_1/Features/Home/view/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFFFFF), // White
        useMaterial3: true,
        colorScheme: ColorScheme(
          onBackground: Colors.black,
          background: const Color(0xFFFFFFFF), // White
          brightness: Brightness.light,
          primary: const Color(0xFFB0BEC5), // Grey 400
          surfaceTint: const Color(0xFFB0BEC5), // Grey 400
          onPrimary: Colors.white,
          primaryContainer: const Color(0xFFE0E0E0), // Grey 300
          onPrimaryContainer: Colors.black,
          secondary: const Color(0xFFB0BEC5), // Grey 400
          onSecondary: Colors.white,
          secondaryContainer: const Color(0xFFE0E0E0), // Grey 300
          onSecondaryContainer: Colors.black,
          tertiary: const Color(0xFFB0BEC5), // Grey 400
          onTertiary: Colors.white,
          tertiaryContainer: const Color(0xFFE0E0E0), // Grey 300
          onTertiaryContainer: Colors.black,
          error: const Color(0xFFD32F2F), // Red 700
          onError: Colors.white,
          errorContainer: const Color(0xFFFFCDD2), // Red 100
          onErrorContainer: const Color(0xFFB71C1C), // Red 900
          surface: const Color(0xFFFFFFFF), // White
          onSurface: const Color(0xFF000000), // Black
          onSurfaceVariant: const Color(0xFF757575), // Grey 600
          outline: const Color(0xFFB0BEC5), // Blue Grey 200
          outlineVariant: Colors.blueGrey.shade700, // Blue Grey 400
          shadow: const Color(0xFF000000), // Black
          scrim: const Color(0xFF000000), // Black
          inverseSurface: const Color(0xFFB0BEC5), // Grey 400
          inversePrimary: const Color(0xFFE0E0E0), // Grey 300
          surfaceVariant: const Color.fromRGBO(200, 175, 110, 1.0),
        ),

        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFB0BEC5), // Grey 400
          foregroundColor: Colors.white,
        ),
        textTheme: const TextTheme(bodySmall: TextStyle(color: Colors.white)),
        buttonTheme: const ButtonThemeData(
          buttonColor: Color(0xFFB0BEC5), // Grey 400
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF78909C)),
        ),
        iconTheme: const IconThemeData(
          color: Color.fromRGBO(200, 175, 110, 1.0), // Custom RGB color
        ),
      ),
      home: MyHomePage(),
    );
  }
}
