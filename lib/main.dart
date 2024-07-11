import 'package:flutter/material.dart';
import 'content/preamble.dart';
import 'content/all_chapters.dart';
import 'content/chapter_model.dart';
import 'home_page.dart';
import 'text_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Constitution of Zimbabwe',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      routes: {
        '/': (context) => const HomePage(),
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
