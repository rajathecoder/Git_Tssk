import 'package:flutter/material.dart';
import 'package:github_mobile_app/utils/index.dart';
import 'package:sizer/sizer.dart'; // Assuming you're using Sizer for responsive sizing

class CustomDrawerListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const CustomDrawerListTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 10.h,
          width: 15.w,
          decoration: BoxDecoration(
            border: Border.all(color: Style.colors.exploreBg), // You can replace with Style.colors.authBg if using custom styles
            borderRadius: BorderRadius.circular(10),
            color: Style.colors.white,
          ),
          child: Icon(icon, color: Style.colors.blackUi), // Icon passed as a parameter
        ),
      ),
      title: Text(
        title, // Title passed as a parameter
        style: TextStyle(fontSize: 13.sp), // Adjust text size with Sizer if needed
      ),
      onTap: onTap, // Action passed as a parameter
    );
  }
}
