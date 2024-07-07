import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/extensions/ex.dart';
import 'package:flutter_application_1/Core/utils/loading.dart';

class CommonList extends StatelessWidget {
  final Future<List<Map<String, dynamic>>> future;
  final Function(int id, String? title, String? content) onPress;
  const CommonList({super.key, required this.future, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CustomLoading.fadingCircle(context));
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No Data Found'));
        } else {
          List<Map<String, dynamic>> data = snapshot.data!;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> item = data[index];
              return Card(
                margin:
                    const EdgeInsets.only(top: 2, bottom: 4, right: 8, left: 8),
                elevation: 5,
                child: ListTile(
                  title: Text(
                    item['title'].toString().limitedTitle(),
                    maxLines: 1,
                  ),
                  onTap: () {
                    onPress(item["id"], item["title"], item["_text"]);
                  },
                ),
              );
            },
          );
        }
      },
    );
  }
}
