import 'dart:math';

import 'package:burc_rehberi_uygulamasi/model/model.dart';
import 'package:burc_rehberi_uygulamasi/utils/strings.dart';
import 'package:flutter/material.dart';

import 'detay.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<BurcModel> filtered = [];
  List<BurcModel> tumBurclar = listeDoldur();

  @override
  void initState() {
    filtered = tumBurclar;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red.shade400,
          title: Text(Strings.APP_NAME),
          bottom: PreferredSize(
            preferredSize: Size(50, 50),
            child: Container(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 10),
                    child: Icon(Icons.search),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 8),
                    width: 200,
                    height: 30,
                    child: TextField(
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(8),
                          isDense: true,
                          hintText: "Burc ara...",
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder()),
                      onChanged: (value) {
                        setState(() {
                          filtered = tumBurclar
                              .where((element) => (element.burcAdi
                                      .toLowerCase()
                                      .contains(value.toLowerCase()) ||
                                  element.burcTarihi
                                      .toLowerCase()
                                      .contains(value.toLowerCase())))
                              .toList();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        body: Container(
          color: Colors.black54,
          child: ListView.separated(
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    tileColor: Colors.yellow.shade100,
                    title: Text(filtered[index].burcAdi),
                    subtitle: Text(filtered[index].burcTarihi),
                    leading: Hero(
                        tag: filtered[index].burcAdi,
                        child: CircleAvatar(
                          radius: size / 18,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage(
                              "images/" + filtered[index].kucukResim),
                        )),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  BurcDetay(secilenBurc: filtered[index])));
                    },
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  height: 2,
                );
              },
              itemCount: filtered.length),
        ));
  }

  static List<BurcModel> listeDoldur() {
    List<BurcModel> geriyeDonecekListe = [];
    for (int i = 0; i < Strings.BURC_ADLARI.length; i++) {
      String kucukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + "${i + 1}" + ".png";
      String buyukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + "_buyuk" + "${i + 1}" + ".png";
      BurcModel eklenecekBurc = BurcModel(
          Strings.BURC_ADLARI[i],
          Strings.BURC_TARIHLERI[i],
          Strings.BURC_GENEL_OZELLIKLERI[i],
          kucukResim,
          buyukResim);
      geriyeDonecekListe.add(eklenecekBurc);
    }
    //debugPrint(geriyeDonecekListe.toString());
    return geriyeDonecekListe;
  }
}

Color renkOlusturucu() {
  List<String> clors = [
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "A",
    "B",
    "C",
    "D",
    "E",
    "F"
  ];
  String generateColor = "0X";
  for (int i = 0; i < 8; i++) {
    int a = Random().nextInt(clors.length - 1);
    generateColor += clors[a];
  }
  return Color(int.parse(generateColor));
}
