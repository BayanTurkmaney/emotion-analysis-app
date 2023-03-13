import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'home.dart';

class Welcome extends StatelessWidget {
  static const route = '/welcome';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
         const SizedBox(height: 40),
        const  Text('Welcome to you at Stay Happy',
          textAlign: TextAlign.center,
           style: TextStyle(color: Color.fromARGB(255, 14, 202, 70), fontSize: 24,fontWeight: FontWeight.bold)),
        const  SizedBox(
            height: 50,
          ),
          Container(
            width: 300,
            height: 400,
            child:  SvgPicture.asset('assets/images/welcomee.svg'),
          ),
          const SizedBox(
            height: 100,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacementNamed(Home.route);
              },
              child: Container(
                margin: const EdgeInsets.all(5),
                width: 50,
                height: 50,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: const Color.fromARGB(255, 14, 202, 70)),
                child: const Icon(Icons.forward, color: Colors.white, size: 30),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
