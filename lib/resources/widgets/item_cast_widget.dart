import 'package:film/data_sources/api_services.dart';
import 'package:film/resources/strings.dart';
import 'package:flutter/material.dart';

class ItemCastWidget extends StatelessWidget {
  final String? urlPhoto;
  final String? name;
  final String? character;

  const ItemCastWidget({Key? key, this.urlPhoto, this.name, this.character})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: ClipRRect(
            child: (urlPhoto != null)
                ? Image.network(
                    ApiServices.IMAGE_MOVIE_URL + urlPhoto!,
                    fit: BoxFit.fill,
                  )
                : Image.asset(IMAGE_DEFAULT_CAST, fit: BoxFit.fitHeight),
            borderRadius: BorderRadius.circular(8),
          )),
          const SizedBox(
            height: 10,
          ),
          Text(
            name!,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            character!,
            style: TextStyle(fontSize: 10),
          )
        ],
      ),
    );
  }
}
