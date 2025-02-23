import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection(
          'chats/A4m1Y9mLx4bBhxVcxqGC/messages')
          .snapshots(), 
        builder: (context, streamSnapshot) {
          if (streamSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          final documents = streamSnapshot.data!.docs;
          return ListView.builder(
            itemCount: streamSnapshot.data!.docs.length,
            itemBuilder: (ctx, index) => Container(
              padding: EdgeInsets.all(8.0),
              child: Text(documents[index]['text']),
            ),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseFirestore.instance.collection(
            'chats/A4m1Y9mLx4bBhxVcxqGC/messages')
            .add({'text': 'Hello, world!'}
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}