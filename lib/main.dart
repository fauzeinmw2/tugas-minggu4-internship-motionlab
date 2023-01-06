import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget{
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {

  String? data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman 1"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Teks yang akan dikirim ke halaman 2 :", style: TextStyle(fontSize: 15),),
            Text("Fauzein Mulya Warman", textScaleFactor: 2),

            SizedBox(height: 20,),

            Container(
              child: ElevatedButton(
                  child: Text("Pindah Ke Halaman 2"),
                  onPressed: () async{
                    data = await Get.to(() => SecondPage(), arguments: 'Fauzein Mulya Warman');
                  setState((){});
                  }
              ),
            ),

            SizedBox(height: 20,),

            Text("Teks yang diterima dari halaman 2 :", style: TextStyle(fontSize: 15),),
            Text(data?? data.toString(), textScaleFactor: 2,),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget{
  String? arg = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman 2"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Teks yang akan dikirim ke halaman 1 :", style: TextStyle(fontSize: 15),),
            Text("Semangat Belajarnya!!!", textScaleFactor: 2),

            SizedBox(height: 20,),

            Container(
              child: ElevatedButton(
                  child: Text("Kembali Ke Halaman 1"),
                  onPressed: ()=> Get.back(result: 'Semangat Belajarnya!!!')
              ),
            ),

            SizedBox(height: 20,),

            Text("Teks yang diterima dari halaman 1 :", style: TextStyle(fontSize: 15),),
            Text(arg.toString(), textScaleFactor: 2),
          ],
        ),
      ),
    );
  }
}


