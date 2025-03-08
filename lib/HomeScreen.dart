import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isPersonal = true;
  bool suggest = false;
  TextEditingController todocontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent.shade400,
        onPressed: _openDialog,
        child: const Icon(Icons.add, size: 40),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 30, top: 130),
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(31, 22, 227, 28),
              Colors.white,
              Color.fromARGB(31, 73, 210, 77),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              "BHAII..",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "U can If u think u can..!!",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: Colors.black54),
            ),
            const SizedBox(height: 50),
            _buildToggleButtons(),
            const SizedBox(height: 50),
            Row(
              children: [
                Checkbox(
                  activeColor: Colors.black,
                  value: suggest,
                  onChanged: (newValue) {
                    setState(() {
                      suggest = newValue!;
                    });
                  },
                ),
                const Text("Your text here"),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildToggleButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildToggleButton("Personal", isPersonal, () {
          setState(() => isPersonal = true);
        }),
        _buildToggleButton("College", !isPersonal, () {
          setState(() => isPersonal = false);
        }),
        
      ],
    );
  }

  Widget _buildToggleButton(String text, bool isActive, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: isActive
          ? Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.greenAccent,
                ),
                child: Text(
                  text,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            )
          : Text(text, style: const TextStyle(fontSize: 20)),
    );
  }

   _openDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Add To-Do task~",
                  style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.cancel),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              controller: todocontroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: "Enter the Task",
              ),
            ),
            Container(
              child: Text("add",
             style:TextStyle(
              color: Colors.black,
             )),
            )
          ],
        ),
      ),
    );
  }
}
