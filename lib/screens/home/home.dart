import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kurups_app/entity/user_data/users_data.dart';

import 'package:kurups_app/utils/constants/colors.dart';
import 'package:kurups_app/service/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Stream? usersStream;
  List<UsersData> usersData = [];
  getontheload() async {
    var _data = await DatabaseMethods().getUsersDetails("users");

    var snapshot = await _data.docs;

    print(snapshot);
    snapshot.forEach(
      (element) {
        var data = element.data();

        usersData.add(UsersData.fromJson(data));
      },
    );

    setState(() {});
  }

  @override
  void initState() {
    getontheload();
    _filterItems = _allItems;
    super.initState();
  }

  Widget allUserDetails() {
    return usersData.isNotEmpty
        ? ListView.builder(
            itemCount: usersData.length,
            itemBuilder: (context, index) {
              UsersData ds = usersData[index];
              return Container(
                decoration: BoxDecoration(color: AppColors.primary),
                child: Column(children: [
                  Text("name: ${ds.name}",
                      style: TextStyle(
                        color: AppColors.onPrimary,
                      )),
                  Text("email: ${ds.email}",
                      style: TextStyle(
                        color: AppColors.onPrimary,
                      )),
                ]),
              );
            })
        : Container();
  }

  final TextEditingController _searchController = TextEditingController();
  final List<String> _allItems = [
    'Basic Lesson',
    '10 th Maths',
    '12 th Maths',
  ];
  // ignore: unused_field
  List<String> _filterItems = [];
  int _selectedIndex = 0; // Track the currently selected tab
  // @override
  // void getState() {
  //   super.initState();
  //   _filteredItems = _allItems; // Initially show all items
  // }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(200, 50),
        child: SafeArea(
          child: AppBar(
            title: Text(
              'Home Page',
              style: TextStyle(color: AppColors.onPrimary),
            ),
            backgroundColor: AppColors.primary,
            leadingWidth: 80.0,
          ),
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            //read operation
            SizedBox(
              height: 50,
            ),
            Container(
              height: 150,
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: AppColors.primary,
              ),
              child: Column(
                children: [],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                // Handle Home button tap
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Edit Profile'),
              onTap: () {
                // Handle Settings button tap
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.pop(context, "/LoginScreen"); // Close the drawer
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: AppColors.surface),
            ),
            const SizedBox(height: 16.0), // Add some space below the search bar
            Expanded(
              child: allUserDetails(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex, // Current selected index
        selectedItemColor: AppColors.primary,
        onTap: _onItemTapped, // Handle tap
      ),
      floatingActionButton: FloatingActionButton(onPressed: () => getontheload()
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => const QuizScreen(),
          //     )),
          ),
    );
  }
}
