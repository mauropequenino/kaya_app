import 'package:flutter/material.dart';
import 'package:kaya_app/core/theme/theme.dart';
import 'package:kaya_app/features/auth/view/pages/login_page.dart';
import 'package:kaya_app/features/home/viewmodel/property_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (context) => PropertyViewModel(),
      child: const MainApp()
    )
    );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightThemeMode,
      home: const LoginPage(),
    );
  }
}
