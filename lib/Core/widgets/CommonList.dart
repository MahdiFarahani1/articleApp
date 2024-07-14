import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/utils/loading.dart';
import 'package:flutter_application_1/Core/widgets/CommonItem.dart';

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
          return Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> item = data[index];
                return InkWell(
                    onTap: () {
                      onPress(item["id"], item["title"], item["_text"]);
                    },
                    child: CommonItem(
                      title: item["title"],
                    ));
              },
            ),
          );
        }
      },
    );
  }
}
