import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class Weight extends StatefulWidget {
final double weight;
final ValueChanged<dynamic> onChanged;
  const Weight({Key? key, required this.weight, required this.onChanged}) : super(key: key);

  @override
  State<Weight> createState() => _WeightState();
}

class _WeightState extends State<Weight> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 120,
        child: Card(
            elevation: 5,
            color: const Color(0xFF202036),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: ImageIcon(
                        size: 30,
                        AssetImage("assets/images/weight.png"),
                        color: Colors.purple,
                      ),
                    ),
                    Text("Weight Kg")
                  ],
                ),
                SizedBox(
                  width: 250,
                  child: SfSlider(
                    min: 40,
                    max: 100,

                    activeColor: Colors.blueAccent,
                    inactiveColor: Colors.white,
                    value: widget.weight.round(),
                    interval: 20,
                    showTicks: true,
                    showLabels: true,
                    enableTooltip: true,
                    minorTicksPerInterval: 1,
                    onChanged: widget.onChanged,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
