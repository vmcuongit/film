import 'package:film/resources/strings.dart';
import 'package:film/resources/widgets/description_movie_widget.dart';
import 'package:film/resources/widgets/item_cast_widget.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
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
        Image.asset(
          "assets/images/bg2x.jpg",
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,
        ),
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
            child: Image.asset("assets/images/image1.jpg", fit: BoxFit.cover),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              children: [
                Text(
                  "RAYA và rồng thần cuối cùng",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                DesriptionMovieWidget(
                  label: XUAT_BAN,
                  content: "05-T3-2021",
                ),
                const SizedBox(
                  height: 20,
                ),
                DesriptionMovieWidget(
                  label: THE_LOAI,
                  content:
                      "Phim Hoạt Hình, Phim Phiêu Lưu, Phim Giả Tượng, Phim Gia Đình, Phim Hành Động",
                ),
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
            child: ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: listItemCast.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) => ItemCastWidget(
                    urlPhoto: listItemCast[index].urlPhoto,
                    name: listItemCast[index].name,
                    character: listItemCast[index].character,
                  )),
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
            "Raya và Rồng Thần Cuối Cùng kể về một vương quốc huyền bí có tên là Kumandra – vùng đất mà loài rồng và con người sống hòa thuận với nhau. Nhưng rồi một thế lực đen tối bỗng đe dọa bình yên nơi đây, loài rồng buộc phải hi sinh để cứu lấy loài người. 500 năm sau, thế lực ấy bỗng trỗi dậy và một lần nữa, Raya là chiến binh duy nhất mang trong mình trọng trách đi tìm Rồng Thần cuối cùng trong truyền thuyết nhằm hàn gắn lại khối ngọc đã vỡ để cứu lấy vương quốc. Thông qua cuộc hành trình, Raya nhận ra loài người cần nhiều hơn những gì họ nghĩ, đó chính là lòng tin và sự đoàn kết.",
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
