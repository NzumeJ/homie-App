import 'dart:io';
import 'package:flutter/material.dart';
import 'package:homie/Notifications/notificationPage1.dart';
import 'package:homie/hostel_properties/hostel_properties.dart';
import 'NavBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  TextEditingController _searchController = TextEditingController();
  List<DocumentSnapshot> _searchResults = [];
  List<DocumentSnapshot> _popularHostels = [];
  List<DocumentSnapshot> _recommendedHostels = [];
  bool _isSearching = false;
  String _profileImagePath = 'lib/assets/images/profile.jpg'; // Default profile image

  Future<void> _searchHostels(String query) async {
    setState(() {
      _isSearching = true;
    });

    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('hostels')
          .where('name', isGreaterThanOrEqualTo: query)
          .where('name', isLessThanOrEqualTo: query + '\uf8ff')
          .get();

      setState(() {
        _searchResults = querySnapshot.docs;
        _isSearching = false;
      });
    } catch (e) {
      setState(() {
        _isSearching = false;
      });
      print('Error fetching hostels: $e');
    }
  }

  Future<void> _fetchPopularAndRecommendedHostels() async {
    try {
      QuerySnapshot popularSnapshot = await _firestore
          .collection('hostels')
          .where('isPopular', isEqualTo: true)
          .get();
      QuerySnapshot recommendedSnapshot = await _firestore
          .collection('hostels')
          .where('isRecommended', isEqualTo: true)
          .get();

      setState(() {
        _popularHostels = popularSnapshot.docs;
        _recommendedHostels = recommendedSnapshot.docs;
      });
    } catch (e) {
      print('Error fetching popular/recommended hostels: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchPopularAndRecommendedHostels();
  }

  Future<void> _changeProfilePicture() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImagePath = pickedFile.path; // Update profile image path
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 70.0, right: 40),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Text(
                        'Welcome',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(),
                      child: Text(
                        'Nzume',
                        style: TextStyle(
                          color: Colors.lightBlueAccent,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          actions: [
            GestureDetector(
              onTap: _changeProfilePicture,
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: CircleAvatar(
                  backgroundImage: FileImage(File(_profileImagePath)),
                  // Use FileImage to display the selected image
                ),
              ),
            ),
          ],
          toolbarHeight: 100,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: Text(
                    'MENU',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.message),
                title: Text('Messages'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Profile'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.contact_mail),
                title: Text('Email'),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 0),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 0, right: 60),
                  child: Text(
                    'Make a Choice....',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0, left: 20),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      labelText: 'Search Hostels',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          _searchHostels(_searchController.text);
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: _isSearching
                      ? Center(child: CircularProgressIndicator())
                      : _searchResults.isEmpty
                      ? Center(child: Text('No search results found'))
                      : ListView.builder(
                    itemCount: _searchResults.length,
                    itemBuilder: (context, index) {
                      var hostel = _searchResults[index].data() as Map<String, dynamic>;
                      return ListTile(
                        leading: Image.network(
                          hostel['images'][0], // Display the first image
                          width: 150,
                          height: 250,
                          fit: BoxFit.cover,
                        ),
                        title: Text(hostel['name']),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Location: ${hostel['location']}'),
                            Text('Price: \$${hostel['price']}'),
                            Text('Rooms: ${hostel['number of rooms']}'),
                          ],
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HostelPage(hostelData: hostel),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(right: 180, bottom: 0),
                  child: Text(
                    'Popular Hostels',
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: _popularHostels.length,
                    itemBuilder: (context, index) {
                      var hostel = _popularHostels[index].data() as Map<String, dynamic>;
                      return ListTile(
                        leading: Image.network(
                          hostel['images'][0], // Display the first image
                          width: 150,
                          height: 250,
                          fit: BoxFit.cover,
                        ),
                        title: Text(hostel['name']),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Location: ${hostel['location']}'),
                            Text('Price: \$${hostel['price']}'),
                            Text('Rooms: ${hostel['number of rooms']}'),
                          ],
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HostelPage(hostelData: hostel),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(right: 180, bottom: 0),
                  child: Text(
                    'Recommendations',
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: _recommendedHostels.length,
                    itemBuilder: (context, index) {
                      var hostel = _recommendedHostels[index].data() as Map<String, dynamic>;
                      return ListTile(
                        leading: Image.network(
                          hostel['images'][0], // Display the first image
                          width: 150,
                          height: 250,
                          fit: BoxFit.cover,
                        ),
                        title: Text(hostel['name']),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Location: ${hostel['location']}'),
                            Text('Price: \$${hostel['price']}'),
                            Text('Rooms: ${hostel['number of rooms']}'),
                          ],
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HostelPage(hostelData: hostel),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Navbar(),
      ),
    );
  }
}