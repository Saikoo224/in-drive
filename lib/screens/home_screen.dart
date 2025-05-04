import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uber_clone/screens/Notification.dart';
import 'package:uber_clone/screens/profile_screen.dart';

class Trip {
  final String from;
  final String to;
  final double price;
  final String PaymnetMethod;
  final LatLng fromLocation;
  final LatLng toLocation;

  Trip({
    required this.from,
    required this.to,
    required this.price,
    required this.PaymnetMethod,
    required this.fromLocation,
    required this.toLocation,
  });
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GoogleMapController? mapController;
  Set<Marker> markers = {};
  int selectedTab = 0; // 0: Rides, 1: Eats

  List<Trip> allTrips = [
    Trip(
      from: 'القاهرة',
      to: 'الإسكندرية',
      price: 500,
      PaymnetMethod: 'Cash',
      fromLocation: LatLng(30.0444, 31.2357),
      toLocation: LatLng(31.2001, 29.9187),
    ),
    Trip(
      from: 'القاهرة',
      to: 'الجيزة',
      price: 100,
      PaymnetMethod: 'Cash',
      fromLocation: LatLng(30.0444, 31.2357),
      toLocation: LatLng(30.0131, 31.2089),
    ),
    Trip(
      from: 'الإسكندرية',
      to: 'أسوان',
      price: 1200,
      PaymnetMethod: 'Cash',
      fromLocation: LatLng(31.2001, 29.9187),
      toLocation: LatLng(24.0889, 32.8998),
    ),
    Trip(
      from: 'الجيزة',
      to: 'الأقصر',
      price: 900,
      PaymnetMethod: 'visa',
      fromLocation: LatLng(30.0131, 31.2089),
      toLocation: LatLng(25.6872, 32.6396),
    ),
    Trip(
      from: 'القاهرة',
      to: 'شرم الشيخ',
      price: 800,
      PaymnetMethod: 'visa',
      fromLocation: LatLng(30.0444, 31.2357),
      toLocation: LatLng(27.9158, 34.3300),
    ),
  ];

  List<Map<String, String>> favoritePlaces = [
    {'title': 'العمل', 'subtitle': 'شارع التحرير، القاهرة', 'icon': 'work'},
    {'title': 'المنزل', 'subtitle': 'مدينة نصر، القاهرة', 'icon': 'home'},
  ];

  List<Trip> filteredTrips = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _updateMarkers();
    filteredTrips = allTrips;
    _searchController.addListener(_filterTrips);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterTrips() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredTrips = allTrips.where((trip) {
        return trip.from.toLowerCase().contains(query) ||
            trip.to.toLowerCase().contains(query);
      }).toList();
    });
  }

  void _updateMarkers() {
    markers.clear();
    for (var trip in allTrips) {
      markers.add(
        Marker(
          markerId: MarkerId('${trip.from}-${trip.to}'),
          position: trip.fromLocation,
          infoWindow: InfoWindow(
            title: 'من ${trip.from}',
            snippet: 'إلى ${trip.to}',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30.0),
        child: AppBar(
          title: Center(child: Text("Ugra")),
          automaticallyImplyLeading: false,
        ),
      ),
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Text(
                'Home',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
            ListTile(
              title: const Text("Notification"),
              leading: Icon(Icons.notifications_active),

              // onTap: () {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => NotificationPage()),
              //     // page name = ---
              //   );
              // },
            ),
            ListTile(
              leading: Icon(Icons.history),

              title: Text("Ride History"),
              // onTap: () {
              //
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => --- ()),
              //     // page name = ---
              //   );
              // },
            ),
            ListTile(
              leading: Icon(Icons.call),

              title: const Text("Contact Us"),
              // onTap: () {
              //
              //       Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => --- ()),
              //         // page name = ---
              //   );
              // },
            ),
            ListTile(
              leading: Icon(Icons.feedback),

              title: Text("Feedback"),
              // onTap: () {
              //
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => --- ()),
              //     // page name = ---
              //   );
              // },
            ),
            ListTile(
              leading: Icon(Icons.payment),

              title: Text("Payments"),
              // onTap: () {
              //
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => --- ()),
              //     // page name = ---
              //   );
              // },
            ),
            ListTile(
              title: Text("Settings"),
              leading: Icon(Icons.settings),

              // onTap: () {
              //
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => --- ()),
              //     // page name = ---
              //   );
              // },
            ),
            ListTile(
              leading: Icon(Icons.bookmark),

              title: Text("Booking"),
              // onTap: () {
              //
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => --- ()),
              //     // page name = ---
              //   );
              // },
            ),
            ListTile(
              leading: Icon(Icons.details_sharp),
              title: Text("Ride Details"),
              // onTap: () {
              //
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => --- ()),
              //     // page name = ---
              //   );
              // },
            ),
            ListTile(
              leading: Icon(Icons.map),

              title: Text("Map Tracking"),
              // onTap: () {
              //
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => --- ()),
              //     // page name = ---
              //   );
              // },
            ),
          ],
        ),
      ),

      // backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // الخريطة مع زر القائمة
            Stack(
              children: [
                Container(
                  height: 320,
                  width: double.infinity,
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(24),
                        bottomRight: Radius.circular(24),
                      ),
                      child:
                      Image.asset(
                        'lib/assets/map_sample.png',
                        fit: BoxFit.cover,
                      )

                      // Image.network(
                      //   'lib/assets/map_sample.png',
                      //   fit: BoxFit.cover,
                      // ),
                      ),
                ),
                Positioned(
                  top: 16,
                  left: 16,
                  child: GestureDetector(
                    onTap: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 24,
                      child: Icon(Icons.menu, color: Colors.black),
                    ),
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/profile');
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 24,
                      child: Icon(Icons.person, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            // رسالة ترحيب
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'صباح الخير، أحمد',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 12),
            // مربع البحث
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'إلى أين؟',
                    prefixIcon: Icon(Icons.search, color: Colors.black54),
                    suffixIcon: Icon(Icons.access_time, color: Colors.black38),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            // الأماكن المفضلة
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  ...favoritePlaces.map((place) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            leading: Icon(
                              place['icon'] == 'work' ? Icons.work : Icons.home,
                              color: Colors.black,
                            ),
                            title: Text(place['title']!),
                            subtitle: Text(place['subtitle']!),
                            onTap: () {},
                          ),
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(height: 8),
            // قائمة الرحلات المتاحة
            Expanded(
              child: filteredTrips.isEmpty
                  ? Center(child: Text('لا توجد رحلات متاحة'))
                  : ListView.builder(
                      itemCount: filteredTrips.length,
                      itemBuilder: (context, index) {
                        final trip = filteredTrips[index];
                        return Card(
                          margin:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                          child: ListTile(
                            title: Text('من ${trip.from} إلى ${trip.to}'),
                            subtitle: Text('السعر: ${trip.price} جنيه'),
                            trailing: ElevatedButton(
                              onPressed: () {
                                String selectedPaymentMethod = 'Cash';
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return StatefulBuilder(
                                      builder: (BuildContext context,
                                          StateSetter setState) {
                                        return AlertDialog(
                                          title: Text('تفاصيل الرحلة'),
                                          content: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    'من ${trip.from} إلى ${trip.to}'),
                                                SizedBox(height: 8),
                                                Text(
                                                    'السعر: ${trip.price} جنيه'),
                                                SizedBox(height: 16),
                                                Text('اختر طريقة الدفع:'),
                                                SizedBox(height: 8),
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 12),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.grey),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  child: DropdownButton<String>(
                                                    value:
                                                        selectedPaymentMethod,
                                                    isExpanded: true,
                                                    underline: SizedBox(),
                                                    items: ['Cash', 'Visa']
                                                        .map((String value) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        value: value,
                                                        child: Text(value),
                                                      );
                                                    }).toList(),
                                                    onChanged:
                                                        (String? newValue) {
                                                      if (newValue != null) {
                                                        setState(() {
                                                          selectedPaymentMethod =
                                                              newValue;
                                                        });
                                                      }
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: Text('إلغاء'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                        'تم تأكيد الرحلة مع الدفع $selectedPaymentMethod'),
                                                  ),
                                                );
                                              },
                                              child: Text('تأكيد'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                              child: Text('اختيار'),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      // شريط سفلي
      bottomNavigationBar: null,
    );
  }
}
