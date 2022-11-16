import 'package:lovester/screens/countryFilter.dart';
import 'package:flutter/material.dart';

  Widget bottom(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    var height = size.height;
    var width = size.width;
    return Row(
      children: [
        IconButton(
          onPressed: () {
            showDialog(context: context,
              builder: (BuildContext context) =>
              const AlertDialog(
                content: Country(),
              ),
            );
          },
          icon: Icon(
            Icons.filter_alt_off_rounded,
            color: Colors.black,


          ),
        ),
        SizedBox(
          width: width / 23,
        ),
        const Text('Filter by country', style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
        ),
        SizedBox(
          width: 1.1 * width / 4,
        ),
        IconButton(
          onPressed: () {

          },
          icon: Icon(
            Icons.cancel,
            color: Colors.red,



          ),
        ),


      ],

    );
  }

