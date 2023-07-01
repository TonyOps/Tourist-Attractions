import 'package:flutter/material.dart';
import 'package:liberty/models/user_manager.dart';
import 'package:provider/provider.dart';

class ChatMessage extends StatelessWidget {
  ChatMessage(this.data, this.mine);

  final Map<String, dynamic> data;
  final bool mine;

  @override
  Widget build(BuildContext context) {
    return Consumer<UserManager>(builder: (_, userManager, __) {
      if(userManager.adminEnabled){

      }
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Row(
          children: <Widget>[
            !mine
                ? Padding(
              padding: const EdgeInsets.only(right: 8),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  '${userManager.user.photoUrl}',
                ),
              ),
            )
                : Container(),
            Expanded(
              child: Column(
                crossAxisAlignment:
                mine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: <Widget>[
                  data['imgUrl'] != null
                      ? Image.network(
                    data['imgUrl'],
                    width: 250,
                  )
                      : Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: !mine
                          ? BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                        bottomRight: Radius.circular(8.0),
                        bottomLeft: Radius.zero,

                      )
                          : BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                        bottomLeft: Radius.circular(8.0),
                        bottomRight: Radius.zero,
                      ),
                      color:
                      (!mine ? Color(0xFF0D40A9) : Color(0xFFEEEEEE)),
                      //Color(0xFF1E2F50)
      ),
                    child: Text(
                      data['message'],
                      textAlign: mine ? TextAlign.end : TextAlign.start,
                      style: TextStyle(fontSize: 16,color: mine? Color(0xFF0D40A9):Color(0xFFEEEEEE)),
                    ),
                  ),
                  Text(
                    '${userManager.user.name}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
            mine
                ? Padding(
              padding: const EdgeInsets.only(left: 8),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  '${userManager.user.photoUrl}',
                ),
              ),
            )
                : Container(),
          ],
        ),
      );
    });
  }
}
