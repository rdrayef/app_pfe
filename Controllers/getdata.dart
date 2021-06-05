import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Message {
  final message;
  final timestamp;
  final uid;
  final user;
  const Message(this.message, this.timestamp, this.uid, this.user);
}

class ChatList extends StatelessWidget {
  Stream<List<Message>> getData() async* {
    var messagesStream = Firestore.instance
        .collection("chat")
        .orderBy("timestamp", descending: true)
        .snapshots();
    var messages = List<Message>();
    await for (var messagesSnapshot in messagesStream) {
      for (var messageDoc in messagesSnapshot.documents) {
        var message;
        if (messageDoc["uid"] != null) {
          var userSnapshot = await Firestore.instance
              .collection("utilisateurs")
              .document(messageDoc["uid"])
              .get();
          message = Message(messageDoc["message"], messageDoc["timestamp"],
              messageDoc["uid"], userSnapshot["Nom"]);
        } else {
          message =
              Message(messageDoc["message"], messageDoc["timestamp"], "", "");
        }
        messages.add(message);
      }
      yield messages;
    }
  }

  @override
  Widget build(BuildContext context) {
    var streamBuilder = StreamBuilder<List<Message>>(
        stream: getData(),
        builder: (BuildContext context,
            AsyncSnapshot<List<Message>> messagesSnapshot) {
          if (messagesSnapshot.hasError)
            return new Text('Error: ${messagesSnapshot.error}');
          switch (messagesSnapshot.connectionState) {
            case ConnectionState.waiting:
              return new Text("Loading...");
            default:
              return new ListView(
                  children: messagesSnapshot.data.map((Message msg) {
                return new ListTile(
                  title: new Text(msg.message),
                  subtitle: new Text(
                      DateTime.fromMillisecondsSinceEpoch(msg.timestamp)
                              .toString() +
                          "\n" +
                          (msg.user ?? msg.uid)),
                );
              }).toList());
          }
        });
    return streamBuilder;
  }
}
