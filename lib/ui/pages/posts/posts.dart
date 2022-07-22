import 'package:flutter/material.dart';

import '../shared/animation_slider.dart';
import 'components/post_preview.dart';

class PostPage extends StatelessWidget {
  const PostPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationSlider(
      child: ListView(
        // physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: const [
          PostPreview(),
          // SizedBox(height: 25),
          // PostPreview(),
          // SizedBox(height: 25),
          // PostPreview(),
          // SizedBox(height: 25),
          // PostPreview(),
          // SizedBox(height: 25),
          // PostPreview(),
          // SizedBox(height: 25),
          // PostPreview(),
          // SizedBox(height: 25),
          // PostPreview(),
        ],
      ),
    );
  }
}
