import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:liberty/models/user.dart';
import 'package:liberty/models/user_manager.dart';
import 'package:liberty/screens/user/chat_user/chat_message.dart';
import 'package:liberty/screens/user/chat_user/text_composer.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  FirebaseUser _currentUser;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    FirebaseAuth.instance.onAuthStateChanged.listen((user) {
      setState(() {
        _currentUser = user;
      });
    });
  }

  void _sendMessage({User user,String message}) async {
    final FirebaseUser user = _currentUser;

    Map<String, dynamic> data = {
      "uid": user.uid,
      "name": user.displayName,
      "photoUrl": user.photoUrl,
      "time": new DateTime.now().toIso8601String()
    };

    if (message != null) data['message'] = message;

    Firestore.instance.collection('messages').add(data);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserManager>(
      builder: (_, userManager, __){
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: SvgPicture.asset("assets/icons/arrow-long-left.svg"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            elevation: 0,
            automaticallyImplyLeading: false,
            backgroundColor: Color(0xFFF5F6F9),
            flexibleSpace: SafeArea(
              child: Container(
                //padding: EdgeInsets.only(right: 16),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: SafeArea(
            child: Container(
              color: Color(0xFFF5F6F9),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: Firestore.instance
                          .collection('messages')
                          .orderBy('time')
                          .snapshots(),
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                          case ConnectionState.waiting:
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          default:
                            List<DocumentSnapshot> documents =
                            snapshot.data.documents.reversed.toList();

                            return ListView.builder(
                                itemCount: documents.length,
                                reverse: true,
                                itemBuilder: (context, index) {
                                  return ChatMessage(
                                      documents[index].data,
                                      documents[index].data['uid'] ==
                                          _currentUser.uid);
                                });
                        }
                      },
                    ),
                  ),
                  _isLoading ? LinearProgressIndicator() : Container(),
                  TextComposer(_sendMessage),
                ],
              ),
            ),
          ),
        );
      }

    );
  }
}
