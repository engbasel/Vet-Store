import 'package:animlaowner/Modules/DataUserProvder.dart';
import 'package:flutter/material.dart';
import 'package:animlaowner/Custom_Widget/CoustomFoodCard.dart';
import 'package:animlaowner/Custom_Widget/walkCard.dart';
import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import '../Custom_Widget/CoustoDrawer.dart';
import '../Custom_Widget/CoustomconstWord.dart';

class HomeScreen extends StatefulWidget {
  final String username;
  final Map<String, dynamic>? userData;
  const HomeScreen({
    Key? key,
    this.username = '',
    this.userData,
  }) : super(key: key);
  final String userName = '';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Map<String, dynamic>? userData =
      Provider.of<UserDataProvider>(context, listen: false).userData;
// -----------------------------

  var username;
  // var phone;
  // var email;
  // var animaltype;
  // var cityname;

  @override
  void initState() {
    super.initState();
    // getprefs(); // Call the getprefs() method when the widget initializes
  }

  // getprefs() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   setState(() {
  //     username = preferences.getString('username');
  //   });
  //   print('===========================================');
  //   print(username);
  //   print('===========================================');
  // }

// -----------------------------

  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  @override
  build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _scaffoldState,
        drawer: const CoustomDrawer(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(left: 5, bottom: 0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.menu),
                        onPressed: () {
                          _scaffoldState.currentState!.openDrawer();
                        },
                      ),
                      Text(
                        'Hi ${userData!['username']}',
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.only(bottom: 30, left: 22),
                  child: Row(
                    children: [
                      Text('Check out the new products, '),
                    ],
                  ),
                ),
                const COustmCard(),
                const SizedBox(height: 40),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('Walk Groubs'), Text('Sea all')],
                  ),
                ),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(width: 25),
                      walkCard(
                        cityname: 'valiciea ,spain',
                        number_OF_members: 8,
                        organizer_name: 'basel',
                        meetingName: 'Meet our lovely dogs walking with us!',
                        imagename: 'images/image1.png',
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      walkCard(
                        cityname: 'Valencia, Spain ',
                        number_OF_members: 6,
                        organizer_name: 'Laura ',
                        meetingName:
                            'Meet our Trinding dog in our countrry last year!',
                        imagename: 'images/image2.png',
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      walkCard(
                        cityname: 'valiciea ,spain',
                        number_OF_members: 8,
                        organizer_name: 'basel',
                        meetingName: 'Meet our lovely dogs walking with us!',
                        imagename: 'images/image1.png',
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('new products'), Text('Sea all')],
                  ),
                ),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                        height: 20,
                      ),
                      CustomFoodCard(
                          type: 'Dry food',
                          expaire: 25,
                          factory: 'itali',
                          // meetingName: 'meetingName',
                          imagename: 'images/FoodAnimal1.jpg'),
                      SizedBox(
                        width: 20,
                      ),
                      CustomFoodCard(
                          type: 'suplmients',
                          expaire: 10,
                          factory: 'frans',
                          // meetingName: 'meetingName',
                          imagename: 'images/FoodAnimal2.jpg'),
                      SizedBox(
                        width: 20,
                      ),
                      CustomFoodCard(
                          type: 'Dry food',
                          expaire: 25,
                          factory: 'itali',
                          // meetingName: 'meetingName',
                          imagename: 'images/FoodAnimal1.jpg'),
                      SizedBox(
                        width: 30,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                  width: 50,
                ),
                // BottomNavBarbb()\\
              ],
            ),
          ),
        ),
      ),
    );
  }
}
