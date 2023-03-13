import 'package:emotion_analysis/screens/welcome.dart';
import 'package:emotion_analysis/widgets/photos_widget.dart';
import 'package:emotion_analysis/widgets/videos_widget.dart';
import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  static const route = '/results';
  final upperTab = const TabBar(tabs: <Tab>[
    Tab(child: Text('videos',style: TextStyle(fontSize: 18),)),
    Tab(child: Text('pictures',style: TextStyle(fontSize: 18),)),
   
  ]);
  @override
  Widget build(BuildContext context) {
    return 
    DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: upperTab,
             title: const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Suggestions',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
            actions: [
              IconButton(
                onPressed: ()
                  {  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                      Welcome()),(Route<dynamic> route) => false);}, icon: Icon(Icons.logout))],    
        ),
        body: TabBarView(
          children: [
           VideosWidget(),
           PictureWidget(),
          ],
        ),
      ),
    );
   
  }
}
