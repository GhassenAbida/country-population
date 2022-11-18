// this is the appBar of the hoem screen
// populations will get you to the home page
// the heart icon will take you to favories
import 'package:flutter/material.dart';
class appBar extends StatefulWidget {
  const appBar({Key? key}) : super(key: key);

  @override
  State<appBar> createState() => _appBarState();
}

class _appBarState extends State<appBar> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    var height = size.height;
    var width = size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextButton(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(fontSize: 21),
            backgroundColor: Colors.white,
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/');
            setState(() {
            });
          },
          child: const Text.rich(
            TextSpan(
              // default text style
              children: <TextSpan>[
                TextSpan(text: ' POPULATIONS\n',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
                TextSpan(text: 'APP',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 1.2 * width / 3,
          height: height / 12,
        ),
        IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/F');
            setState(() {
            });
          },
          icon: const Icon(
            Icons.favorite_outlined,
            color: Colors.black,

          ),
        )


      ],);
  }
}