import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:professional_repository/ui/pages/posts/components/post_detail.dart';

class PostPreview extends StatelessWidget {
  const PostPreview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      height: 140,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PostDetail(tag: '1'),
            ),
          );
          // Navigator.of(context).pushReplacementNamed(PostDetail.routeName);
        },
        child: Card(
          color: Theme.of(context).colorScheme.secondaryContainer,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Flexible(
                  flex: 2,
                  child: SizedBox(
                    child: Image.network(
                        'https://images-na.ssl-images-amazon.com/images/I/41xShlnTZTL._SX376_BO1,204,203,200_.jpg'),
                  ),
                ),
                const SizedBox(width: 20),
                Flexible(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // top text
                      Row(
                        children: [
                          Text(
                            DateFormat.yMMMMd().format(DateTime.now()),
                          ),
                          const SizedBox(width: 20),
                          const Text('8 min read'),
                        ],
                      ),
                      const SizedBox(height: 5),
                      // title text
                      Text(
                        'How to write Clean Code',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 15),
                      // short description text
                      Text('Learn the top 10 principles of writing good code',
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

