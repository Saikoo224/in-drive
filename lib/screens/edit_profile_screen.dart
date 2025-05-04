import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Main.dart';
import '../providers/profile_provider.dart';

class EditProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context, listen: false);
    final nameController = TextEditingController(text: profileProvider.name);
    final emailController = TextEditingController(text: profileProvider.email);
    final numberController = TextEditingController(text: profileProvider.number);


    return Scaffold(
      appBar: AppBar(title: Text('تعديل البروفايل')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'اسم المستخدم'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'الإيميل'),
            ),
            TextField(
              controller: numberController,
              decoration: InputDecoration(labelText: 'الهاتف'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                profileProvider.updateProfile(
                  nameController.text,
                  emailController.text,
                  numberController.text,
                );
                Navigator.pop(context);
              },
              child: Text('حفظ'),
            ),
          ],
        ),
      ),
    );
  }
}