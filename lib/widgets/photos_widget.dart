import 'package:flutter/material.dart';
class PictureWidget extends StatefulWidget {
  PictureWidget({Key? key}) : super(key: key);

  @override
  State<PictureWidget> createState() => _PictureWidgetState();
}

class _PictureWidgetState extends State<PictureWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child:ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: ((context, index) =>_singleVideoWidget() ),itemCount: 10,),
    );
  }
  Widget _singleVideoWidget(){
    return Container(width: 400,height: 100,padding: const EdgeInsets.only(left: 5,top: 5),
      child: Card(elevation: 3.0,
        child: Container(
          padding: const EdgeInsets.only(left: 10,top: 10),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10,),
              const Text('Picture Name',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
             const SizedBox(height: 15,),
              GestureDetector(
                onTap: (){},
                
                child:const Text('https://www.facebook.com/',overflow:TextOverflow.ellipsis,
                  style:TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.black),
                ),
              ),
            ],
          ),
        ),),);
  }
}
