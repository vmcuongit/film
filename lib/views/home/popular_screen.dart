import 'package:film/resources/models/item_popular.dart';
import 'package:film/resources/strings.dart';
import 'package:film/resources/widgets/item_popular_widget.dart';
import 'package:film/views/detail_screen.dart';
import 'package:flutter/material.dart';

class PopularScreen extends StatefulWidget {
  const PopularScreen({Key? key}) : super(key: key);

  @override
  State<PopularScreen> createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1 / 1.7,
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15),
        itemCount: listItemPopular.length,
        itemBuilder: (context, index) {
          return ItemPopularWidget(
            name: listItemPopular[index].name,
            urlPhoto: listItemPopular[index].urlPhoto,
            releaseDate: listItemPopular[index].releaseDate,
            onPress: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DetailScreen()));
            },
          );
        },
      ),
    );
  }
}
