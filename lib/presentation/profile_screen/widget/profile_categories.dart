
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileCategoryWidget extends StatelessWidget {
  const ProfileCategoryWidget({
    super.key,
     required this.title,
      required this.icon,
       required this.onPress,
        required this.endIcon, 
         this.textColor,
  });
  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;


  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.grey.withOpacity(0.1)),
        child:  Icon(
         icon,
          
        ),
      ),
      title: Text(
        title,
        style: GoogleFonts.notoSansOldItalic(
            textStyle:  TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
        )),
      ),
      trailing: endIcon? Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.grey.withOpacity(0.1)),
        child: const Icon(
          Icons.arrow_forward_ios,
          size: 18,
          color: Colors.grey,
        ),
      ):null
    );
  }
}