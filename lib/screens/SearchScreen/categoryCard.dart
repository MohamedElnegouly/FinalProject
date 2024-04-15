import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class category extends StatelessWidget {
  const category({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            Container(
              alignment: Alignment.center,
              child: Image.network('https://images.unsplash.com/photo-1709577938593-1fc3991d3c93?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                fit: BoxFit.fitWidth,
                height: 155,
                width: 345,
              ),
            ),
             Positioned(
              height: 50,
                right: 45,
                child:IconButton(
                   icon: const Icon(Icons.favorite_border,
                   size: 27,),
                  color: Colors.blueAccent,
                  onPressed: (){
                     //Navigator.push(context, route),
                  },
                ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        const Padding(
          padding: EdgeInsets.only(
            left: 22,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Solaria Cafe and workspace',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),

              ),
            ],
          ),

        ),
        const SizedBox(
          height: 2,
        ),
         const Padding(
          padding: EdgeInsets.only(
              left: 22,
        ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.location_on),
              Text('kuala lumpur ,malaysia',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                  ),
                ],
              ),

        ),
        const SizedBox(
          height: 5,
        ),
        const Padding(
          padding: EdgeInsets.only(
            left: 22,
          ),
          child: Row(
            children: [
              Icon(
                Icons.star,
              ),
              Icon(
                Icons.star,
              ),
              Icon(
                Icons.star,
              ),
              Icon(
                Icons.star,
              ),
              Icon(
                Icons.star,
              ),

            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
         const Padding(
          padding: EdgeInsets.only(
            left: 22,
          ),
          child: Row(
            children: [
              Text('\$',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              Text('20',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Text('/Hour',
              ),
              SizedBox(
                width: 240,
              ),
              Text('\$\$\$',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,

                ),
              ),

            ],
          ),
        ),

      ],
    );
  }


}
