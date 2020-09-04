import 'package:flutter/material.dart';

class CustomScrollWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          // pinned: true,
          expandedHeight: 250.0,
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            background: profile(),
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 50.0,
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: Text('list item $index'),
              );
            },
          ),
        ),
      ],
    );
  }
}

Widget profile() {
  return Column(
    children: [
      Spacer(
        flex: 1,
      ),
      Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              "https://i.pinimg.com/564x/f4/1f/e3/f41fe384dd173f91201f622e11be8a31.jpg",
            ),
          ),
        ),
        height: 100,
        width: 100,
      ),
      SizedBox(height: 15),
      RichText(
        text: TextSpan(children: [
          TextSpan(
            text: "Alan",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 28),
          ),
          TextSpan(
            text: " Walker",
            style: TextStyle(color: Colors.white, fontSize: 28),
          ),
        ]),
      ),
      Spacer(
        flex: 2,
      ),
    ],
  );
}
