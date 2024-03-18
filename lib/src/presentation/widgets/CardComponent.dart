import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:comicvine/src/presentation/screens/DetailsScreen.dart';

class CardComponent extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String id;
  final double width;
  final double height;
  final bool isHorizontal;

  CardComponent({
    this.title = '',
    this.imageUrl = '',
    this.id = '',
    this.width = 150.0,
    this.height = 150.0, // default height
    this.isHorizontal = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => DetailsScreen(
      //         detailItem: detailItem,
      //       ),
      //     ),
      //   );
      // },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF284C6A),
            borderRadius: BorderRadius.circular(10.0),
          ),
          width: width,
          height: height, // use the height parameter here
          child: isHorizontal
              ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _buildChildren(),
          )
              : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _buildChildren(),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildChildren() {
    return [
      Container(
        width: width, // set the width of the image
        height: width, // set the height of the image to be the same as the width
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover, // this will crop the image at the center
            alignment: Alignment.center, // this will align the image to the center
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ];
  }
}