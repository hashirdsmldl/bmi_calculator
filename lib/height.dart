import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';



class Height extends StatefulWidget {
 final double height;
 final ValueChanged<dynamic> onChanged;
   const Height({super.key, required this.height,  required this.onChanged});

  @override
  State<Height> createState() => _HeightState();
}

class _HeightState extends State<Height> {
  @override

  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 120,
        child: Card(
            elevation: 5,
            color: const Color(0xFF202036),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:   [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white
                      ,
                      child: ImageIcon(

                        size: 30,
                        AssetImage("assets/images/height.png"),
                        color: Colors.purple,
                      ),

                    ),
                    Text("Height-Cm")
                  ],
                ),

                SizedBox(
                  width: 250,
                  child: SfSlider(
                    min: 140,
                    max: 230,

                    activeColor: Colors.blueAccent,
                    inactiveColor: Colors.white,
                    value: widget.height.round(),
                    interval: 30,
                    showTicks: true,
                    showLabels: true,
                    enableTooltip: true,
                    minorTicksPerInterval: 1,
                    onChanged: widget.onChanged,
                  ),
                )


              ],

            )
        ),
      ),
    );
  }
}
