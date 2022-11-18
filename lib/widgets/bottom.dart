// this is the button of the home screen
import 'package:lovester/screens/country_filter.dart';
import 'package:flutter/material.dart';
class bottom extends StatefulWidget {
  const bottom({Key? key}) : super(key: key);

  @override
  State<bottom> createState() => _bottomState();
}

class _bottomState extends State<bottom> {
  @override
  Widget build(BuildContext context) {
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
            Navigator.pushReplacementNamed(context, '/');
            setState(() {
            });
          },
          icon: Icon(
            Icons.cancel,
            color: Colors.red,

          ),
        ),


      ],

    );
  }
}
