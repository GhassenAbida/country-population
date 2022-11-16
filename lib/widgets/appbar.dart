
import 'package:flutter/material.dart';
  Widget appBar(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var  height = size.height;
    var  width = size.width;
    return      Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextButton(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(fontSize: 21),
            backgroundColor: Colors.white,
          ),
          onPressed: () {},
          child: const Text.rich(
            TextSpan(
              // default text style
              children: <TextSpan>[
                TextSpan(text: ' POPULATIONS\n', style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black)),
                TextSpan(text: 'APP', style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black)),
              ],
            ),
          ),
        ),
        SizedBox(
          width:1.2*width/3,
        ),
        IconButton(
          onPressed: (){},
          icon: Icon(
            Icons.favorite_outlined,
            color:Colors.black,


          ),
        )


   ],);
  }

