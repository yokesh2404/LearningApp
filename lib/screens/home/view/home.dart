import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kurups_app/entity/request/user_details/user_details.dart';
import 'package:kurups_app/entity/user_data/users_data.dart';
import 'package:kurups_app/injector/injector.dart';
import 'package:kurups_app/screens/home/bloc/home_bloc.dart';
import 'package:kurups_app/screens/home/view/drawer_widget.dart';
import 'package:kurups_app/service/firebase_services/firebase_database/firebase_database_service.dart';
import 'package:kurups_app/utils/constants/app_images.dart';
import 'package:kurups_app/utils/constants/app_string.dart';

import 'package:kurups_app/utils/constants/colors.dart';
import 'package:kurups_app/service/database.dart';
import 'package:kurups_app/utils/dimension/app_sizes.dart';
import 'package:kurups_app/utils/dimension/dimension.dart';
import 'package:kurups_app/utils/helper/box_decorations.dart';

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
  final List<String> _allItems = [
    'Basic Lesson',
    '10 th Maths',
    '12 th Maths',
  ];
  getontheload() async {
    // await FirebaseDatabaseService.instance.getUserDataById();
    var _data = await DatabaseMethods().getUsersDetails("home");

    var snapshot = await _data.docs;

    print(snapshot.toList());
    snapshot.forEach(
      (element) {
        var data = element.id;
        print(data);
        // usersData.add(UsersData.fromJson(data));
      },
    );

    setState(() {});
  }

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // getontheload();
    // _filterItems = _allItems;
    super.initState();
  }

  final TextEditingController _searchController = TextEditingController();

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
    return BlocProvider(
        create: (context) => Injector.instance<HomeBloc>()
          ..add(GetHomeData())
          ..add(GetHomeCourses()),
        child: Scaffold(
            key: _scaffoldKey,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            // appBar: PreferredSize(
            //   preferredSize: Size(200, 50),
            //   child: SafeArea(
            //     child: AppBar(
            //       title: Text(
            //         'Home Page',
            //         style: TextStyle(color: AppColors.onPrimary),
            //       ),
            //       backgroundColor: AppColors.primary,
            //       leadingWidth: 80.0,
            //     ),
            //   ),
            // ),
            resizeToAvoidBottomInset: false,
            endDrawer: DrawerWidget(
              userDetails: Injector.instance<HomeBloc>().state.userDetails ??
                  UserDetails(),
            ),
            body: SafeArea(
                child: Stack(
              fit: StackFit.expand,
              children: [
                Positioned.fill(
                  child: Container(
                    height: Dimensions.screenHeight,
                    width: Dimensions.screenWidth,
                    decoration: BoxDecoration(
                        color: AppColors.borderPrimary.withOpacity(0.5)),
                    child: Column(
                      children: [
                        Container(
                          height: Dimensions.screenHeight / 2,
                          width: Dimensions.screenWidth,
                          decoration: BoxDecorations.boxDecorationwithoutShadow(
                              borderColor: AppColors.primary,
                              radius: const BorderRadius.only(
                                  bottomRight:
                                      Radius.circular(Dimensions.size_14),
                                  bottomLeft:
                                      Radius.circular(Dimensions.size_14)),
                              backgroundColor: AppColors.primary),
                        )
                        // Image.asset(
                        //   AppImages.startlearning,
                        //   fit: BoxFit.fill,
                        // ),
                      ],
                    ),
                  ),
                ),
                _bodyWidget(),
              ],
            ))));
  }

  Widget _bodyWidget() {
    return BlocConsumer<HomeBloc, HomeBlocState>(
      builder: (context, state) {
        return state.status.when(initial: () {
          return const Text("Initial");
        }, loading: () {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
            ),
          );
        }, loadFailed: () {
          return const Center(child: Text("No data"));
        }, loadSuccess: () {
          return _buildBody();
        });
      },
      listener: (context, state) {},
    );
  }

  _buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () => _scaffoldKey.currentState!.openEndDrawer(),
                child: Container(
                  height: Dimensions.height_48,
                  width: Dimensions.width_48,
                  decoration: BoxDecorations.boxDecorationwithoutShadow(
                      borderColor: AppColors.white.withOpacity(0.2),
                      backgroundColor: AppColors.white.withOpacity(0.2)),
                  child: Image.asset(AppImages.humBurgerMenu),
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.height_30,
            ),
            Text(
              AppString.welcomeText,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: Dimensions.size_30, color: AppColors.white),
            ),
            const SizedBox(
              height: Dimensions.height_24,
            ),
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                  hintText: 'Search...',
                  suffixIcon: const Icon(Icons.search),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      style: BorderStyle.solid,
                      color: AppColors.white,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      style: BorderStyle.solid,
                      color: AppColors.white,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      style: BorderStyle.solid,
                      color: AppColors.white,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      style: BorderStyle.solid,
                      color: AppColors.white,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      style: BorderStyle.solid,
                      color: AppColors.white,
                    ),
                  ),
                  filled: true,
                  fillColor: AppColors.surface),
            ),
            const SizedBox(height: 16.0), // Add some space below the search bar
            Container(
              decoration: BoxDecorations.boxDecorationwithoutShadow(
                  backgroundColor: AppColors.white),
              width: Dimensions.screenWidth,
              padding: const EdgeInsets.all(Dimensions.size_24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppString.startLearning,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.textPurple,
                        fontSize: Dimensions.size_18),
                  ),
                  const SizedBox(
                    height: Dimensions.size_12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Container(
                            decoration:
                                BoxDecorations.boxDecorationwithoutShadow(
                                    borderColor: AppColors.primary,
                                    backgroundColor: AppColors.primary),
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              children: [
                                Text(
                                  AppString.categoires,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                          color: AppColors.white,
                                          fontSize: Dimensions.size_12),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                const Icon(
                                  Icons.arrow_forward_rounded,
                                  color: AppColors.white,
                                  size: 12,
                                )
                              ],
                            ),
                          )),
                      Image.asset(AppImages.startlearning),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: Dimensions.height_12,
            ),
            Text(
              AppString.courseInProgress,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.textPurple, fontSize: Dimensions.size_18),
            ),
            const SizedBox(
              height: Dimensions.height_12,
            ),
            allUserDetails()
            // Expanded(
            //   child: allUserDetails(),
            // ),
          ],
        ),
      ),
    );
  }

  Widget allUserDetails() {
    return ListView.separated(
      itemCount: Injector.instance<HomeBloc>().state.courseList!.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        var courses = Injector.instance<HomeBloc>().state.courseList![index];
        return InkWell(
          onTap: () => Injector.instance<HomeBloc>()
              .add(ClickCourse(id: courses.id ?? "", context: context)),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: const LinearGradient(
                colors: [AppColors.primary, AppColors.secondary],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: const EdgeInsets.all(Dimensions.size_20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: Dimensions.height_40,
                    width: Dimensions.width_40,
                    alignment: Alignment.center,
                    child: Image.asset(
                      AppImages.diamond,
                      height: Dimensions.height_30,
                      width: Dimensions.width_30,
                    ),
                  ),
                  Text("${courses.title}",
                      style: const TextStyle(
                        color: AppColors.white,
                      )),
                  CircleAvatar(
                    backgroundColor: AppColors.white,
                    child: Image.asset(AppImages.play),
                  )
                ]),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: Dimensions.height_12,
        );
      },
    );
  }
}




// return Scaffold(
//             appBar: PreferredSize(
//               preferredSize: Size(200, 50),
//               child: SafeArea(
//                 child: AppBar(
//                   title: Text(
//                     'Home Page',
//                     style: TextStyle(color: AppColors.onPrimary),
//                   ),
//                   backgroundColor: AppColors.primary,
//                   leadingWidth: 80.0,
//                 ),
//               ),
//             ),
            
//             //  Drawer(
//             //   child: ListView(
//             //     padding: EdgeInsets.zero,
//             //     children: <Widget>[
//             //       //read operation
//             //       SizedBox(
//             //         height: 50,
//             //       ),
//             //       Container(
//             //         height: 150,
//             //         padding: EdgeInsets.all(10),
//             //         width: MediaQuery.of(context).size.width,
//             //         decoration: BoxDecoration(
//             //           color: AppColors.primary,
//             //         ),
//             //         child: Column(
//             //           children: [],
//             //         ),
//             //       ),
//             //       ListTile(
//             //         leading: const Icon(Icons.home),
//             //         title: const Text('Home'),
//             //         onTap: () {
//             //           // Handle Home button tap
//             //           Navigator.pop(context); // Close the drawer
//             //         },
//             //       ),
//             //       ListTile(
//             //         leading: const Icon(Icons.edit),
//             //         title: const Text('Edit Profile'),
//             //         onTap: () {
//             //           // Handle Settings button tap
//             //           Navigator.pop(context); // Close the drawer
//             //         },
//             //       ),
//             //       ListTile(
//             //         leading: const Icon(Icons.logout),
//             //         title: const Text('Logout'),
//             //         onTap: () {
//             //           FirebaseAuth.instance.signOut();
//             //           Navigator.pop(context, "/LoginScreen"); // Close the drawer
//             //         },
//             //       ),
//             //     ],
//             //   ),
//             // ),
//             body: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 children: [
//                   TextField(
//                     controller: _searchController,
//                     decoration: InputDecoration(
//                         hintText: 'Search...',
//                         prefixIcon: const Icon(Icons.search),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8.0),
//                           borderSide: BorderSide.none,
//                         ),
//                         filled: true,
//                         fillColor: AppColors.surface),
//                   ),
//                   const SizedBox(
//                       height: 16.0), // Add some space below the search bar
//                   Expanded(
//                     child: allUserDetails(),
//                   ),
//                 ],
//               ),
//             ),
//             bottomNavigationBar: BottomNavigationBar(
//               items: const <BottomNavigationBarItem>[
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.home),
//                   label: 'Home',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.favorite),
//                   label: 'Favorites',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.settings),
//                   label: 'Settings',
//                 ),
//               ],
//               currentIndex: _selectedIndex, // Current selected index
//               selectedItemColor: AppColors.primary,
//               onTap: _onItemTapped, // Handle tap
//             ),
//             floatingActionButton:
//                 FloatingActionButton(onPressed: () => getontheload()
//                     // Navigator.push(
//                     //     context,
//                     //     MaterialPageRoute(
//                     //       builder: (context) => const QuizScreen(),
//                     //     )),
//                     ),
//           );
