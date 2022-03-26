import 'package:flutter/material.dart';

class ItemPopularWidget extends StatelessWidget {
  final String? name;
  final Widget? widgetPhoto;
  final String? releaseDate;
  final VoidCallback? onPress;

  const ItemPopularWidget(
      {Key? key, this.name, this.widgetPhoto, this.releaseDate, this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: widgetPhoto,
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Text(
                    releaseDate!.toUpperCase(),
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                )
              ],
            ),
          ),
          Container(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  name!,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                ),
              ))
        ],
      ),
    );
  }
}
