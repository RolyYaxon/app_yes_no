import 'package:app_yes_no/config/theme/app_theme.dart';
import 'package:app_yes_no/presentation/chat/screens/chat_screen.dart';
import 'package:app_yes_no/presentation/providers/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColor: 3).theme(),
        title: 'Yes No App',
        home: const ChatScreen()
      ),
    );
  }
}