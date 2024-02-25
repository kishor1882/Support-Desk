import 'package:flutter/material.dart';

import '../../api/api_data.dart';
import '../../api/api_user_data.dart';
import '../dialog/completed_dialog.dart';
import '../dialog/inprogress_dialog.dart';
import '../dialog/open_dialog.dart';
import '../dialog/rejected_dialog.dart';
import '../dialog/user_dialog.dart';

class user_show_ticket extends StatefulWidget {
  const user_show_ticket({Key? key}) : super(key: key);

  @override
  _user_show_ticketState createState() => _user_show_ticketState();
}

class InProgressContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: getUserInprogressData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                final item = snapshot.data![index];
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${item["button"]}'),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: const StadiumBorder()),
                              child: const Text(
                                'View',
                                style: TextStyle(fontSize: 11),
                              ),
                              onPressed: () {
                                user_dialog(context, index, 'Hello', item);
                              }),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class OpenContent extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: getUserOpenData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                final item = snapshot.data![index];
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${item["button"]}'),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: const StadiumBorder()),
                              child: const Text(
                                'View',
                                style: TextStyle(fontSize: 11),
                              ),
                              onPressed: () {
                                user_dialog(context, index, 'Hello', item);
                              }),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class _user_show_ticketState extends State<user_show_ticket> {
  String selectedTab = 'Open'; // Default selected tab

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[100],
        title: Text(selectedTab),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildTab('Open'),
                buildTab('Inprogress'),
                buildTab('Rejected'),
                buildTab('Completed'),
              ],
            ),
          ),
          Expanded(
            child: getContentForTab(selectedTab),
          ),
        ],
      ),
    );
  }

  Widget buildTab(String tabText) {
    return GestureDetector(
      onTap: () {
        // Handle tab selection
        setState(() {
          selectedTab = tabText;
        });
      },
      child: Container(
        padding: EdgeInsets.all(12.0),
        child: Text(
          tabText,
          style: TextStyle(
            color: selectedTab == tabText ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget getContentForTab(String tab) {
    if (tab == 'Open') {
      return OpenContent();
    } else if (tab == 'Inprogress') {
      return InProgressContent();
    } else if (tab == 'Rejected') {
      return RejectedContent();
    } else if (tab == 'Completed') {
      return CompletedContent();
    } else {
      return Center(
        child: Text('Content for $tab'),
      );
    }
  }
}

class RejectedContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: getUserRejectedData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                final item = snapshot.data![index];
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${item["button"]}'),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: const StadiumBorder()),
                              child: const Text(
                                'View',
                                style: TextStyle(fontSize: 11),
                              ),
                              onPressed: () {
                                user_dialog(context, index, 'Hello', item);
                              }),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class CompletedContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: getUserCompletedData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                final item = snapshot.data![index];
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${item["button"]}'),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: const StadiumBorder()),
                              child: const Text(
                                'View',
                                style: TextStyle(fontSize: 11),
                              ),
                              onPressed: () {
                                user_dialog(context, index, 'Hello', item);
                              }),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
