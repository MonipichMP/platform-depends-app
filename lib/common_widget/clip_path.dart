import 'package:flutter/material.dart';

class ClipPathWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: Clipper(),
      child: SizedBox(
        width: double.infinity,
        height: 240,
        child: Stack(
          children: [
            Container(color: Colors.blueAccent),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Hello world",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 30);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

    var secondControlPoint = Offset(size.width - (size.width / 4), size.height);
    var secondPoint = Offset(size.width, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
