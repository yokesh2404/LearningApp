// // // import 'package:flutter/material.dart';
// // // import 'package:fluttertoast/fluttertoast.dart';
// // // import 'package:kurups_app/config/colors.dart';
// // // import 'package:kurups_app/login/login.dart';
// // // import 'package:kurups_app/service/database.dart';
// // // import 'package:random_string/random_string.dart';

// // // class RegisterPage extends StatefulWidget {
// // //   const RegisterPage({super.key});

// // //   @override
// // //   // ignore: library_private_types_in_public_api
// // //   _RegisterPageState createState() => _RegisterPageState();
// // // }

// // // class _RegisterPageState extends State<RegisterPage> {
// // //   final _formKey = GlobalKey<FormState>();
// // //   final TextEditingController _nameController = TextEditingController();
// // //   final TextEditingController _emailController = TextEditingController();
// // //   final TextEditingController _passwordController = TextEditingController();
// // //   final TextEditingController _confirmPasswordController =
// // //       TextEditingController();
// // //   bool _passwordVisible = false;
// // //   bool _confirmPasswordVisible = false;

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: PreferredSize(
// // //         preferredSize: const Size(100, 50),
// // //         child: SafeArea(
// // //           child: AppBar(
// // //             title: const Text(
// // //               'Register Page',
// // //               style: TextStyle(color: AppColors.onPrimary),
// // //             ),
// // //             backgroundColor: AppColors.primary,
// // //           ),
// // //         ),
// // //       ),
// // //       body: Padding(
// // //         padding: const EdgeInsets.all(16.0),
// // //         child: Form(
// // //           key: _formKey,
// // //           child: Column(
// // //             mainAxisAlignment: MainAxisAlignment.center,
// // //             children: <Widget>[
// // //               SizedBox(
// // //                 width: 100,
// // //                 height: 100,
// // //                 child: Image.asset(
// // //                   'assets/images/logo 1.png',
// // //                   fit: BoxFit.cover,
// // //                 ),
// // //               ),
// // //               const SizedBox(height: 20),
// // //               TextFormField(
// // //                 controller: _nameController,
// // //                 keyboardType: TextInputType.name,
// // //                 decoration: const InputDecoration(
// // //                   labelText: 'Name',
// // //                   prefixIcon: Icon(Icons.people),
// // //                   border: OutlineInputBorder(),
// // //                 ),
// // //                 validator: (value) {
// // //                   if (value == null || value.isEmpty) {
// // //                     return 'Please enter your name';
// // //                   }
// // //                   return null;
// // //                 },
// // //               ),
// // //               const SizedBox(height: 20),
// // //               TextFormField(
// // //                 controller: _emailController,
// // //                 keyboardType: TextInputType.emailAddress,
// // //                 decoration: const InputDecoration(
// // //                   labelText: 'Email',
// // //                   prefixIcon: Icon(Icons.email),
// // //                   border: OutlineInputBorder(),
// // //                 ),
// // //                 validator: (value) {
// // //                   if (value == null || value.isEmpty) {
// // //                     return 'Please enter your email';
// // //                   }
// // //                   if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
// // //                     return 'Enter a valid email address';
// // //                   }
// // //                   return null;
// // //                 },
// // //               ),
// // //               const SizedBox(height: 20),
// // //               TextFormField(
// // //                 controller: _passwordController,
// // //                 obscureText: !_passwordVisible,
// // //                 decoration: InputDecoration(
// // //                   labelText: 'Password',
// // //                   prefixIcon: const Icon(Icons.lock),
// // //                   suffixIcon: IconButton(
// // //                     icon: Icon(
// // //                       _passwordVisible
// // //                           ? Icons.visibility
// // //                           : Icons.visibility_off,
// // //                     ),
// // //                     onPressed: () {
// // //                       setState(() {
// // //                         _passwordVisible = !_passwordVisible;
// // //                       });
// // //                     },
// // //                   ),
// // //                   border: const OutlineInputBorder(),
// // //                 ),
// // //                 validator: (value) {
// // //                   if (value == null || value.isEmpty) {
// // //                     return 'Please enter your password';
// // //                   }
// // //                   if (value.length < 6) {
// // //                     return 'Password must be at least 6 characters long';
// // //                   }
// // //                   return null;
// // //                 },
// // //               ),
// // //               const SizedBox(height: 20),
// // //               TextFormField(
// // //                 controller: _confirmPasswordController,
// // //                 obscureText: !_confirmPasswordVisible,
// // //                 decoration: InputDecoration(
// // //                   labelText: 'Confirm Password',
// // //                   prefixIcon: const Icon(Icons.lock),
// // //                   suffixIcon: IconButton(
// // //                     icon: Icon(
// // //                       _confirmPasswordVisible
// // //                           ? Icons.visibility
// // //                           : Icons.visibility_off,
// // //                     ),
// // //                     onPressed: () {
// // //                       setState(() {
// // //                         _confirmPasswordVisible = !_confirmPasswordVisible;
// // //                       });
// // //                     },
// // //                   ),
// // //                   border: const OutlineInputBorder(),
// // //                 ),
// // //                 validator: (value) {
// // //                   if (value == null || value.isEmpty) {
// // //                     return 'Please confirm your password';
// // //                   }
// // //                   if (value != _passwordController.text) {
// // //                     return 'Passwords do not match';
// // //                   }
// // //                   return null;
// // //                 },
// // //               ),
// // //               const SizedBox(height: 20),
// // //               ElevatedButton(
// // //                 onPressed: () async {
// // //                   if (_formKey.currentState?.validate() ?? false) {
// // //                     String id = randomAlphaNumeric(15);
// // //                     Map<String, dynamic> usersInfoMap = {
// // //                       "name": _nameController.text,
// // //                       "email": _emailController.text,
// // //                       "password": _passwordController.text,
// // //                       "confirm password": _confirmPasswordController.text
// // //                     };
// // //                     await DatabaseMethods()
// // //                         .addUsersDetails(usersInfoMap, id)
// // //                         .then((onValue) {
// // //                       Fluttertoast.showToast(
// // //                           msg: "The user's details were updated",
// // //                           toastLength: Toast.LENGTH_LONG,
// // //                           gravity: ToastGravity.CENTER,
// // //                           timeInSecForIosWeb: 1,
// // //                           backgroundColor: Colors.red,
// // //                           textColor: Colors.white,
// // //                           fontSize: 16.0);
// // //                       Navigator.push(
// // //                           // ignore: use_build_context_synchronously
// // //                           context,
// // //                           MaterialPageRoute(
// // //                               builder: (context) => const LoginScreen()));
// // //                       // ignore: use_build_context_synchronously
// // //                       ScaffoldMessenger.of(context).showSnackBar(
// // //                         const SnackBar(content: Text('Registering...')),
// // //                       );
// // //                     });
// // //                   } else {
// // //                     // If validation fails, display an error message
// // //                     Fluttertoast.showToast(
// // //                       msg: "Please fix the errors in the form",
// // //                       toastLength: Toast.LENGTH_SHORT,
// // //                       gravity: ToastGravity.CENTER,
// // //                       timeInSecForIosWeb: 1,
// // //                       backgroundColor: Colors.red,
// // //                       textColor: Colors.white,
// // //                       fontSize: 16.0,
// // //                     );
// // //                   }
// // //                 },
// // //                 style: const ButtonStyle(
// // //                     backgroundColor: WidgetStatePropertyAll(AppColors.primary)),
// // //                 child: const Text(
// // //                   'Register',
// // //                   style: TextStyle(color: AppColors.onPrimary),
// // //                 ),
// // //               ),
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
// // // home page
// // import 'package:flutter/material.dart';
// // import 'package:kurups_app/quiz/quiz.dart';
// // import 'package:kurups_app/config/colors.dart';
// // import 'package:kurups_app/service/database.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart'; // Firestore for querying user data

// // class HomePage extends StatefulWidget {
// //   const HomePage({super.key});

// //   @override
// //   _HomePageState createState() => _HomePageState();
// // }

// // class _HomePageState extends State<HomePage> {
// //   Stream<QuerySnapshot>? usersStream; // Stream to hold Firestore data

// //   @override
// //   void initState() {
// //     super.initState();
// //     _getUsersData(); // Fetch users data when the widget is initialized
// //     _filteredItems = _allItems;
// //   }

// //   // Fetch data from Firestore (without authentication)
// //   void _getUsersData() {
// //     // usersStream = FirebaseFirestore.instance.collection('users').snapshots();
// //     setState(() {});
// //   }

// //   final TextEditingController _searchController = TextEditingController();
// //   final List<String> _allItems = [
// //     'Basic Lesson',
// //     '10 th Maths',
// //     '12 th Maths',
// //   ];
// //   List<String> _filteredItems = [];
// //   int _selectedIndex = 0; // Track the currently selected tab

// //   void _filterItems(String query) {
// //     if (query.isEmpty) {
// //       setState(() {
// //         _filteredItems = _allItems;
// //       });
// //     } else {
// //       List<String> filteredList = _allItems
// //           .where((item) => item.toLowerCase().contains(query.toLowerCase()))
// //           .toList();
// //       setState(() {
// //         _filteredItems = filteredList;
// //       });
// //     }
// //   }

// //   void _onItemTapped(int index) {
// //     setState(() {
// //       _selectedIndex = index; // Update the selected index
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: PreferredSize(
// //         preferredSize: const Size(200, 50),
// //         child: SafeArea(
// //           child: AppBar(
// //             title: Text(
// //               'Home Page',
// //               style: TextStyle(color: AppColors.onPrimary),
// //             ),
// //             backgroundColor: AppColors.primary,
// //             leadingWidth: 80.0,
// //           ),
// //         ),
// //       ),
// //       endDrawer: Drawer(
// //         child: ListView(
// //           padding: EdgeInsets.zero,
// //           children: <Widget>[
// //             SizedBox(height: 50),
// //             Container(
// //               height: 150,
// //               padding: const EdgeInsets.all(10),
// //               width: MediaQuery.of(context).size.width,
// //               decoration: BoxDecoration(
// //                 color: AppColors.primary,
// //               ),
// //               child: Center(
// //                 child: StreamBuilder<QuerySnapshot>(
// //                   stream: usersStream,
// //                   builder: (context, snapshot) {
// //                     if (snapshot.connectionState == ConnectionState.waiting) {
// //                       return const CircularProgressIndicator(); // Show loading indicator
// //                     }

// //                     if (snapshot.hasError) {
// //                       return const Text('Error fetching data');
// //                     }

// //                     if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
// //                       return const Text('No users found');
// //                     }

// //                     // Show details of the first user
// //                     var userData = snapshot.data!.docs[0];
// //                     return Column(
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: [
// //                         Text(
// //                           "name ${userData['name']}",
// //                           style: const TextStyle(
// //                             fontSize: 18,
// //                             color: Colors.white,
// //                           ),
// //                         ),
// //                         const SizedBox(height: 10),
// //                         Text(
// //                           "${userData['email']}",
// //                           style: const TextStyle(
// //                             fontSize: 16,
// //                             color: Colors.white,
// //                           ),
// //                         ),
// //                       ],
// //                     );
// //                   },
// //                 ),
// //               ),
// //             ),
// //             ListTile(
// //               leading: const Icon(Icons.home),
// //               title: const Text('Home'),
// //               onTap: () {
// //                 Navigator.pop(context); // Close the drawer
// //               },
// //             ),
// //             ListTile(
// //               leading: const Icon(Icons.edit),
// //               title: const Text('Edit Profile'),
// //               onTap: () {
// //                 Navigator.pop(context); // Close the drawer
// //               },
// //             ),
// //             ListTile(
// //               leading: const Icon(Icons.logout),
// //               title: const Text('Logout'),
// //               onTap: () {
// //                 Navigator.pop(context); // Close the drawer
// //               },
// //             ),
// //           ],
// //         ),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           children: [
// //             TextField(
// //               controller: _searchController,
// //               decoration: InputDecoration(
// //                 hintText: 'Search...',
// //                 prefixIcon: const Icon(Icons.search),
// //                 border: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(8.0),
// //                   borderSide: BorderSide.none,
// //                 ),
// //                 filled: true,
// //                 fillColor: AppColors.onSecondary,
// //               ),
// //               onChanged: _filterItems,
// //             ),
// //             const SizedBox(height: 16.0), // Add some space below the search bar
// //             Expanded(
// //               child: ListView.builder(
// //                 itemCount: _filteredItems.length,
// //                 itemBuilder: (context, index) {
// //                   return ListTile(
// //                     title: Text(_filteredItems[index]),
// //                     onTap: () {
// //                       ScaffoldMessenger.of(context).showSnackBar(
// //                         SnackBar(
// //                           content:
// //                               Text('You tapped on ${_filteredItems[index]}'),
// //                         ),
// //                       );
// //                     },
// //                   );
// //                 },
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //       bottomNavigationBar: BottomNavigationBar(
// //         items: const <BottomNavigationBarItem>[
// //           BottomNavigationBarItem(
// //             icon: Icon(Icons.home),
// //             label: 'Home',
// //           ),
// //           BottomNavigationBarItem(
// //             icon: Icon(Icons.favorite),
// //             label: 'Favorites',
// //           ),
// //           BottomNavigationBarItem(
// //             icon: Icon(Icons.settings),
// //             label: 'Settings',
// //           ),
// //         ],
// //         currentIndex: _selectedIndex, // Current selected index
// //         selectedItemColor: AppColors.primary,
// //         onTap: _onItemTapped, // Handle tap
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: () => Navigator.push(
// //           context,
// //           MaterialPageRoute(
// //             builder: (context) => const QuizScreen(),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// ////home 10 th october
// //import 'dart:convert';
// //import 'dart:developer';

// //import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:kurups_app/config/colors.dart';
// import 'package:kurups_app/model/users_data.dart';
// //import 'package:kurups_app/config/colors.dart';
// //import 'package:kurups_app/quiz/quiz.dart';
// import 'package:kurups_app/service/database.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   //final String userEmail; // Add userEmail to identify the logged-in user

//   @override
//   // ignore: library_private_types_in_public_api
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   Stream? usersName; // Placeholder for user name
//   List<UsersData> usersData = [];
//   getontheload() async {
//     var _data = await DatabaseMethods().getUsersDetails("users");

//     var snapshot = _data.docs;

//     (snapshot);
//     for (var element in snapshot) {
//       var data = element.data();

//       usersData.add(UsersData.fromJson(data));
//     }

//     setState(() {});
//   }

//   @override
//   void initState() {
//     getontheload();
//     _filteredItems = _allItems;
//     super.initState();
//   }

//   final List<String> _allItems = [
//     'Basic Lesson',
//     '10 th Maths',
//     '12 th Maths',
//   ];
//   List<String> _filteredItems = [];
// // Track the currently selected tab

//   void _filterItems(String query) {
//     if (query.isEmpty) {
//       setState(() {
//         _filteredItems = _allItems; // Show all items when query is empty
//       });
//     } else {
//       List<String> filteredList = _allItems
//           .where((item) => item.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//       setState(() {
//         _filteredItems = filteredList; // Update filtered items
//       });
//     }
//   }

//   //Display user details in the drawer

//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home Page'),
//       ),
//       endDrawer: Drawer(
//         child: Container(
//           Widget(),
//           {
//             usersData.isNotEmpty
//                 ? ListView.builder(
//                     itemCount: usersData.length,
//                     itemBuilder: (context, index) {
//                       UsersData ds = usersData[index];
//                       return Container(
//                         width: MediaQuery.of(context).size.width,
//                         height: MediaQuery.of(context).size.height,
//                         decoration: BoxDecoration(color: AppColors.primary),
//                         child: Column(children: [
//                           Text("name: ${ds.name}",
//                               style: TextStyle(
//                                 color: Colors.black,
//                               )),
//                           Text("email: ${ds.email}",
//                               style: TextStyle(
//                                 color: Colors.black,
//                               )),
//                         ]),
//                       );
//                     })
//                 : Container()
//           },
//           child: Column(
//             children: [
//               ListTile(
//                 leading: const Icon(Icons.logout),
//                 title: const Text('Logout'),
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               decoration: InputDecoration(
//                 hintText: 'Search Lessons...',
//                 prefixIcon: const Icon(Icons.search),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                   borderSide: BorderSide.none,
//                 ),
//                 filled: true,
//                 fillColor: Colors.grey[200],
//               ),
//               onChanged: _filterItems, // Call _filterItems on text change
//             ),
//             const SizedBox(height: 16.0),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: _filteredItems.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(_filteredItems[index]),
//                     onTap: () {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                           content:
//                               Text('You tapped on ${_filteredItems[index]}'),
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
