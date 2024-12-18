import 'package:day10_database/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
   await dotenv.load(fileName: ".env"); // ! new thing
 await Supabase.initialize(
    url:dotenv.env["Url"]! , // ! new thing
    anonKey:dotenv.env["Key"]! , // ! new thing
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