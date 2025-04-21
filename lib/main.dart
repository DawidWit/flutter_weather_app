import 'package:flutter/material.dart';
import 'package:flutter_weather_project/providers/location_provider.dart';
import 'package:flutter_weather_project/screens/location_screen_main.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load();
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LocationProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        theme: _themeData,
        home: LocationScreenMain(),
      ),
    );
  }
}

final ThemeData _themeData = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Color(0xFFA1CDA8),
  scaffoldBackgroundColor: Color(0xFF27233A),
  canvasColor: Color(0xFF27233A),

  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF27233A),
    iconTheme: IconThemeData(color: Color(0xFFA1CDA8), size: 32),
    titleTextStyle: TextStyle(
      color: Color(0xFFA1CDA8),
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  ),

  colorScheme: ColorScheme.dark(
    primary: Color(0xFFA1CDA8),
    onPrimary: Color(0xFF27233A),
    surface: Color(0xFF27233A),
    onSurface: Color(0xFFA1CDA8),
    secondary: Color(0xFFA1CDA8),
    onSecondary: Color(0xFF27233A),
    tertiary: Color(0xFFF4AC45),
    onTertiary: Color(0xFF27233A),
  ),

  cardColor: Color(0xFF1C1A2B),

  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Color(0xFFA1CDA8)),
    bodyMedium: TextStyle(color: Color(0xFFA1CDA8)),
    titleLarge: TextStyle(
      color: Color(0xFFA1CDA8),
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    titleSmall: TextStyle(color: Color(0xFFA1CDA8)),
  ),

  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Color(0xFFF4AC45),
      textStyle: TextStyle(fontWeight: FontWeight.bold),
    ),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color(0xFFA1CDA8),
      foregroundColor: Color(0xFF27233A),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    ),
  ),

  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Color(0xFFA1CDA8),
    foregroundColor: Color(0xFF27233A),
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Color(0xFF27233A),
    labelStyle: TextStyle(color: Color(0xFFA1CDA8)),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFA1CDA8)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFA1CDA8), width: 2),
    ),
  ),
);
