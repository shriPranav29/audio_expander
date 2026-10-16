import 'package:audio_expander/components/rotary_knob.dart';
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           CenterControllerUnit() , 
           RotaryKnob()  
        ],
      )
    );
  }

  Widget CenterControllerUnit() {
    return SizedBox(
            height: 350,
            width: 350,
            child: Stack(
              children: [
                Center(
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.black , 
                      shape: BoxShape.circle
                    ),
                    
                  ),
                ), 
            
                Center(
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.deepOrange , 
                        shape: BoxShape.circle
                      ),
                    ),
                  )
              ],
            ),
      );
  }
}