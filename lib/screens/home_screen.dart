import 'package:flutter/material.dart';

import '../widgets/following_users.dart';
import '../widgets/posts_carousel.dart';
import '../widgets/custom_drawer.dart';
import '../data/data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(this.appTitle, {Key? key}) : super(key: key);
  static const routeName = '/home_screen';
  final String appTitle;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 1);
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
          centerTitle: true,
          title: Text(
            widget.appTitle,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              letterSpacing: 10.0,
            ),
          ),
          bottom: TabBar(
              controller: _tabController,
              labelColor: Theme.of(context).primaryColor,
              labelStyle: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
              indicatorWeight: 3.0,
              unselectedLabelStyle: const TextStyle(fontSize: 18.0),
              tabs: const [
                Tab(
                  text: 'Earliest',
                ),
                Tab(
                  text: 'Trending',
                ),
                Tab(
                  text: 'Latest',
                ),
              ]),
        ),
        drawer: CustomDrawer(widget.appTitle),
        body: TabBarView(controller: _tabController, children: [
          const Center(
            child: Text('Latest Page'),
          ),
          ListView(
            // Allows us to scroll up and down, can be replaced by SingleChildScrollView
            children: [
              const FollowingUsers(),
              PostsCarousel(
                  pageController: _pageController,
                  title: 'Posts',
                  posts: posts),
            ],
          ),
          const Center(
            child: Text('Earliest Page'),
          ),
        ]),
      ),
    );
  }
}

/*
  body: const SingleChildScrollView(
        child: FollowingUsers(),
      ),
 */
