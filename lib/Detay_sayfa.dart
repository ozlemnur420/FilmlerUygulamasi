import 'package:filmler_uygulamasi/Filmler.dart';
import 'package:flutter/material.dart';

class Detay_sayfa extends StatefulWidget {

  Filmler film;

  Detay_sayfa({required this.film});

  @override
  State<Detay_sayfa> createState() => _Detay_sayfaState();
}

class _Detay_sayfaState extends State<Detay_sayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.film.film_ad),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
             Image.asset("resimler/${widget.film.film_resim}"),
            Text(widget.film.film_yil.toString(),style: TextStyle(color: Colors.blueAccent,fontSize: 30),),
            Text(widget.film.yonetmen.yonetmen_ad,style: TextStyle(color: Colors.blue,fontSize: 30),),
          ],
        ),
      ),

    );
  }
}
