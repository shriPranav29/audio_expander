import 'package:flutter/material.dart';

class PlayerScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  late double sHeight ; 
  late double sWidth ; 
  @override
  Widget build(BuildContext context) {
    sHeight = MediaQuery.of(context).size.height ; 
    sWidth = MediaQuery.of(context).size.width ; 
    return Container(
      height: sHeight ,
      width: sWidth ,
      color: Colors.deepOrange,
    );
  }
}