import 'package:flutter/material.dart';
import 'package:kaya_app/core/theme/theme.dart';
import 'package:kaya_app/features/auth/view/pages/login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      theme: AppTheme.lightThemeMode,
      home: LoginPage(),
    );
  }
}
