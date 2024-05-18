import 'package:flutter/material.dart';
import 'package:to_do/dialog_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool Personal = true, College = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent.shade400,
        onPressed: () {
          openbox();
        },
        child: Icon(
          Icons.add,
          size: 40,
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 30, top: 130),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.grey,
          Colors.white,
          Colors.grey,
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                "Salle,",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            SizedBox(height: 10),
            Container(
              child: Text(
                "BOO BOO",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            SizedBox(height: 10),
            Container(
              child: Text(
                "Jaldi sai Kam kar le Bhai...!!",
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Personal
                    ? Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.greenAccent,
                          ),
                          child: Text(
                            'Personal',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          Personal = true;
                          College = false;
                          setState(() {});
                        },
                        child: Text(
                          "Personal",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                College
                    ? Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.greenAccent,
                          ),
                          child: Text(
                            'College',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          Personal = false;
                          College = true;
                          setState(() {});
                        },
                        child: Text(
                          "College",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      )
              ],
            ),
          ],
        ),
      ),
    );
  }
  openbox(){
  return showDialog(
    context: context,
    builder: (context)=>AlertDialog(
      content: Container(
        child: Column(
          children: [Row(
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Icon(Icons.cancel),
                 ),

                 SizedBox(height: 60),

                Text("Add ToDo task~",
                style: TextStyle(
                  color: Colors.greenAccent.shade400
                ),)
                ],
              ),

               SizedBox(height: 60),
               Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: Colors.black,


                ),
                child: TextField(),
              )
          ],
        ),
      ),
    ));
}
}
