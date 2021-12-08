import 'package:flutter/material.dart';
import 'package:todoapp/ui/view/details_page.dart';

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
    return GestureDetector(
      onTap: ()=>{

        Navigator.pop(context),
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailsPageView()) )

      },
      child: Card(
        child: ListTile(
          title: Text(title),
          subtitle: Text(subtitle),
          trailing: imagePlace,
        ),
      ),
    );
  }


  Widget get imagePlace{
    return imageUrl.isEmpty ? const SizedBox(width: 100 ,child:Placeholder()) : Image.network(imageUrl);
  }
}
