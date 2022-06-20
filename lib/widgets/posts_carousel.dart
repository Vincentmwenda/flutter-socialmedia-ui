import 'package:flutter/material.dart';

import '../models/post_model.dart';

class PostsCarousel extends StatelessWidget {
  const PostsCarousel(
      {Key? key,
      required this.pageController,
      required this.title,
      required this.posts})
      : super(key: key);
  final PageController pageController;
  final String title;
  final List<Post> posts;

  Widget _buildPosts(BuildContext context, int index) {
    Post post = posts[index];
    return AnimatedBuilder(
      animation: pageController,
      builder: (BuildContext ctx, Widget? widget) {
        var value = 1.0;
        if (pageController.position.haveDimensions) {
          value = pageController.page! - index;
          // print('Index:\t${index.toString()}');
          // print('Page Controller:\t${pageController.page.toString()}');

          value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
          // print(value);
        }
        return Center(
            child: SizedBox(
          height: Curves.easeInOut.transform(value) * 400.0,
              child: widget,
        ));
      },
      child: Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 2),
                    blurRadius: 6.0,
                  )
                ]),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image(
                  height: 400,
                  width: double.infinity,
                  image: AssetImage(post.imageUrl),
                  fit: BoxFit.cover,
                )),
          ),
          Positioned(
            left: 10.0,
            right: 10.0,
            bottom: 10.0,
            child: Container(
              height: 110.0,
              padding: const EdgeInsets.all(12.0),
              decoration: const BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                ),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      post.title,
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      post.location,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 6.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                            const SizedBox(width: 6.0),
                            Text(
                              post.likes.toString(),
                              style: const TextStyle(fontSize: 18.0),
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.comment,
                              color: Theme.of(context).primaryColor,
                            ),
                            const SizedBox(width: 6.0),
                            Text(
                              post.comments.toString(),
                              style: const TextStyle(fontSize: 18.0),
                            )
                          ],
                        ),
                      ],
                    )
                  ]),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 24.0,
                letterSpacing: 4.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 400.0,
          child: PageView.builder(
              controller: pageController,
              itemCount: posts.length,
              itemBuilder: ((BuildContext ctx, i) => _buildPosts(ctx, i))),
        )
      ],
    );
  }
}
