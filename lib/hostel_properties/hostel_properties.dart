import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HostelPage extends StatelessWidget {
  final Map<String, dynamic> hostelData;

  const HostelPage({Key? key, required this.hostelData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;
    final List<String> imgList = List<String>.from(hostelData['images']);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(280.0),
        child: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
          ),
          flexibleSpace: Stack(
            children: [
              Positioned.fill(
                child: CarouselSlider(
                  items: imgList.map((item) => Container(
                    width: double.infinity,
                    child: Image.network(item, fit: BoxFit.cover),
                  )).toList(),
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 2.0,
                    onPageChanged: (index, reason) {
                      _currentIndex = index;
                    },
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imgList.map((url) {
                    int index = imgList.indexOf(url);
                    return Container(
                      width: 10.0,
                      height: 10.0,
                      margin: EdgeInsets.symmetric(vertical: 30.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentIndex == index
                            ? Colors.deepOrange
                            : Color.fromRGBO(0, 0, 0, 0.2),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(hostelData['name'], style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
            Row(
              children: List.generate(5, (index) => Icon(Icons.star, color: Colors.yellow, size: 13)),
            ),
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.deepOrange),
                SizedBox(width: 5),
                Text(hostelData['location'], style: TextStyle(fontSize: 18.0, color: Colors.grey[700])),
              ],
            ),
            SizedBox(height: 10),
            Text('Description', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold)),
            Text(hostelData['description'], style: TextStyle(fontSize: 13.0, color: Colors.grey[700])),
            SizedBox(height: 8),
            Text('Facilities', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 15),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: (hostelData['facilities'] as List).length,
              itemBuilder: (context, index) {
                final facility = hostelData['facilities'][index];
                final facilityType = facility['type'] ?? 'Unknown Type';
                final facilityImage = facility['image'] ?? 'lib/assets/images/default.jpg'; // Default image
                final facilityPrice = facility['price'] ?? 0;

                return Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.lightBlueAccent),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Row(
                    children: [
                      Image.asset(facilityImage, width: 90, height: 90, fit: BoxFit.cover),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(facilityType, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                            SizedBox(height: 5),
                            Text('Yearly Price: \$${facilityPrice}', style: TextStyle(fontSize: 16.0, color: Colors.grey[700])),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Booking logic here
                        },
                        child: Text('Book Now'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}