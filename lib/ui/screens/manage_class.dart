import 'package:flutter/material.dart';
class ManageClass extends StatefulWidget {
  const ManageClass({Key? key}) : super(key: key);

  @override
  State<ManageClass> createState() => _ManageClassState();
}

class _ManageClassState extends State<ManageClass> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 40,),
              Text('Select a class to take attendance',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.white,
              ),
              ),

              // list of class
            ],
          ),
        ),
      ),
    );
  }
}
