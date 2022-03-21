import 'package:film/views/home/popular_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _tabBar(),
            _tabBarView(),
          ],
        ),
      ),
    );
  }

  _tabBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 80, left: 10),
      child: TabBar(
        labelStyle: const TextStyle(
            fontFamily: 'Comfortaa', fontSize: 24, fontWeight: FontWeight.bold),
        controller: _tabController,
        tabs: const [
          Text('Popular'),
          Text('NowPlaying'),
          Text('Up Coming'),
          Text('Top Rate'),
        ],
        indicatorColor: Colors.black,
        indicatorPadding: const EdgeInsets.symmetric(horizontal: 10),
        labelPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 13),
        labelColor: Colors.black,
        unselectedLabelColor: Colors.black38,
        isScrollable: true,
      ),
    );
  }

  _tabBarView() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      margin: const EdgeInsets.only(top: 20),
      child: Expanded(
        child: TabBarView(
          controller: _tabController,
          children: [
            PopularScreen(),
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
