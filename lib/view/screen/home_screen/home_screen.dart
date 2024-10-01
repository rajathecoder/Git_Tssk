import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart'; // Import flutter_hooks
import 'package:github_mobile_app/utils/index.dart';
import 'package:github_mobile_app/utils/style/index.dart';
import 'package:sizer/sizer.dart';
import '../../widgets/listtilewidget/listtile_widget.dart';
import '../../widgets/projectlist_screen/projecttile.dart';

class HomeScreen extends HookWidget {
  final String? photoURL;
  final String? displayName;
  final String? email;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

   HomeScreen({
    this.photoURL,
    this.displayName,
    this.email,
    super.key,
    String? orgname,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Style.colors.primary,
        elevation: 0,
        leading: IconButton(
          icon:  Icon(Icons.menu, color: Style.colors.white),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        title:  Text(
          'GitHub',
          style: TextStyle(color: Style.colors.white, fontSize: 20),
        ),
        actions: [
          IconButton(
            icon:  Icon(Icons.notifications_none,  color: Style.colors.white),
            onPressed: () {
            },
          ),
        ],
      ),
      drawer:Drawer(
        backgroundColor: Colors.white, // Assuming you're using the default Style.colors.white
        child: ListView(
          padding: EdgeInsets.only(bottom: 20),
          children: [
            SizedBox(height: 5.h),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  Container(
                    width: 12.w,
                    height: 6.h,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(3),
                      image: photoURL != null && photoURL!.isNotEmpty
                          ? DecorationImage(
                        image: NetworkImage(photoURL!),
                        fit: BoxFit.cover,
                      )
                          : null,
                    ),
                  ),
                  SizedBox(width: 3.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        displayName ?? 'Organization Name',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.orange, // Replace with Style.colors.orange if using custom styles
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          displayName ?? 'Username',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            CustomDrawerListTile(
              icon: Icons.view_list,
              title: 'Vithea',
              onTap: () {
              },
            ),
            CustomDrawerListTile(
              icon: Icons.work,
              title: 'Yolo works',
              onTap: () {
              },
            ),
            CustomDrawerListTile(
              icon: Icons.monetization_on,
              title: 'One gold',
              onTap: () {
              },
            ),
            CustomDrawerListTile(
              icon: Icons.book,
              title: 'Zoho books',
              onTap: () {
              },
            ),
            CustomDrawerListTile(
              icon: Icons.exit_to_app,
              title: 'Logout',
              onTap: () {
              },
            ),
          ],
        ),
      ),

      backgroundColor: Style.colors.white,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 15.h,
                color: Style.colors.primary,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Hi ${displayName ?? 'User'}', // Display user's name
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 15.h,
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Style.colors.authBg),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Row(
                        children: [
                          Container(
                            width: 12.w,
                            height: 6.h,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(3),
                              image: photoURL != null && photoURL!.isNotEmpty
                                  ? DecorationImage(
                                image: NetworkImage(photoURL!),
                                fit: BoxFit.cover,
                              )
                                  : null,
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Email or Organization Name
                              Text(
                                email ?? 'Organization Name',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 8),
                              // Username
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.teal,
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                child: Text(
                                  displayName ?? 'Username',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 1.h),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Projects',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: const [
                ProjectTile(
                  title: 'Heavenly',
                  subtitle: 'Rajesh Kannan',
                  icon: Icons.home,
                ),
                ProjectTile(
                  title: 'Surgtest',
                  subtitle: 'Vijay',
                  icon: Icons.science,
                ),
                ProjectTile(
                  title: 'TNULM',
                  subtitle: 'Vikky',
                  icon: Icons.business,
                ),
                ProjectTile(
                  title: 'Erp One',
                  subtitle: 'Vikky',
                  icon: Icons.computer,
                ),
                ProjectTile(
                  title: 'Aggromalie',
                  subtitle: 'Rajesh Kannan',
                  icon: Icons.agriculture,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
