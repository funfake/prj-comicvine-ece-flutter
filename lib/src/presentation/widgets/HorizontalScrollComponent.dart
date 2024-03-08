import 'package:flutter/material.dart';

class HorizontalScrollComponent extends StatelessWidget {
  final String title;
  final List<String> cardTitles;

  HorizontalScrollComponent({required this.title, required this.cardTitles});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)
            ),
          ),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cardTitles.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF284C6A),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      width: 150,
                      child: Center(
                        child: Text(
                          cardTitles[index],
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}