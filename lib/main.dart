import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'content/preamble.dart';
import 'content/all_chapters.dart';
import 'chapter_model.dart';
import 'home_page.dart';
import 'text_page.dart';
import 'search_page.dart';
import 'about_page.dart';
import 'chat_page.dart';
import 'constitution_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, Map<String, List<String>>> constitution = {
      // Your constitution data here
    };

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Constitution of Zimbabwe',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: HomePage(constitution: constitution),
      routes: {
        '/constitution': (context) => ConstitutionPage(),
        '/search': (context) => const SearchPage(),
        '/about': (context) => const AboutPage(),
        '/chat': (context) => const ChatPage(),
        '/preamble': (context) =>
            const TextPage(title: 'Preamble', content: preambleText),
        ...generateRoutesFromChapters(allChapters),
      },
      initialRoute: '/',
    );
  }
}

Map<String, WidgetBuilder> generateRoutesFromChapters(List<Chapter> chapters) {
  Map<String, WidgetBuilder> routes = {};
  for (var chapter in chapters) {
    for (var section in chapter.sections) {
      routes[section['route']!] = (context) =>
          TextPage(title: section['title']!, content: section['content']!);
    }
  }
  return routes;
}
