import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat App'),
        actions: [
          DropdownButton(
            icon: Icon(Icons.more_vert),
            items: [DropdownMenuItem(
              value: 'Logout',
              child: Container(
                child: Row(
                  children: [
                    Icon(Icons.exit_to_app),
                    Text('Logout'),
                  ]
                )
              )
            )], 
            onChanged: (itemIdentifer) {
              if (itemIdentifer == 'Logout') {
                FirebaseAuth.instance.signOut();
              }
            }
          )
        ],
      ),
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