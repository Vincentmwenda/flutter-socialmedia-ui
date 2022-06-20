import 'package:flutter/material.dart';

import '../screens/login_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/home_screen.dart';
import '../data/data.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer(this.appTitle, {Key? key}) : super(key: key);
  final String appTitle;

  Widget _buildDrawer({
    required Icon icon,
    required String title,
    required void Function() onTap,
  }) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: const TextStyle(fontSize: 20.0),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Stack(
            children: <Widget>[
              Image(
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                image: AssetImage(currentUser.backgroundImageUrl!),
              ),
              Positioned(
                  bottom: 20.0,
                  left: 20.0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        height: 100.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 3.0,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        child: ClipOval(
                            child: Image(
                          image: AssetImage(currentUser.profileImageUrl!),
                          fit: BoxFit.cover,
                        )),
                      ),
                      const SizedBox(
                        width: 6.0,
                      ),
                      Text(
                        currentUser.name!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ))
            ],
          ),
          _buildDrawer(
            icon: const Icon(Icons.home),
            title: 'Home',
            onTap: () => Navigator.of(context)
                .pushReplacementNamed(HomeScreen.routeName),
          ),
          _buildDrawer(
            icon: const Icon(Icons.chat),
            title: 'Chat',
            onTap: () {},
          ),
          _buildDrawer(
            icon: const Icon(Icons.location_on),
            title: 'Map',
            onTap: () {},
          ),
          _buildDrawer(
            icon: const Icon(Icons.account_circle),
            title: 'Your Profile',
            onTap: () => Navigator.of(context).pushReplacementNamed(
                ProfileScreen.routeName,
                arguments: currentUser),
          ),
          _buildDrawer(
            icon: const Icon(Icons.settings),
            title: 'Settings',
            onTap: () {},
          ),
          Expanded(
              child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: _buildDrawer(
              icon: const Icon(Icons.logout),
              title: 'Logout',
              onTap: () =>
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (_) => LoginScreen(appTitle),
              )),
            ),
          )),
        ],
      ),
    );
  }
}
