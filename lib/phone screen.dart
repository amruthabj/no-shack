import 'package:flutter/material.dart';
import 'colors.dart';
import 'map screen.dart';

class phonetype extends StatefulWidget {
  const phonetype({Key? key}) : super(key: key);

  @override
  _phonetypeState createState() => _phonetypeState();
}

class _phonetypeState extends State<phonetype> {
  int tappedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kbg,
      ),
      backgroundColor: kbg,
      body: Column(
        children: [
          Row(
            children: [
              const Flexible(
                flex: 1,
                child: Center(
                  child: Text(
                    'Find My Device',
                    style: TextStyle(fontSize: 30.0, color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Image.asset(
                  'images/img_1.png',
                  width: 50, // Adjust the width as needed
                  height: 50, // Adjust the height as needed
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Column(
            children: [
              buildCustomImage(0, 'images/google pixel.png', 'Google Pixel 4a',BorderRadius.circular(30.0)),
              const SizedBox(height: 10.0),
              buildCustomImage(1, 'images/oneplus.png', 'One Plus 8',const BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))),
              const SizedBox(height: 4.0),
              buildCustomImage(2, 'images/moto.png', 'Motrola Moto g73\n5G',BorderRadius.circular(0.0)),
              const SizedBox(height: 4.0),
              buildCustomImage(3, 'images/xiomi.png', 'Xiaomi 11i',BorderRadius.circular(0.0)),
              const SizedBox(height: 4.0),
              buildCustomImage(4, 'images/vivo.png', 'Vivo V2022',const BorderRadius.only(bottomLeft: Radius.circular(30.0), bottomRight: Radius.circular(30.0))),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildCustomImage(int index, String imageLink, String text,BorderRadius borderRadius) {
    return GestureDetector(
      onTap: () {
        setState(() {
          tappedIndex = index;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => mapscreen(imageLink: imageLink, text: text)),
          );
        });
      },
      child: CustomImage(
        isTapped: tappedIndex == index,
        imageLink: imageLink,
        text: text,
        borderRadius:borderRadius ,
      ),
    );
  }
}

class CustomImage extends StatelessWidget {
  const CustomImage({
    Key? key,
    required this.isTapped,
    required this.imageLink,
    required this.text,
    required this.borderRadius,
  }) : super(key: key);

  final bool isTapped;
  final String imageLink;
  final String text;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      width: 375.0,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: kco,
      ),
      child: Row(
        children: [
          Container(
            height: 70.0,
            width: 70.0,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: const Color(0xFF0D0F0E),
            ),
            child: Image(
              image: AssetImage(imageLink),
              width: 40.0,
              height: 40.0,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  text,
                  style: const TextStyle(fontSize: 25.0, color: Colors.white),
                ),
              ),
              if (isTapped)
                const Text(
                  'This Device', // Change text here
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Color(0xFF97CAFF),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
