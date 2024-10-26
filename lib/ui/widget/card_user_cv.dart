import 'package:flutter/material.dart';

class CardUserCv extends StatelessWidget {
  final String name;
  final String photoUrl;
  const CardUserCv({super.key, required this.name, required this.photoUrl});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListTile(
            leading: Image.network(photoUrl),
            title: Text(name),
          ),
        ),
      ),

      onTap: (){
        print('User details');
      },
    );
  }
}
