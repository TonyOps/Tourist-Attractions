import 'package:flutter/material.dart';
import 'package:liberty/models/user.dart';
import 'package:liberty/models/user_manager.dart';
import 'package:liberty/screens/login/sign/constants.dart';
import 'package:provider/provider.dart';

class TextComposer extends StatefulWidget {

  TextComposer(this.sendMessage);

  final Function({User user,String message}) sendMessage;

  @override
  _TextComposerState createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {
  final TextEditingController _controller = TextEditingController();

  bool _isComposing = false;

  void _reset() {
    _controller.clear();
    setState(() {
      _isComposing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserManager>(builder: (_, userManager, __) {
      return SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 6),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: "Escreva uma Mensagem",
                    enabledBorder: outlineInputBorder(),
                    focusedBorder: outlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                  onChanged: (message) {
                    setState(() {
                      _isComposing = message.isNotEmpty;
                    });
                  },
                  onSubmitted: (message) {
                    widget.sendMessage(message: message);
                    _reset();
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  padding: EdgeInsets.only(left:4),
                  child: FloatingActionButton(
                    onPressed: _isComposing
                        ? () {
                            widget.sendMessage(message: _controller.text);
                            _reset();
                          }
                        : null,
                    elevation: 0,
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
