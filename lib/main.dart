
import 'package:filmler_uygulamasi/Filmler_sayfa.dart';
import 'package:filmler_uygulamasi/Kategoriler.dart';
import 'package:filmler_uygulamasi/Kategorilerdao.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: Anasayfa(title: ''),
    );
  }
}

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key, required this.title});

  final String title;

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  Future<List<Kategoriler>>tum_kategorileri_goster() async{

    var kategori_listesi= await Kategorilerdao().tum_kategoriler();

    return kategori_listesi;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("KATEGORİLER"),
      ),
      body: FutureBuilder<List<Kategoriler>>(
        future: tum_kategorileri_goster(),
        builder: (context,snapshot){
          if (snapshot.hasData){

            var kategori_listesi=snapshot.data;
            return ListView.builder(
              itemCount: kategori_listesi !.length,
              itemBuilder: (context,indeks){
                var kategori=kategori_listesi[indeks];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Filmler_sayfa(kategori: kategori,)));
                  },
                  child: Card(
                    color: Colors.blueGrey,
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(kategori.kategori_ad,style: TextStyle(color:Colors.black,fontSize: 15),),

                        ],

                      ),
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
