import 'package:flutter/material.dart';

import '../data/data.dart';
import '../models/user_model.dart';

class FollowingUsers extends StatelessWidget {
  const FollowingUsers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
          child: Text(
            'Following',
            style: TextStyle(
                fontSize: 24.0,
                letterSpacing: 4.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
            height: 80.0,
            // color: Colors.red,
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 10.0),
              scrollDirection: Axis.horizontal,
              itemCount: users.length,
              itemBuilder: (builder, index) {
                User user = users[index];
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: Theme.of(context).primaryColor),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 6.0,
                          )
                        ]),
                    child: ClipOval(
                      child: Image(
                        width: 60.0,
                        height: 60.0,
                        image: AssetImage(user.profileImageUrl!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ))
      ],
    );
  }
}
