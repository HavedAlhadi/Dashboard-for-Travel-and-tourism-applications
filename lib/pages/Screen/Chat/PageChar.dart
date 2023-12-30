import 'package:flutter/material.dart';
import 'package:kayan_controle/Data/Data.dart';
import 'package:kayan_controle/pages/Screen/Chat/MessagCard.dart';

class BottomSendNavigation extends StatefulWidget {
  @override
  _BottomSendNavigationState createState() => _BottomSendNavigationState();
}

class _BottomSendNavigationState extends State<BottomSendNavigation>
    with SingleTickerProviderStateMixin {
  TextEditingController _sendMessageController = TextEditingController();

  bool showEmoji = false;

  FocusNode focusNode = FocusNode();

  Icon _emojiIcon = Icon(
    Icons.add,
    color: Colors.grey,
    size: 20,
  );

  @override
  void initState() {
    super.initState();
    focusNode.addListener(
      () {
        if (focusNode.hasFocus) {
          setState(() {
            showEmoji = false;
            _emojiIcon = Icon(
              Icons.safety_check,
              color: Colors.grey,
              size: 20,
            );
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Stack(
        children: [
          ListView(
            padding: EdgeInsets.all(20),
            children: List.generate(
              TableMessages.length,
              (index) {
                return MessageCards(
                  Contant: TableMessages[index].Contant);
              },
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 60,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 1.5,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: TextField(
                                focusNode: focusNode,
                                cursorColor: Colors.black,
                                controller: _sendMessageController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Type Here",
                                  prefixIcon: IconButton(
                                    icon: _emojiIcon,
                                    onPressed: () {
                                      focusNode.unfocus();
                                      focusNode.canRequestFocus = false;
                                      setState(() {
                                        showEmoji = !showEmoji;
                                        _emojiIcon =
                                            Icon(Icons.keyboard);
                                      });
                                    },
                                  ),
                                  suffixIcon: Icon(
                                    Icons.panorama_photosphere,
                                    color: Colors.grey,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 12),
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            child: Icon(
                              Icons.camera,
                              color: Colors.grey,
                              size: 20,
                            ),
                          ),
                          SizedBox(width: 7),
                          Container(
                            padding: EdgeInsets.only(right: 5),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white24,
                            ),
                            child: Icon(
                              Icons.pages,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              showEmoji ? showEmojiPicker() : Container(),
            ],
          ),
        ],
      ),
      onWillPop: () {
        if (showEmoji) {
          setState(() {
            showEmoji = false;
          });
        } else {
          Navigator.pop(context);
        }
        return Future.value(false);
      },
    );
  }

  Widget showEmojiPicker() {
    return Container();
  }
}
