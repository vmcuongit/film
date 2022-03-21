import 'package:film/resources/models/item_cast.dart';
import 'package:film/resources/models/item_popular.dart';

const String XUAT_BAN = 'Xuất bản';
const String THE_LOAI = 'Thể loại';
const String CAST = 'Cast';
const String OVERVIEW = 'Overview';

final List<ItemPopular> listItemPopular = [
  ItemPopular(
    name: 'RAYA và rồng thần cuối cùng',
    urlPhoto: 'assets/images/image1.jpg',
    releaseDate: "05-T3-2021",
  ),
  ItemPopular(
    name: 'Tom và Jerry: Quậy Tung New York',
    urlPhoto: 'assets/images/image2.jpg',
    releaseDate: "12-T12-2021",
  ),
  ItemPopular(
    name: 'Chaos Walking',
    urlPhoto: 'assets/images/image3.jpg',
    releaseDate: "19-T10-2021",
  ),
  ItemPopular(
    name: 'Tom và Jerry: Quậy Tung New York',
    urlPhoto: 'assets/images/image4.jpg',
    releaseDate: "01-T6-2021",
  ),
  ItemPopular(
    name: 'RAYA và rồng thần cuối cùng',
    urlPhoto: 'assets/images/image1.jpg',
    releaseDate: "02-T2-2021",
  ),
  ItemPopular(
    name: 'Fear of Rain',
    urlPhoto: 'assets/images/image2.jpg',
    releaseDate: "15-T9-2021",
  ),
];

final List<ItemCast> listItemCast = [
  ItemCast(
      name: "Kelly Marie Tran",
      character: "Raya (voice)",
      urlPhoto: "assets/images/cast1.jpg"),
  ItemCast(
      name: "Awkwafina",
      character: "Sisu (voice)",
      urlPhoto: "assets/images/cast2.jpg"),
  ItemCast(
      name: "Izaac Wang",
      character: "Boun (voice)",
      urlPhoto: "assets/images/cast3.jpg"),
  ItemCast(
      name: "Kelly Marie Tran",
      character: "Raya (voice)",
      urlPhoto: "assets/images/cast1.jpg"),
];
