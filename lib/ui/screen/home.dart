import 'package:cvhub/ui/widget/card_user_cv.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CardUserCv(
          name: "Jhonacode",
          photoUrl: 'https://avatars.githubusercontent.com/u/53523825?v=4',
        ),
      ],
    );
  }
}
