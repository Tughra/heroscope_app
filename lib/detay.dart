import 'dart:ui';
import 'package:burc_rehberi_uygulamasi/model/model.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class BurcDetay extends StatefulWidget {
  BurcModel secilenBurc;

  BurcDetay({required this.secilenBurc});

  @override
  _BurcDetayState createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  late PaletteGenerator pcolor;

  @override
  void generate() {
    Future<PaletteGenerator> paletteGenerator =
        PaletteGenerator.fromImageProvider(
      AssetImage("images/" + widget.secilenBurc.buyukResim),
    );
    paletteGenerator.then((value) {
      pcolor = value;
    });
  }

  void initState() {
    generate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black45,
        child: Builder(
          builder: (BuildContext context) {
            return SafeArea(
              child: CustomScrollView(
                //primary:false,
                slivers: <Widget>[
                  SliverAppBar(
                    expandedHeight: 200,

                    floating: true,
                    //title:Text(widget.secilenBurc.burcAdi),
                    flexibleSpace: FlexibleSpaceBar(
                        //title: Text(widget.secilenBurc.burcAdi),
                        background: Image.asset(
                      "images/" + widget.secilenBurc.buyukResim,
                      fit: BoxFit.fill,
                    )),
                  ),
                  SliverToBoxAdapter(
                    child: Center(
                      child: Card(
                        color: Colors.transparent,
                        child: ListTile(
                          onTap: () {
                            Scaffold.of(context).showBottomSheet((context) {
                              return Material(
                                type: MaterialType.card,
                                color: pcolor.dominantColor?.color ??
                                    Colors.indigoAccent,
                                child: Row(children: [
                                  Expanded(
                                    child: Card(
                                      color: pcolor.mutedColor?.color ??
                                          Colors.teal,
                                      margin: EdgeInsets.all(5),
                                      child: Container(
                                        alignment: Alignment.center,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                1.5,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SingleChildScrollView(
                                              child: Text(
                                            widget.secilenBurc.burcOzellikleri,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800),
                                          )),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.redAccent),
                                          child: Icon(
                                            Icons.arrow_downward_rounded,
                                            color: Colors.black,
                                          )),
                                    ),
                                  )
                                ]),
                              );
                            });
                          },
                          title: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Hero(
                                    tag: widget.secilenBurc.burcAdi,
                                    child: SizedBox(
                                        width: 60,
                                        child: Image.asset("images/" +
                                            widget.secilenBurc.kucukResim))),
                                Text("Detaylar")
                              ]),
                        ),
                        elevation: 8,
                        shadowColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
