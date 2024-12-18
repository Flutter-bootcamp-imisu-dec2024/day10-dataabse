import 'package:day10_database/pages/list_page.dart';
import 'package:day10_database/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
 await Supabase.initialize(
    url: "",
    anonKey: ""
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPage()
    );
  }
}