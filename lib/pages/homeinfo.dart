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
  List<Container> carouselItems = [
  Container(child: Column(
                      children: [
                        Image.network('https://images.shiksha.com/mediadata/images/1601280667phpp1zxIN.png'),
                        const SizedBox(height: 10),
                        const Text("Textual part")

                      ],
          )),
  Container(child: Column(
                      children: [
                        Image.network('https://images.shiksha.com/mediadata/images/1601280667phpp1zxIN.png'),
                        const SizedBox(height: 10),
                        const Text("Textual part")
                      ],
          )),
  Container(child: Column(
                      children: [
                        Image.network('https://images.shiksha.com/mediadata/images/1601280667phpp1zxIN.png'),
                        const SizedBox(height: 10),
                        const Text("Textual part")
                      ],
          ))
  ];
  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return Container(
      child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // Other widgets
              CarouselSlider(
                items: carouselItems,
                options: CarouselOptions(
                  height: size.height*2, // Customize the height of the carousel
                  autoPlay: false, // Enable auto-play
                  enlargeCenterPage: true, // Increase the size of the center item
                  enableInfiniteScroll: true, // Enable infinite scroll
                  onPageChanged: (index, reason) {
                    // Optional callback when the page changes
                    // You can use it to update any additional UI components
                  },
                ),
              ),
              ]
    ));
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
