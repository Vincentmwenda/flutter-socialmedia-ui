import 'package:flutter/material.dart';

import '../widgets/posts_carousel.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/profile_clipper.dart';
import '../models/user_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen(this.appTitle, {Key? key}) : super(key: key);
  static const routeName = '/profile_screen';
  final String appTitle;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late User user;
  late PageController _yourPostsPageController;
  late PageController _yourFavoritesPageController;
  var _loadedInitialData = false;

  @override
  void initState() {
    super.initState();
    _yourPostsPageController =
        PageController(initialPage: 0, viewportFraction: 0.8);
    _yourFavoritesPageController =
        PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_loadedInitialData) {
      user = ModalRoute.of(context)!.settings.arguments as User;
      _loadedInitialData = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: CustomDrawer(widget.appTitle),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipPath(
                  clipper: ProfileClipper(),
                  child: Image(
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    image: AssetImage(user.backgroundImageUrl!),
                  ),
                ),
                Positioned(
                  top: 50.0,
                  left: 20.0,
                  child: IconButton(
                    onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                    icon: Icon(
                      Icons.menu,
                      color: Theme.of(context).primaryColor,
                      size: 30.0,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10.0,
                  child: Container(
                    decoration:
                        const BoxDecoration(shape: BoxShape.circle, boxShadow: [
                      BoxShadow(
                        color: Colors.black45,
                        offset: Offset(0, 2),
                        blurRadius: 6.0,
                      ),
                    ]),
                    child: ClipOval(
                      child: Image(
                        height: 120.0,
                        width: 120.0,
                        image: AssetImage(
                          user.profileImageUrl!,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                user.name!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  letterSpacing: 1.5,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    const Text(
                      'Following',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 22.0,
                      ),
                    ),
                    const SizedBox(
                      height: 2.0,
                    ),
                    Text(
                      user.following.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    const Text(
                      'Followers',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 22.0,
                      ),
                    ),
                    const SizedBox(
                      height: 2.0,
                    ),
                    Text(
                      user.followers.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ],
            ), const SizedBox(
              height: 50.0,
            ),
            PostsCarousel(
              pageController: _yourPostsPageController,
              title: 'Your Posts',
              posts: user.posts!,
            ), const SizedBox(
              height: 50.0,
            ),
            PostsCarousel(
              pageController: _yourFavoritesPageController,
              title: 'Favorites',
              posts: user.favorites!,
            ),
            const SizedBox(
              height: 50.0,
            ),
          ],
        )),
      ),
    );
  }
}
