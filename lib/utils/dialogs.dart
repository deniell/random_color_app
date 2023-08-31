import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

///
/// Display exit dialog, when user tap back button
///
Future<void> exitDialog({
  required BuildContext context,
}) async
{
  // buttons font style
  final TextStyle buttonsStyle =
    GoogleFonts.aBeeZee(fontWeight: FontWeight.w600);

  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context)
    {
      return AlertDialog(
        title: Text(
          "Close the app?",
          style: GoogleFonts.aBeeZee(fontSize: 20),
        ),
        actions: <Widget>[
          TextButton(
            child: Text("No", style: buttonsStyle),
            onPressed: ()
            {
              // close dialog box
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text("Yes", style: buttonsStyle),
            onPressed: ()
            {
              // close dialog box
              Navigator.of(context).pop();
              // close the app
              exit(0);
            },
          ),
        ],
      );
    },
  );
}
