import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PostDetail extends StatelessWidget {
  const PostDetail({super.key, required this.tag});
  static const routeName = 'PostDetail';
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: Theme.of(context).colorScheme.primary),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1),
          child: Column(
            children: [
              Text(
                'How to write Clean Code',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 30),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    '8 min read  /  ${DateFormat.yMMMMd().format(DateTime.now())}',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: Theme.of(context).colorScheme.primary),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                  'It comes a time in a life of every developer that he starts to think \"Ok, I can write software, my code works, but how can I improve now?\". There are several factors that one can improve to become a better developer, and one of the most important is to write clean code.\n\nRecently I decided that was time to review some of the fundamentals of writing good quality software. So I revisited the Clean Code book and I plan to revisit this book from time to time to make sure I didn\'t forget the principles explained in this awesome book. I\'ll share the main take-aways with you.')
            ],
          ),
        ),
      ),
    );
  }
}
