import 'package:filmler_uygulamasi/Detay_sayfa.dart';
import 'package:filmler_uygulamasi/Filmler.dart';
import 'package:filmler_uygulamasi/Filmlerdao.dart';
import 'package:filmler_uygulamasi/Kategoriler.dart';
import 'package:filmler_uygulamasi/Yonetmenler.dart';
import 'package:flutter/material.dart';

class Filmler_sayfa extends StatefulWidget {

  Kategoriler kategori;

  Filmler_sayfa({required this.kategori});

  @override
  State<Filmler_sayfa> createState() => _Filmler_sayfaState();
}

class _Filmler_sayfaState extends State<Filmler_sayfa> {

  Future<List<Filmler>>tum_filmleri_goster(int kategori_id) async{

    var filmler_listesi= await Filmlerdao().tum_filmler_by_kategori_id(kategori_id);


    return filmler_listesi;

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Filmler: ${widget.kategori.kategori_ad}"),
      ),
      body: FutureBuilder<List<Filmler>>(
        future: tum_filmleri_goster(widget.kategori.kategori_id),
        builder: (context,snapshot){
          if (snapshot.hasData){
            var filmler_listesi=snapshot.data;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2/3.5,
              ),

              itemCount: filmler_listesi !.length,
              itemBuilder: (context,indeks){
                var film=filmler_listesi[indeks];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Detay_sayfa(film: film,)));
                  },
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("resimler/${film.film_resim}"),
                        ),
                        Text(film.film_ad,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                );
              },
            );

          }

          else{
            return Center();
          }

        },
      ),

    );
  }
}
