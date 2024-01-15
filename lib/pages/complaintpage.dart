import 'package:flutter/material.dart';
import 'package:hostel_app/shared/constants.dart';

class ComplaintBox extends StatefulWidget {
  const ComplaintBox({super.key});

  @override
  State<ComplaintBox> createState() => _ComplaintBoxState();
}

class _ComplaintBoxState extends State<ComplaintBox> {
  TextEditingController messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Constants.primaryColor,
          title: const Text(
            "Complaint Box",
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        body: Stack(children: <Widget>[
          // chatlist(),
          Container(
              alignment: Alignment.bottomCenter,
              width: MediaQuery.of(context).size.width,
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                  color: Colors.grey,
                  child: Row(
                    children: [
                      Expanded(
                          child: TextFormField(
                        controller: messageController,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                            hintText: "Send a Complaint...",
                            hintStyle:
                                TextStyle(color: Colors.white, fontSize: 16),
                            border: InputBorder.none),
                      )),
                      const SizedBox(width: 12),
                      GestureDetector(
                        onTap: (){
                          // sendMessage();
                        },
                        child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Constants.primaryColor,
                                borderRadius: BorderRadius.circular(20)),
                            child: const Center(
                                child:  Icon(Icons.send, color: Colors.black))),
                      )
                    ],
                  )))
        ]));
  }

  chatlist() {
    // return StreamBuilder(stream: chats, builder: (context, AsyncSnapshot snapshot){})
  }
  sendMessage(){}
}
