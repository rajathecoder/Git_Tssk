import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/style/style.util.dart';
import '../../screen/project_screen/project_screen.dart';

class ProjectTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const ProjectTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Style.colors.exploreBg),
            borderRadius: BorderRadius.circular(10),
            color: Style.colors.white
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(icon, color: Colors.black),
          ),
          title: Text(title),
          subtitle: Text(subtitle),
          trailing: Icon(Icons.chevron_right),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProjectScreen()));
          },
        ),
      ),
    );
  }
}