import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class fb_ListData extends StatelessWidget {
  const fb_ListData({
    Key? key,
    required this.firestoreDB,
  }) : super(key: key);

  final Stream<QuerySnapshot<Map<String, dynamic>>> firestoreDB;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: firestoreDB,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
            itemCount: snapshot.data!.size,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(snapshot.data!.docs[index]['name']),
                  subtitle: Text(snapshot.data!.docs[index]['description']),
                ),
              );
            });
      },
    );
  }
}
