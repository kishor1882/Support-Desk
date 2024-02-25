import 'package:flutter/material.dart';
import 'package:dsrt/api/api_upload.dart';

import '../../api/api_delete.dart';

Future<void> open_dialog(
    BuildContext context, int index, String message, final item) async {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      int Index = (index + 1);
      return AlertDialog(
        title: const Text('TICKET INFORMATION'),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              // Display your Firestore data here
              Table(
                border: TableBorder.all(),
                children: [
                  TableRow(
                    children: [
                      TableCell(
                        child: Container(
                            padding: EdgeInsets.all(15),
                            child: Text('Description',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                      ),
                      TableCell(
                        child: Container(
                            padding: EdgeInsets.all(15),
                            child: Text('Details',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Container(
                            padding: EdgeInsets.all(15),
                            child: Text('Ticket Description',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                      ),
                      TableCell(
                        child: Container(
                            padding: EdgeInsets.all(15),
                            child: Text('${item["description"]}')),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Container(
                            padding: EdgeInsets.all(15),
                            child: Text('Ticket Title',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                      ),
                      TableCell(
                        child: Container(
                            padding: EdgeInsets.all(15),
                            child: Text('${item["button"]}')),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Container(
                            padding: EdgeInsets.all(15),
                            child: Text('Raised On',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                      ),
                      TableCell(
                        child: Container(
                            padding: EdgeInsets.all(15), child: Text('On')),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Container(
                            padding: EdgeInsets.all(15),
                            child: Text('Raiser',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                      ),
                      TableCell(
                        child: Container(
                            padding: EdgeInsets.all(15),
                            child: Text('${item["raiser"]}')),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Container(
                            padding: EdgeInsets.all(15),
                            child: Text('Raiser Department',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                      ),
                      TableCell(
                        child: Container(
                            padding: EdgeInsets.all(15),
                            child: Text('${item["department"]}')),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Container(
                            padding: EdgeInsets.all(15),
                            child: Text('Raiser Designation',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                      ),
                      TableCell(
                        child: Container(
                            padding: EdgeInsets.all(15),
                            child: Text('${item["designation"]}')),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Container(
                            padding: EdgeInsets.all(15),
                            child: Text('Ticket Status',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                      ),
                      TableCell(
                        child: Container(
                            padding: EdgeInsets.all(15),
                            child: Text('Ticket Open')),
                      ),
                    ],
                  ),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                ElevatedButton(
                  onPressed: () {
                    print("hello");
                    print(item["user_id"]);
                    InprogressData(
                        item["user_id"],
                        item["button"],
                        item["raiser"],
                        item["department"],
                        item["designation"],
                        item["description"]);
                    opendelete(item["id"]);
                    Navigator.of(context).pop();
                  },
                  child: Text('Accepted'),
                ),
                ElevatedButton(
                  onPressed: () {
                    RejectedData(
                        item["user_id"],
                        item["button"],
                        item["raiser"],
                        item["department"],
                        item["designation"],
                        item["description"]);
                    opendelete(item["id"]);
                    Navigator.of(context).pop();
                  },
                  child: Text('Rejected'),
                ),
              ])
            ],
          ),
        ),
      );
    },
  );
}
