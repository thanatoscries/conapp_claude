import 'package:flutter/material.dart';
import 'content/all_chapters.dart';
import 'search_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Constitution'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchPage()),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: const Text('Preamble'),
            onTap: () => Navigator.pushNamed(context, '/preamble'),
          ),
          ...allChapters
              .map((chapter) => ExpansionTile(
                    title: Text(chapter.title),
                    children: chapter.sections.map((section) {
                      return ListTile(
                        title: Text(section['title']!),
                        onTap: () =>
                            Navigator.pushNamed(context, section['route']!),
                      );
                    }).toList(),
                  ))
              .toList(),
        ],
      ),
    );
  }
}
