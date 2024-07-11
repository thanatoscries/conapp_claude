import 'package:flutter/material.dart';
import 'content/all_chapters.dart';
import 'text_page.dart';
import 'content/preamble.dart';

class ConstitutionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Constitution'),
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
