import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (ctx, index) => Container(
          padding: EdgeInsets.all(8.0),
          child: Text('This works'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseFirestore.instance.collection(
            'chats/A4m1Y9mLx4bBhxVcxqGC/messages')
            .snapshots().listen((data) {
              data.docs.forEach((document) {
                print(document['text']);
              });
            });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}