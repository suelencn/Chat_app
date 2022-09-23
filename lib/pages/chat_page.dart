import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chats/ncl9PJWKkfuo9VG3V0zp/messages')
            .snapshots(),
        builder: (ctx, AsyncSnapshot<QuerySnapshot> streamsnapshot) {
          if (streamsnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final documents = streamsnapshot.data?.docs;
          return ListView.builder(
            itemCount: streamsnapshot.data?.docs.length,
            itemBuilder: ((context, index) => Container(
                  padding: const EdgeInsets.all(8),
                  child: Text(documents?[index]['text']),
                )),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseFirestore.instance
              .collection('chats/ncl9PJWKkfuo9VG3V0zp/messages')
              .add({'text': 'This was added by clicking the button!'});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}



// FirebaseFirestore.instance
          //     .collection('chats/ncl9PJWKkfuo9VG3V0zp/messages')
          //     .snapshots()
          //     .listen((event) {
          //   //print(event.docs[0]['text']); ->primeiro dado apenas
          //   event.docs.forEach((element) {
          //     print(element.data()['text']);
          //   });
          // });