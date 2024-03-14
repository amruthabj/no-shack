import 'package:flutter/material.dart';
import 'colors.dart';
import 'phone screen.dart';

class mapscreen extends StatefulWidget {
  final String imageLink;
  final String text;

  const mapscreen({Key? key, required this.imageLink, required this.text}) : super(key: key);

  @override
  _mapscreenState createState() => _mapscreenState();
}

class _mapscreenState extends State<mapscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 400,
                child: Image.asset(
                  'images/img_3.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 20.0,
                left: 20.0,
                child: RoundIconButton(
                  icon: Icons.arrow_back,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                color: kco,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 95.0,
                    width: 375.0,
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: kco,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            image: AssetImage(widget.imageLink),
                            width: 40.0,
                            height: 40.0,
                          ),
                        ),
                        const SizedBox(width: 20.0),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                widget.text,
                                style: const TextStyle(fontSize: 20.0, color: Colors.white),
                              ),
                            ),
                            const Text(
                              'Contacting device...', // Change text here
                              style: TextStyle(
                                fontSize: 17.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 50.0),
                        Icon(Icons.settings, color: Colors.white, size: 20.0),
            
                      ],
                    ),
                  ),
                  SizedBox(height: 30.0),
                  const Column(
                    children:[RowWidget(icon: Icons.multitrack_audio_outlined, text: 'Play sound'),
                      SizedBox(height:10.0 ,),
                      RowWidget(icon: Icons.lock_open_rounded, text: 'Secure device'),
                      SizedBox(height:10.0 ,),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [RowWidget(icon: Icons.directions, text: 'Get directions'),
                      Icon(Icons.open_in_new,color: Colors.white,size: 30.0,)],),// Using RowWidget with specified icon and text
                    ],
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}

class RowWidget extends StatelessWidget {
  final IconData icon;
  final String text;

  const RowWidget({Key? key, required this.icon, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,color: Colors.white,size: 30.0,),
        SizedBox(width: 15.0,),
        Text(text,style: TextStyle(color: Colors.white,fontSize: 25.0),),
      ],
    );
  }
}
class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const RoundIconButton({
    Key? key,
    required this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 6.0,
      constraints: const BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
      shape: const CircleBorder(),
      fillColor: Color(0xFF0D0F0E),
      child: Icon(icon,color: Colors.white,),
    );
  }
}