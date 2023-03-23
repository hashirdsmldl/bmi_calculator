import 'package:flutter/material.dart';

class Age extends StatefulWidget {
  final List<double> ages;
  final double age;
  final void Function(double) onChanged;

  const Age({super.key, required this.ages,required this.age, required this.onChanged});
  @override
  State<Age> createState() => _AgeState();
}

class _AgeState extends State<Age> {
  int _selectedIndex = -1;
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
                        AssetImage("assets/images/age.png"),
                        color: Colors.purple,
                      ),
                    ),
                    Text("Age Nos")
                  ],
                ),
                SizedBox(
                  height: 60,
                  width: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.ages.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          children: [
                             InkWell(
                               onTap: () {
                                 setState(() {
                                   _selectedIndex = index;
                                 });

                             widget.onChanged(widget.ages[index]);
                              },child:  CircleAvatar(
                               backgroundColor: _selectedIndex == index ? Colors.blueAccent : Colors.white,
                                child:  Text(
                                  widget.ages[index].toString(),
                                  style:
                                  TextStyle(fontWeight: FontWeight.bold,color: _selectedIndex == index ? Colors.white : Colors.blueAccent,),
                                ),
                              ),
                            ),

                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            )),
      ),
    );
  }
}
