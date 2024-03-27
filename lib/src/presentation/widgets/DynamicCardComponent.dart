import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:comicvine/src/presentation/screens/DetailsScreen.dart';

class DynamicCardComponent extends StatelessWidget {
  final dynamic data;
  final double width;
  final double height;
  final bool isHorizontal;

  DynamicCardComponent({
    required this.data,
    this.width = 150.0,
    this.height = 150.0, // default height
    this.isHorizontal = false,
  });

  @override
  Widget build(BuildContext context) {
    if (data['name'] != null && data['name'] is String &&
        data['image'] != null && data['image']['medium_url'] != null && data['image']['medium_url'] is String &&
        data['api_detail_url'] != null && data['api_detail_url'] is String) {
      return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsScreen(api_detail_url: data['api_detail_url']),
              ),
            );
          },
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
    } else {
      return Container(); // return an empty container if any of the fields is null or not a string
    }
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
            data['image']['medium_url'],
            fit: BoxFit.cover, // this will crop the image at the center
            alignment: Alignment.center, // this will align the image to the center
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          data['name'],
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ];
  }
}