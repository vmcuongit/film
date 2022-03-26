import 'package:film/data_sources/api_services.dart';
import 'package:film/resources/models/cast.dart';
import 'package:film/resources/models/movie.dart';
import 'package:film/resources/strings.dart';
import 'package:film/resources/widgets/description_movie_widget.dart';
import 'package:film/resources/widgets/item_cast_widget.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final Movie? movie;
  const DetailScreen({Key? key, this.movie}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Future<List<Cast>>? futureCasts;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadCast();
  }

  _loadCast() {
    futureCasts = ApiServices().fetchCastMovie(widget.movie!.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _getAppBar(),
      body: _getBody(),
    );
  }

  _getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(color: Colors.black),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Icon(Icons.favorite_border),
        )
      ],
    );
  }

  _getBody() {
    return Stack(
      children: [
        if (widget.movie?.backdropPath != null) ...[
          Image.network(
            ApiServices.BACKGROUND_DETAIL_MOVIE_URL +
                (widget.movie?.backdropPath).toString(),
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
          ),
        ],
        Container(
          color: Colors.white.withOpacity(0.8),
          height: MediaQuery.of(context).size.height,
          child: ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: [
              const SizedBox(
                height: 20,
              ),
              _header(),
              const SizedBox(
                height: 20,
              ),
              _cast(),
              const SizedBox(
                height: 30,
              ),
              _overview()
            ],
          ),
        )
      ],
    );
  }

  _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 120,
            child: widget.movie?.posterPath != null
                ? Image.network(
                    ApiServices.IMAGE_MOVIE_URL +
                        (widget.movie?.posterPath).toString(),
                    fit: BoxFit.fill,
                  )
                : Image.asset(IMAGE_DEFAULT, fit: BoxFit.fill),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              children: [
                Text(
                  (widget.movie?.originalTitle).toString(),
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                DesriptionMovieWidget(
                  label: XUAT_BAN,
                  content: (widget.movie!.releaseDate),
                ),
                // const SizedBox(
                //   height: 20,
                // ),
                // DesriptionMovieWidget(
                //   label: THE_LOAI,
                //   content:
                //       "Phim Hoạt Hình, Phim Phiêu Lưu, Phim Giả Tượng, Phim Gia Đình, Phim Hành Động",
                // ),
              ],
            ),
          ))
        ],
      ),
    );
  }

  _cast() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            CAST,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 160,
            child: FutureBuilder<List<Cast>>(
              future: futureCasts,
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
                List<Cast> listCastLoaded = snapshot.data!;
                return ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: listCastLoaded.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) => ItemCastWidget(
                        urlPhoto: listCastLoaded[index].profilePath,
                        name: listCastLoaded[index].name,
                        character: listCastLoaded[index].character,
                      )),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  _overview() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            OVERVIEW,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            (widget.movie!.overview).toString(),
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
