import 'package:flutter/material.dart';

class Gender extends StatefulWidget {
  final bool maleChecked;
  final bool femaleChecked;
   final ValueChanged<bool?> onChangedMale;
  final ValueChanged<bool?> onChangedFemale;
   const Gender({super.key,
     required this.maleChecked,
     required this.femaleChecked,
     required this.onChangedMale,
     required this.onChangedFemale,

   });

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

      children: [

        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 150,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFF202036),


                  border: Border.all(color: Colors.purple,)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(Icons.female),
                  const Text("Female",style: TextStyle(fontSize: 20),),
                  Checkbox(value:widget.femaleChecked , onChanged: widget.onChangedFemale,),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 150,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFF202036),
                border: Border.all(color: Colors.purple,),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(Icons.male),
                  const Text("Male",style: TextStyle(fontSize: 20),),
                  Checkbox(value:widget.maleChecked , onChanged: widget.onChangedMale,
                 ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
