import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextEditingController controller1 = TextEditingController();
TextEditingController controller2 = TextEditingController();

void calldialog(BuildContext context, Stream fb) {
  void showtext() {
    if (controller1.toString().trim() != "") {}
  }

  var alertdialog = AlertDialog(
    title: Text('Store data in Firebase'),
    content: Wrap(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Enter Name :'),
            TextField(
              controller: controller1,
              decoration: InputDecoration(hintText: 'Enter your name'),
              // onSubmitted: (context) {
              //   FirebaseFirestore.instance
              //       .collection('persons')
              //       .add({'name': controller1.text});
              // },
            ),
            SizedBox(
              height: 15,
            ),
            Text('Enter Description :'),
            TextField(
              controller: controller2,
              decoration: InputDecoration(hintText: 'Enter quote of the day'),
              // onSubmitted: (context) {
              //   FirebaseFirestore.instance
              //       .collection('persons')
              //       .add({'description': controller2.text});
              // },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  onPressed: () {
                    FirebaseFirestore.instance.collection('persons').add({
                      'name': controller1.text,
                      'description': controller2.text
                    });
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                  color: Colors.blueAccent,
                ),
              ],
            )
          ],
        ),
      ],
    ),
  );
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertdialog;
      });
}
