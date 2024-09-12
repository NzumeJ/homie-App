import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  final String profileImage;
  final String name;

  MessagePage({required this.profileImage, required this.name});

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final List<Map<String, dynamic>> messages = [];
  final TextEditingController _controller = TextEditingController();

  void _sendMessage(String text) {
    if (text.isNotEmpty) {
      setState(() {
        messages.add({
          'text': text,
          'isSentByMe': true,
          'time': DateTime.now().toString().substring(11, 16),
        });
      });
      _controller.clear();
    }
  }

  void _receiveMessage(String text) {
    if (text.isNotEmpty) {
      setState(() {
        messages.add({
          'text': text,
          'isSentByMe': false,
          'time': DateTime.now().toString().substring(11, 16),
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(widget.profileImage),
            ),
            SizedBox(width: 10),
            Text(widget.name),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return Align(
                  alignment: messages[index]['isSentByMe']
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: messages[index]['isSentByMe']
                          ? Colors.blue[100]
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: messages[index]['isSentByMe']
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        Text(messages[index]['text']),
                        SizedBox(height: 5),
                        Text(
                          messages[index]['time'],
                          style: TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.mic),
                  onPressed: () {
                    // Handle audio message
                  },
                ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    _sendMessage(_controller.text);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
     // floatingActionButton: FloatingActionButton(
       // child: Icon(Icons.call),
        //onPressed: () {
          // Handle call
       // },
     // ),
    );
  }
}
