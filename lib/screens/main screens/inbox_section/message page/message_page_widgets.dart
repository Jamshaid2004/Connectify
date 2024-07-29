import 'package:connectify_project/screens/main%20screens/inbox_section/information%20page/message_information_page.dart';
import 'package:flutter/material.dart';

class MessagePageAppBarWidget extends AppBar {
  MessagePageAppBarWidget(
      {super.key,
      required BuildContext context,
      required String username,
      required Size size})
      : super(
          backgroundColor: Colors.blueGrey,
          leading: Padding(
            padding: EdgeInsets.all(size.width * 0.02),
            child: const CircleAvatar(backgroundColor: Colors.white),
          ),
          title: Text(username),
          actions: [
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(MessageInformationPage.pageAddress);
              },
              child: Padding(
                padding: EdgeInsets.all(size.width * 0.01),
                child: const Icon(Icons.info),
              ),
            )
          ],
        );
}

class MessagePageMessageListWidget extends StatelessWidget {
  const MessagePageMessageListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Size(:width) = MediaQuery.sizeOf(context);
    return Center(
      child: ListView.builder(
        itemCount: 25,
        itemBuilder: (context, index) {
          if (index == 25 - 1) {
            return SizedBox(height: width * 0.2);
          } else if (index % 2 == 0) {
            return MessagePageOutgoingMessageWidget(
                message: 'message $index', time: '00:00 am');
          } else {
            return MessagePageIncomingMessageWidget(
                message: 'message $index', time: '00:00 pm');
          }
        },
      ),
    );
  }
}

class MessagePageTextFieldWidget extends StatelessWidget {
  const MessagePageTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Size(:width) = MediaQuery.sizeOf(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: width * 0.75,
          child: TextFormField(
            decoration: InputDecoration(
              suffix: Padding(
                padding:
                    EdgeInsets.only(left: width * 0.01, right: width * 0.01),
                child: SizedBox(
                  width: width * 0.15,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(width * 0.015),
                          child: InkWell(
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('camera')));
                            },
                            child: Icon(
                              Icons.camera_alt,
                              size: width * 0.05,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('file')));
                          },
                          child: Padding(
                            padding: EdgeInsets.all(width * 0.015),
                            child: Icon(
                              Icons.attach_file_sharp,
                              size: width * 0.05,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
              filled: true,
              fillColor: Colors.black,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(width * 0.1),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.all(
                  Radius.circular(width * 0.1),
                ),
              ),
              hintText: '  write a message ...',
            ),
          ),
        ),
        SizedBox(width: width * 0.05),
        GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('message sent')));
          },
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(width * 0.1),
            ),
            child: Padding(
              padding: EdgeInsets.all(width * 0.035),
              child: const Icon(Icons.send),
            ),
          ),
        ),
      ],
    );
  }
}

class MessagePageOutgoingMessageWidget extends StatelessWidget {
  const MessagePageOutgoingMessageWidget({
    super.key,
    required this.message,
    required this.time,
  });
  final String message;
  final String time;
  @override
  Widget build(BuildContext context) {
    final Size(:width) = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.all(width * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
              width: width * 0.1,
              child: CircleAvatar(
                radius: width * 0.1,
                backgroundColor: Colors.blueAccent,
              )),
          SizedBox(width: width * 0.03),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(width * 0.02)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.white,
                        blurRadius: width * 0.01,
                        offset: Offset(width * 0.004, width * 0.004),
                        spreadRadius: width * 0.001)
                  ],
                  color: Colors.blue,
                ),
                child: Padding(
                  padding: EdgeInsets.all(width * 0.03),
                  child: Text(message),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(width * 0.01),
                child: Text(
                  time,
                  style: TextStyle(fontSize: width * 0.03),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class MessagePageIncomingMessageWidget extends StatelessWidget {
  const MessagePageIncomingMessageWidget({
    super.key,
    required this.message,
    required this.time,
  });
  final String message;
  final String time;
  @override
  Widget build(BuildContext context) {
    final Size(:width) = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.all(width * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(width * 0.02)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.white,
                        blurRadius: width * 0.01,
                        offset: Offset(width * 0.004, width * 0.004),
                        spreadRadius: width * 0.001)
                  ],
                  color: Colors.purpleAccent,
                ),
                child: Padding(
                  padding: EdgeInsets.all(width * 0.03),
                  child: Text(message),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(width * 0.01),
                child: Text(
                  time,
                  style: TextStyle(fontSize: width * 0.03),
                ),
              )
            ],
          ),
          SizedBox(width: width * 0.03),
          SizedBox(
              width: width * 0.1,
              child: CircleAvatar(
                radius: width * 0.1,
                backgroundColor: Colors.purpleAccent,
              )),
        ],
      ),
    );
  }
}
