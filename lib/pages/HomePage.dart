import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dummy_data.dart'; 
import 'BankSampahPage.dart';



class HomePage extends StatelessWidget {
  final String username;

  HomePage({Key? key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.lightBlue[50]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Selamat Pagi, $username!",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Yuk, Buat Perubahan untuk lingkungan!",
                    style: TextStyle(fontSize: 21),
                  ),
                ],
              ),
            ),
            
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BankSampahPage()),
                );
              },
              child: Card(
                margin: EdgeInsets.all(16.0),
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Icon(Icons.info_outline, size: 40, color: Colors.blueAccent),
                      SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          "Apa itu Bank Sampah Keliling?",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: scheduleList.length,
                itemBuilder: (BuildContext context, int index) {
                  final schedule = scheduleList[index];
                  return ScheduleCard(schedule: schedule);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blueAccent,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Logout"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class ScheduleCard extends StatelessWidget {
  final Schedule schedule;

  ScheduleCard({required this.schedule});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.network(
              schedule.imageUrl,  // Change to use the imageUrl from the Schedule class
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              schedule.wasteBankName, 
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              "Area: ${schedule.coverageArea}\nTanggal: ${schedule.implementationDate}\nWaktu: ${schedule.startTime} - ${schedule.endTime}",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}


void main() {
  runApp(MaterialApp(
    home: HomePage(username: "User"),
  ));
}
