import 'package:flutter/material.dart';

import '../services/api.dart';

class CreateApi extends StatefulWidget {
  const CreateApi({Key? key}) : super(key: key);

  @override
  State<CreateApi> createState() => _CreateApiState();
}

class _CreateApiState extends State<CreateApi> {

  var nameController = TextEditingController();
  var priceController = TextEditingController();
  var detailsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: AppBar(
            title: const Text("C R E A T E"),
            backgroundColor: Colors.lightGreenAccent,
          ),
          body:  Center(
            child: SizedBox(
              width: 300,
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const Text("Product:"),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            hintText: "Name of the product",
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("Price:"),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: priceController,
                          decoration: const InputDecoration(
                            hintText: "Price of the product",
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("Description:"),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: detailsController,
                          decoration: const InputDecoration(
                            hintText: "details of the product",
                          ),
                        ),
                      ),
                    ],
                  ),

                  const  SizedBox(height: 30,),

                  ElevatedButton(onPressed: (){
                    var data ={
                      "pname":nameController.text,
                      "pprice":priceController.text,
                      "pdesc":detailsController.text
                    };

                    API.addProduct(data);
                    } , child: const Text("Submit"))
                ],
              ),
            ),
          ),

        );



  }
}
