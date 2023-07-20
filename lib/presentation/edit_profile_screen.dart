import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
      onPressed: () {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => SimpleDialog(
            title: const Text('Dialog Title'),
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.account_circle),
                title: const Text('user@example.com'),
                onTap: () => Navigator.pop(context, 'user@example.com'),
              ),
              ListTile(
                leading: const Icon(Icons.account_circle),
                title: const Text('user2@gmail.com'),
                onTap: () => Navigator.pop(context, 'user2@gmail.com'),
              ),
              ListTile(
                leading: const Icon(Icons.add_circle),
                title: const Text('Add account'),
                onTap: () => Navigator.pop(context, 'Add account'),
              ),
            ],
          ),
        );
      },
      child: const Text('Simple dialog'),
    );
  }
}
