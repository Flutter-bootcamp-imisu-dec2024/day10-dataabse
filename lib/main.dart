import 'package:day10_database/pages/list_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
 await Supabase.initialize(
    url: "https://ddzkcgtwforrroaorlmd.supabase.co",
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRkemtjZ3R3Zm9ycnJvYW9ybG1kIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQzNTcyNzYsImV4cCI6MjA0OTkzMzI3Nn0.l5LL5y9ty5yHAVm-FfrZ5fqyR7zk-6YCPX4YvkqYKf0",
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ListPage()
    );
  }
}


