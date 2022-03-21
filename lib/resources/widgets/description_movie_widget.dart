import 'package:flutter/material.dart';

class DesriptionMovieWidget extends StatelessWidget {
  final String? label;
  final String? content;

  const DesriptionMovieWidget({Key? key, this.label, this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 85,
          child: Text(label!),
        ),
        Expanded(child: Text(content!)),
      ],
    );
  }
}
