import 'package:flutter/material.dart';
import 'colors.dart';
import 'phone screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NO SHACK SOLUTIONS',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool admin = false;
  bool guest = false;
  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF131313),
      appBar: AppBar(
        backgroundColor: const Color(0xFF131313),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 370,
              height: 370,
              alignment: Alignment.center,
              child: Image.asset("images/img.png"),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: 225,
                decoration: const BoxDecoration(
                  color: Color(0xFF1E2329),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 70.0,
                      width: 350.0,
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: const Color(0xFF131313),
                      ),
                      child: Row(
                        children: [
                          Image(image: AssetImage('images/img_1.png')),
                          DropdownButton<String>(
                            dropdownColor: Color(0xFF131313),
                            value: _selectedItem,
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedItem = newValue;
                              });
                            },
                            items: [
                              'Admin no Shack\nadmin@noshack.com',
                              'Amrutha no Shack\namrutha@noshack.com',
                              'bebo no Shack\nbebo@noshack.com',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Center(
                                  child: Text(value
                                  ,style: TextStyle(color: Colors.white),),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15.0,),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          admin = !admin;
                          guest = false;
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => phonetype()),
                          );
                        });
                      },
                      child: Container(
                        height: 45.0,
                        width: 350.0,
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: admin
                              ? const Color(0xFF97CAFF)
                              : const Color(0xFF1E2329),
                        ),
                        child:  Center(
                          child: Text(
                            'Continue as Admin',
                            style: TextStyle(
                              color: admin? Colors.black : const Color(0xFF97CAFF),
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          guest = !guest;
                          admin = false;
                        });
                      },
                      child: Container(
                        height: 45.0,
                        width: 350.0,
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color:
                          guest ? const Color(0xFF97CAFF) : const Color(0xFF1E2329),
                        ),
                        child:  Center(
                          child: Text(
                            'Sign in as guest',
                            style: TextStyle(
                              color: guest ? Colors.black : const Color(0xFF97CAFF),
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
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
