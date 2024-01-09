import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeInfo extends StatefulWidget {
  const HomeInfo({super.key});

  @override
  State<HomeInfo> createState() => _HomeInfoState();
}

class _HomeInfoState extends State<HomeInfo> {
  final List<Widget> _tabs = <Widget>[
    PhotoGallery(),
    Facilities(),
    MessInfo(),
    BlocksInfo()
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            height: 200,
          ),
          Container(
              child: Column(
            children: [
              Row(
                children: [
                  ButtonBar(
                    buttonPadding: const EdgeInsets.all(10),
                    alignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _currentIndex = 0;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                _currentIndex == 0 ? Colors.black : Colors.grey,
                            foregroundColor: _currentIndex == 0
                                ? Colors.white
                                : Colors.black),
                        child: const Text(
                          "Photos",
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _currentIndex = 1;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                _currentIndex == 1 ? Colors.black : Colors.grey,
                            foregroundColor: _currentIndex == 1
                                ? Colors.white
                                : Colors.black),
                        child: const Text(
                          "Facilities",
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _currentIndex = 2;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                _currentIndex == 2 ? Colors.black : Colors.grey,
                            foregroundColor: _currentIndex == 2
                                ? Colors.white
                                : Colors.black),
                        child: const Text(
                          "Mess",
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _currentIndex = 3;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                _currentIndex == 3 ? Colors.black : Colors.grey,
                            foregroundColor: _currentIndex == 3
                                ? Colors.white
                                : Colors.black),
                        child: const Text(
                          "Blocks",
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Center(
                child: _tabs[_currentIndex],
              )
            ],
          )),
        ],
      ),
    );
  }
}

class PhotoGallery extends StatefulWidget {
  const PhotoGallery({super.key});

  @override
  State<PhotoGallery> createState() => _PhotoGalleryState();
}

class _PhotoGalleryState extends State<PhotoGallery> {
  @override
  Widget build(BuildContext context) {
    return const Center(child:Text("hi"));
    // ListView(
    //   scrollDirection: Axis.horizontal,
    //   children: [
    //     CarouselSlider(
    //       items: [
    //         //1st Image of Slider
    //         Container(
    //           margin: EdgeInsets.all(6.0),
    //           // decoration: BoxDecoration(
    //           //   borderRadius: BorderRadius.circular(8.0),
    //           //   image: DecorationImage(
    //           //     image: AssetImage("assets/hostel.jpeg"),
    //           //     fit: BoxFit.cover,
    //           //   ),
    //           // ),
    //           child: Center(child:Text("hi")),
    //         ),
    
    //         //2nd Image of Slider
    //         Container(
    //           margin: EdgeInsets.all(6.0),
    //           // decoration: BoxDecoration(
    //           //   borderRadius: BorderRadius.circular(8.0),
    //           //   image: DecorationImage(
    //           //     image: AssetImage("assets/hostel.jpeg"),
    //           //     fit: BoxFit.cover,
    //           //   ),
    //           // ),
    //           child: Center(child:Text("hi")),
    //         ),
    
    //         //3rd Image of Slider
    //         Container(
    //           margin: EdgeInsets.all(6.0),
    //           // decoration: BoxDecoration(
    //           //   borderRadius: BorderRadius.circular(8.0),
    //           //   image: DecorationImage(
    //           //     image: AssetImage("assets/hostel.jpeg"),
    //           //     fit: BoxFit.cover,
    //           //   ),
    //           // ),
    //           child: Center(child:Text("hi")),
    //         ),
    
    //         //4th Image of Slider
    //         Container(
    //           margin: EdgeInsets.all(6.0),
    //           // decoration: BoxDecoration(
    //           //   borderRadius: BorderRadius.circular(8.0),
    //           //   image: DecorationImage(
    //           //     image: AssetImage("assets/hostel.jpeg"),
    //           //     fit: BoxFit.cover,
    //           //   ),
    //           // ),
    //           child: Center(child:Text("hi")),
    //         ),
    
    //         //5th Image of Slider
    //         Container(
    //           margin: EdgeInsets.all(6.0),
    //           // decoration: BoxDecoration(
    //           //   borderRadius: BorderRadius.circular(8.0),
    //           //   image: DecorationImage(
    //           //     image: AssetImage("assets/hostel.jpeg"),
    //           //     fit: BoxFit.cover,
    //           //   ),
    //           // ),
    //           child: Center(child:Text("hi")),
    //         ),
    //       ],
    
    //       //Slider Container properties
    //       options: CarouselOptions(
    //         height: 180.0,
    //         enlargeCenterPage: true,
    //         autoPlay: true,
    //         aspectRatio: 16 / 9,
    //         autoPlayCurve: Curves.fastOutSlowIn,
    //         enableInfiniteScroll: true,
    //         autoPlayAnimationDuration: Duration(milliseconds: 800),
    //         viewportFraction: 0.8,
    //       ),
    //     ),
    //   ],
    // );
  }
}

class Facilities extends StatefulWidget {
  const Facilities({super.key});

  @override
  State<Facilities> createState() => _FacilitiesState();
}

class _FacilitiesState extends State<Facilities> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Facilities"));
  }
}

class MessInfo extends StatefulWidget {
  const MessInfo({super.key});

  @override
  State<MessInfo> createState() => _MessInfoState();
}

class _MessInfoState extends State<MessInfo> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Mess"));
  }
}

class BlocksInfo extends StatefulWidget {
  const BlocksInfo({super.key});

  @override
  State<BlocksInfo> createState() => _BlocksInfoState();
}

class _BlocksInfoState extends State<BlocksInfo> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Blocks"));
  }
}
