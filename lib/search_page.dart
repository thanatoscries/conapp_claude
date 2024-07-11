import 'package:flutter/material.dart';
import 'content/all_chapters.dart';
import 'text_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Map<String, String>> searchResults = [];

  void performSearch(String query) {
    if (query.isEmpty) {
      setState(() {
        searchResults = [];
      });
      return;
    }

    List<Map<String, String>> results = [];
    for (var chapter in allChapters) {
      for (var section in chapter.sections) {
        if (section['title']!.toLowerCase().contains(query.toLowerCase()) ||
            section['content']!.toLowerCase().contains(query.toLowerCase())) {
          results.add({
            'title': '${chapter.title} - ${section['title']}',
            'route': section['route']!,
            'content': section['content']!,
          });
        }
      }
    }
    setState(() {
      searchResults = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search the Constitution',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: performSearch,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                final result = searchResults[index];
                return ListTile(
                  title: Text(result['title']!),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TextPage(
                          title: result['title']!,
                          content: result['content']!,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
