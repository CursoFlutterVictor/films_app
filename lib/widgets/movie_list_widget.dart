import 'package:flutter/material.dart';

class MovieListWidget extends StatelessWidget {
  const MovieListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 10),
      height: 400,
      width: double.infinity,
      child: Column(
        children: [
          Flexible(
              flex: 1,
              child: Container(
                height: double.infinity,
                // color: Colors.red,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "RECOMMENDED FOR YOU",
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(onPressed: null, child: Text("Show More"))
                    ]),
              )),
          Flexible(flex: 6, child: Container(color: Colors.green)),
          Flexible(flex: 1, child: Container(color: Colors.white))
        ],
      ),
    );
  }
}
