import 'package:flutter/material.dart';


class BankSampahPage extends StatefulWidget {
  @override
  _BankSampahPageState createState() => _BankSampahPageState();
}

class _BankSampahPageState extends State<BankSampahPage> {
  Future<String> loadAsset(BuildContext context) async {
    return await DefaultAssetBundle.of(context).loadString('images/paragraf.txt');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bank Sampah Keliling"),
      ),
      body: SingleChildScrollView( 
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image from assets
            Image.asset('images/header.png', height: 300),

            SizedBox(height: 16),

            Text(
              "Apa itu Bank Sampah Keliling?",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),


            FutureBuilder<String>(
              future: loadAsset(context),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(); 
                } else if (snapshot.hasError) {
                  return Text("Error loading text: ${snapshot.error}");
                } else {
                  return Text(
                    snapshot.data ?? '',
                    style: TextStyle(fontSize: 16),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
