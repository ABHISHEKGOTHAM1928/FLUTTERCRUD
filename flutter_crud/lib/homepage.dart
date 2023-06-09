import 'package:flutter/material.dart';

import 'Pages/create.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("C R U D"),
          backgroundColor: Colors.amber,
        ),

        body:  Center(
          child: Column(
            children: [
              const SizedBox(height: 50,),
              ElevatedButton(onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> const CreateApi()));
                }, child: const Text("CREATE")),
              ElevatedButton(onPressed: (){}, child: const Text("READ")),
              ElevatedButton(onPressed: (){}, child: const Text("UPDATE")),
              ElevatedButton(onPressed: (){}, child: const Text("DELETE")),

            ],
          ),
        ),
      );

  }
}
