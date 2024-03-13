import 'package:comicvine/src/presentation/widgets/CardComponent.dart';
import 'package:flutter/material.dart';
import 'package:comicvine/src/data/models/CardType.dart';

class HorizontalScrollComponent extends StatelessWidget {
  final String title;
  final List<CardElement> cards;

  HorizontalScrollComponent({required this.title, required this.cards});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xFF1E3243),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xFF000000),
                  ),
                  child: Text(
                      "Voir plus",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)
                  ),
                ),
              ],
            ),
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cards.length,
                itemBuilder: (context, index) {
                  return CardComponent(
                      title: cards[index].title,
                      id: cards[index].id,
                      imageUrl: cards[index].imageUrl
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}