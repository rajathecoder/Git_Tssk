import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/style/style.util.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, // Number of tabs
      child: Scaffold(
        backgroundColor: Style.colors.white,
        appBar: AppBar(
          backgroundColor: Style.colors.primary,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Style.colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Project',
            style: TextStyle(color: Style.colors.white, fontSize: 20),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            // Project Info Section
            Container(
              height: 15.h,
              color: Style.colors.primary,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          height: 7.h,
                          width: 12.w,
                          decoration: BoxDecoration(color: Style.colors.white),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Heavenly\n',
                          style: TextStyle(
                              color: Style.colors.white, fontSize: 18),
                          children: [
                            TextSpan(
                              text: 'Rajesh Kannan',
                              style: TextStyle(
                                  color: Style.colors.exploreBg, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 10),
                    child: Text(
                      'Last update : 24/04/2023 9.30AM',
                      style: TextStyle(
                          color: Style.colors.exploreBg, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            TabBar(
              isScrollable: true,
              indicatorColor: Colors.white,
              indicator: BoxDecoration(
                color: Style.colors.blackUi,
                borderRadius: BorderRadius.circular(50),
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              dividerColor: Style.colors.white,

              labelStyle: TextStyle(fontSize: 14),
              tabs: [
                Tab(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Branch 1"),
                  ),
                ),
                Tab(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Branch 2"),
                  ),
                ),
                Tab(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Branch 3"),
                  ),
                ),
                Tab(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Branch 4"),
                  ),
                ),
                Tab(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Branch 5"),
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  buildBranchContent('Branch 1', context),
                  buildBranchContent('Branch 2', context),
                  buildBranchContent('Branch 3', context),
                  buildBranchContent('Branch 4', context),
                  buildBranchContent('Branch 5', context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBranchContent(String branchName, BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      children: [
        buildProjectTile('Login flow', '17/05/23 09:30AM', 'Pravin Kumar'),
        buildProjectTile('Event flow', '17/05/23 09:30AM', 'Arun'),
        buildProjectTile('Payment flow', '17/05/23 09:30AM', 'Parthian'),
        buildProjectTile('Ad management', '17/05/23 09:30AM', 'Pravin Kumar'),
        buildProjectTile('Offering', '17/05/23 09:30AM', 'Pravin Kumar'),
        buildProjectTile('Login flow', '6 items', '17/05/23 09:30AM'),
      ],
    );
  }

  Widget buildProjectTile(String title, String date, String owner) {
    return ListTile(
      leading: Container(
        height: 5.h,
        width: 10.w,
        decoration: BoxDecoration(
          color: Style.colors.orangebg,
          borderRadius: BorderRadius.circular(7)
        ),
          child: Icon(Icons.folder, color: Style.colors.orange)),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(date),
          Row(
            children: [
              Icon(Icons.person_4_outlined, color: Style.colors.logoGreen),
              Text(owner),
            ],
          ),
        ],
      ),
    );
  }
}
