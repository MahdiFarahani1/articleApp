import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/extensions/ex.dart';
import 'package:flutter_application_1/Core/utils/esay_size.dart';

class CommonItem extends StatelessWidget {
  final String title;
  const CommonItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      width: EsaySize.width(context),
      height: 50,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: const Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 4, right: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title.limitedTitle(),
              textDirection: TextDirection.rtl,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
            const Icon(Icons.keyboard_arrow_left_outlined)
          ],
        ),
      ),
    );
  }
}
