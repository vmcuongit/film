import 'package:film/data_sources/api_services.dart';
import 'package:film/resources/models/movie.dart';
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
  Future<List<Movie>>? moviePopulars;

  loadMoviePopular() {
    moviePopulars = ApiServices().fetchMoviePopular();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadMoviePopular();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: FutureBuilder<List<Movie>>(
        future: moviePopulars,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(ERROR_LOAD_DATA),
            );
          }
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          List<Movie> listMovieLoaded = snapshot.data!;
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 310,
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15),
            itemCount: listMovieLoaded.length,
            itemBuilder: (context, index) {
              return ItemPopularWidget(
                name: listMovieLoaded[index].originalTitle,
                widgetPhoto: listMovieLoaded[index].posterPath != null
                    ? Image.network(
                        ApiServices.IMAGE_MOVIE_URL +
                            listMovieLoaded[index].posterPath!,
                        fit: BoxFit.fill,
                      )
                    : Image.asset(IMAGE_DEFAULT, fit: BoxFit.fill),
                releaseDate: listMovieLoaded[index].releaseDate,
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailScreen(
                                movie: listMovieLoaded[index],
                              )));
                },
              );
            },
          );
        },
      ),
    );
  }
}
