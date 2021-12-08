import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {

  final String title;
  final String subtitle;
  final String imageUrl;
  const CustomCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: imagePlace,
      ),
    );
  }


  Widget get imagePlace{
    return imageUrl.isEmpty ? Container(width: 100 ,child:Placeholder()) : Image.network(imageUrl);
  }
}
