import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/blocs/to_do_bloc/to_do_app_cubit.dart';
import 'package:to_do_app/components/category_icon.dart';
import 'package:to_do_app/components/my_text.dart';

class ListTileExample extends StatelessWidget {
  final String imagePath; // Required
  final String? title; // Optional
  final String? subtitle;
  bool completed;
  var func;

  ListTileExample(
      {super.key,
      required this.imagePath,
      this.title,
      this.subtitle,
      this.completed = false,
      this.func});

  bool enabled = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      enabled: completed,
      selected: false,
      leading: Opacity(
          opacity: completed ? 0.6 : 1.0,
          child: Image.asset(imagePath)),
      title: title != null
          ? MyText(
              text: title!,
              color: completed ? Colors.grey : Colors.black,
              isBold: true,
              size: 18,
              decoration: completed
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            )
          : null,
      subtitle: subtitle != null
          ? MyText(
              text: subtitle!,
              size: 18,
              color: Colors.grey,
              isBold: true,
              decoration: completed
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            )
          : null,
      trailing: Transform.scale(
          scale: 1.4,
          child: IconButton(
              icon: Icon(
                completed
                    ? Icons.check_box
                    : Icons.check_box_outline_blank,
                color: completed
                    ? const Color(0xff36285d)
                    : const Color(0xff36285d),
              ),
              onPressed: func)),
    );

  }
}
