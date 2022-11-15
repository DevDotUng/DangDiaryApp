import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class SearchSkeleton extends StatelessWidget {
  const SearchSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Container(),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        color: Colors.white,
        child: Column(
          children: [
            SkeletonAvatar(
              style: SkeletonAvatarStyle(
                width: double.infinity,
                height: 40,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 7,
                  mainAxisSpacing: 8,
                  mainAxisExtent: 221,
                ),
                itemBuilder: (context, index) {
                  return SkeletonAvatar();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
