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
          NoticeBoard(),
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

class NoticeBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: EdgeInsets.all(8),
      color: Colors.grey[200], // Light grey background color
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Notice Board",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[800], // Dark grey color
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "Hostel Allotment against vacant seats",
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "Hostel Allotment 2023",
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "Hostel Seat Matrix 2023",
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "Hostel allotment dsy degree",
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "Hostel Allotment 2022",
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "Hostel fee structure updated",
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
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
    Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
              Colors.black.withOpacity(0.4), // Adjust the opacity as needed
            ],
          ),
        ),
        child: Column(
          children: [
            Image.network(
                'https://images.shiksha.com/mediadata/images/1601280667phpp1zxIN.png'),
            const SizedBox(height: 100),
            const Text("Girls Hostel")
          ],
        )),
    Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
              Colors.black.withOpacity(0.4), // Adjust the opacity as needed
            ],
          ),
        ),
        child: Column(
          children: [
            Image.network(
                'https://images.shiksha.com/mediadata/images/1601280667phpp1zxIN.png'),
            const SizedBox(height: 100),
            const Text("Hostel Gate")
          ],
        )),
    Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
              Colors.black.withOpacity(0.4), // Adjust the opacity as needed
            ],
          ),
        ),
        child: Column(
          children: [
            Image.network(
                'https://images.shiksha.com/mediadata/images/1601280667phpp1zxIN.png'),
            const SizedBox(height: 100),
            const Text("Boys Hostel")
          ],
        ))
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
          // Other widgets
          CarouselSlider(
            items: carouselItems,
            options: CarouselOptions(
              height: size.height * 0.5, // Customize the height of the carousel
              autoPlay: false, // Enable auto-play
              enlargeCenterPage: true, // Increase the size of the center item
              enableInfiniteScroll: true, // Enable infinite scroll
              onPageChanged: (index, reason) {
                // Optional callback when the page changes
                // You can use it to update any additional UI components
              },
            ),
          ),
        ]));
  }
}

class Facilities extends StatefulWidget {
  const Facilities({super.key});

  @override
  State<Facilities> createState() => _FacilitiesState();
}

class _FacilitiesState extends State<Facilities> {
  List<Container> carouselItems = [
    Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
              Colors.black.withOpacity(0.4), // Adjust the opacity as needed
            ],
          ),
        ),
        child: Column(
          children: [
            Image.network(
                'https://images.shiksha.com/mediadata/images/1601280667phpp1zxIN.png'),
            const SizedBox(height: 100),
            const Text("Doctor")
          ],
        )),
    Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
              Colors.black.withOpacity(0.4), // Adjust the opacity as needed
            ],
          ),
        ),
        child: Column(
          children: [
            Image.network(
                'https://images.shiksha.com/mediadata/images/1601280667phpp1zxIN.png'),
            const SizedBox(height: 100),
            const Text("Water Coolers")
          ],
        )),
    Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
              Colors.black.withOpacity(0.4), // Adjust the opacity as needed
            ],
          ),
        ),
        child: Column(
          children: [
            Image.network(
                'https://images.shiksha.com/mediadata/images/1601280667phpp1zxIN.png'),
            const SizedBox(height: 100),
            const Text("Security")
          ],
        ))
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
          // Other widgets
          CarouselSlider(
            items: carouselItems,
            options: CarouselOptions(
              height: size.height * 0.5, // Customize the height of the carousel
              autoPlay: false, // Enable auto-play
              enlargeCenterPage: true, // Increase the size of the center item
              enableInfiniteScroll: true, // Enable infinite scroll
              onPageChanged: (index, reason) {
                // Optional callback when the page changes
                // You can use it to update any additional UI components
              },
            ),
          ),
        ]));
  }
}

class MessInfo extends StatefulWidget {
  const MessInfo({super.key});

  @override
  State<MessInfo> createState() => _MessInfoState();
}

class _MessInfoState extends State<MessInfo> {
  List<Container> carouselItems = [
    Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
              Colors.black.withOpacity(0.4), // Adjust the opacity as needed
            ],
          ),
        ),
        child: Column(
          children: [
            Image.network(
                'https://images.shiksha.com/mediadata/images/1601280667phpp1zxIN.png'),
            const SizedBox(height: 50),
            const Text(
              "Girl's Hostel Mess",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const Text(
              "Breakfast-Lunch-Dinner",
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
              textAlign: TextAlign.left,
            )
          ],
        )),
    Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
              Colors.black.withOpacity(0.4), // Adjust the opacity as needed
            ],
          ),
        ),
        child: Column(
          children: [
            Image.network(
                'https://images.shiksha.com/mediadata/images/1601280667phpp1zxIN.png'),
            const SizedBox(height: 50),
            const Text(
              "Boy's Hostel Mess1",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const Text(
              "Breakfast-Lunch-Dinner",
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
              textAlign: TextAlign.left,
            )
          ],
        )),
    Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
              Colors.black.withOpacity(0.4), // Adjust the opacity as needed
            ],
          ),
        ),
        child: Column(
          children: [
            Image.network(
                'https://images.shiksha.com/mediadata/images/1601280667phpp1zxIN.png'),
            const SizedBox(height: 50),
            const Text(
              "Boy's Hostel Mess2",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const Text(
              "Breakfast-Lunch-Dinner",
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
              textAlign: TextAlign.left,
            )
          ],
        ))
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
              Colors.black.withOpacity(0.4), // Adjust the opacity as needed
            ],
          ),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // Other widgets
              CarouselSlider(
                items: carouselItems,
                options: CarouselOptions(
                  height:
                      size.height * 0.5, // Customize the height of the carousel
                  autoPlay: false, // Enable auto-play
                  enlargeCenterPage:
                      true, // Increase the size of the center item
                  enableInfiniteScroll: true, // Enable infinite scroll
                  onPageChanged: (index, reason) {
                    // Optional callback when the page changes
                    // You can use it to update any additional UI components
                  },
                ),
              ),
            ]));
  }
}

class BlocksInfo extends StatefulWidget {
  const BlocksInfo({super.key});

  @override
  State<BlocksInfo> createState() => _BlocksInfoState();
}

class _BlocksInfoState extends State<BlocksInfo> {
  List<Container> carouselItems = [
    Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
              Colors.black.withOpacity(0.4), // Adjust the opacity as needed
            ],
          ),
        ),
        child: Column(
          children: [
            Image.network(
                'https://images.shiksha.com/mediadata/images/1601280667phpp1zxIN.png'),
            const SizedBox(height: 50),
            const Text(
              "Block A",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const Text(
              "Girl's Hostel",
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
              textAlign: TextAlign.left,
            )
          ],
        )),
    Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
              Colors.black.withOpacity(0.4), // Adjust the opacity as needed
            ],
          ),
        ),
        child: Column(
          children: [
            Image.network(
                'https://images.shiksha.com/mediadata/images/1601280667phpp1zxIN.png'),
            const SizedBox(height: 50),
            const Text(
              "Block B",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const Text(
              "Girl's Hostel",
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
              textAlign: TextAlign.left,
            )
          ],
        )),
    Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
              Colors.black.withOpacity(0.4), // Adjust the opacity as needed
            ],
          ),
        ),
        child: Column(
          children: [
            Image.network(
                'https://images.shiksha.com/mediadata/images/1601280667phpp1zxIN.png'),
            const SizedBox(height: 50),
            const Text(
              "Block C",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const Text(
              "Boy's Hostel",
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
              textAlign: TextAlign.left,
            )
          ],
        )),
    Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
              Colors.black.withOpacity(0.4), // Adjust the opacity as needed
            ],
          ),
        ),
        child: Column(
          children: [
            Image.network(
                'https://images.shiksha.com/mediadata/images/1601280667phpp1zxIN.png'),
            const SizedBox(height: 50),
            const Text(
              "Block D",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const Text(
              "Boy's Hostel",
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
              textAlign: TextAlign.left,
            )
          ],
        )),
    Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
              Colors.black.withOpacity(0.4), // Adjust the opacity as needed
            ],
          ),
        ),
        child: Column(
          children: [
            Image.network(
                'https://images.shiksha.com/mediadata/images/1601280667phpp1zxIN.png'),
            const SizedBox(height: 50),
            const Text(
              "Block E",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const Text(
              "Girl's Hostel",
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
              textAlign: TextAlign.left,
            )
          ],
        )),
    Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
              Colors.black.withOpacity(0.4), // Adjust the opacity as needed
            ],
          ),
        ),
        child: Column(
          children: [
            Image.network(
                'https://images.shiksha.com/mediadata/images/1601280667phpp1zxIN.png'),
            const SizedBox(height: 50),
            const Text(
              "PG Hostel",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const Text(
              "PG Boy's Hostel",
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
              textAlign: TextAlign.left,
            )
          ],
        ))
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
          // Other widgets
          CarouselSlider(
            items: carouselItems,
            options: CarouselOptions(
              height: size.height * 0.5, // Customize the height of the carousel
              autoPlay: false, // Enable auto-play
              enlargeCenterPage: true, // Increase the size of the center item
              enableInfiniteScroll: true, // Enable infinite scroll
              onPageChanged: (index, reason) {
                // Optional callback when the page changes
                // You can use it to update any additional UI components
              },
            ),
          ),
        ]));
  }
}
