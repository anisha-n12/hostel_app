import 'package:cloud_firestore/cloud_firestore.dart';
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
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
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
                        onTap: () {
                          sendMessage();
                        },
                        child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Constants.primaryColor,
                                borderRadius: BorderRadius.circular(20)),
                            child: const Center(
                                child: Icon(Icons.send, color: Colors.black))),
                      )
                    ],
                  )))
        ]));
  }

  chatlist() {
    // return StreamBuilder(stream: chats, builder: (context, AsyncSnapshot snapshot){})
  }
  sendMessage() async {
    String messageText = messageController.text.trim();

    if (messageText.isNotEmpty) {
      // Access Firestore instance
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Add data to "complains" collection
      await firestore.collection("complains").add({
        "message": messageText,
        // "timestamp": FieldValue.serverTimestamp(),
        // Add any other fields you want to include
      });

      // Clear the message input field after sending
      messageController.clear();
      showNotification("Your complaint has been sent .");
    }
  }

  void showNotification(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: Duration(seconds: 3), // You can adjust the duration
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
