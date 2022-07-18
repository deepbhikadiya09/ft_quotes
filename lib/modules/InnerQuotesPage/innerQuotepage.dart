import 'dart:convert';
import 'dart:io';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:like_button/like_button.dart';
import 'package:path_provider/path_provider.dart';

import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import '../mainList.dart';
import '../thirdInnerScreen/thirdInnerScreen.dart';
class InnerInspiration extends StatefulWidget {
  String quoteTopic;
  int index;
 InnerInspiration({required this.index,required this.quoteTopic});
  @override
  State<InnerInspiration> createState() => _InnerInspirationState();
}

class _InnerInspirationState extends State<InnerInspiration> {
  ScreenshotController myscreenController = ScreenshotController();
  bool copy = false;
  bool share = false;
  List<Color> color=[
    Colors.black,
    Colors.indigo,
    Colors.blue,
    Colors.deepPurple,
    Colors.indigoAccent,
    Colors.blueGrey,
    Colors.brown,
    Colors.teal,
    Colors.orange.shade900,
    Colors.purple.shade800,
  ];
  List mainQuoteList=[];
  getdataInspiration() async {
    String res = await rootBundle.loadString("lib/assets/asset/quotes/inspiration/inspiration.json");
    if (widget.index == 0) {
      setState(() {
        mainQuoteList = jsonDecode(res);
      });
    }
  }
  getdatasuccess() async {
    String res = await rootBundle.loadString("lib/assets/asset/quotes/success/success.json");
    if (widget.index == 1) {
      setState(() {
        mainQuoteList = jsonDecode(res);
      });
    }
  }
  getdataTruth() async {
    String res = await rootBundle.loadString("lib/assets/asset/quotes/truth/truth.json");
    if (widget.index == 2) {
      setState(() {
        mainQuoteList = jsonDecode(res);
      });
    }
  }
  getdataBest() async {
    String res = await rootBundle.loadString("lib/assets/asset/quotes/best/best.json");
    if (widget.index == 3) {
      setState(() {
        mainQuoteList = jsonDecode(res);
      });
    }
  }
  getdataHappiness() async {
    String res = await rootBundle.loadString("lib/assets/asset/quotes/happiness/happiness.json");
    if (widget.index == 4) {
      setState(() {
        mainQuoteList = jsonDecode(res);
      });
    }
  }
  getdataGod() async {
    String res = await rootBundle.loadString("lib/assets/asset/quotes/god/god.json");
    if (widget.index == 5) {
      setState(() {
        mainQuoteList = jsonDecode(res);
      });
    }
  }
  getdataAwesome() async {
    String res = await rootBundle.loadString("lib/assets/asset/quotes/awesome/awesome.json");
    if (widget.index == 6) {
      setState(() {
        mainQuoteList = jsonDecode(res);
      });
    }
  }
  getdataCreative() async {
    String res = await rootBundle.loadString("lib/assets/asset/quotes/creative/creative.json");
    if (widget.index == 7) {
      setState(() {
        mainQuoteList = jsonDecode(res);
      });
    }
  }
  getdataFamily() async {
    String res = await rootBundle.loadString("lib/assets/asset/quotes/family/family.json");
    if (widget.index == 8) {
      setState(() {
        mainQuoteList = jsonDecode(res);
      });
    }
  }
  getdataForgiveness() async {
    String res = await rootBundle.loadString("lib/assets/asset/quotes/forgiveness/forgiveness.json");
    if (widget.index == 9) {
      setState(() {
        mainQuoteList = jsonDecode(res);
      });
    }
  }
  getdataFriend() async {
    String res = await rootBundle.loadString("lib/assets/asset/quotes/friends/friends.json");
    if (widget.index == 10) {
      setState(() {
        mainQuoteList = jsonDecode(res);
      });
    }
  }
  getdataNaughty() async {
    String res = await rootBundle.loadString("lib/assets/asset/quotes/naughty/naughty.json");
    if (widget.index == 11) {
      setState(() {
        mainQuoteList = jsonDecode(res);
      });
    }
  }
  getdataRelationship() async {
    String res = await rootBundle.loadString("lib/assets/asset/quotes/relationship/relationship.json");
    if (widget.index == 12) {
      setState(() {
        mainQuoteList = jsonDecode(res);
      });
    }
  }
  getdataThankyou() async {
    String res = await rootBundle.loadString("lib/assets/asset/quotes/thankyou/thankyou.json");
    if (widget.index == 13) {
      setState(() {
        mainQuoteList = jsonDecode(res);
      });
    }
  }
  getdataWeekend() async {
    String res = await rootBundle.loadString("lib/assets/asset/quotes/weekend/weekend.json");
    if (widget.index == 14) {
      setState(() {
        mainQuoteList = jsonDecode(res);
      });
    }
  }
  getdataLife() async {
    String res = await rootBundle.loadString("lib/assets/asset/quotes/life/life.json");
    if (widget.index == 15) {
      setState(() {
        mainQuoteList = jsonDecode(res);
      });
    }
  }
  @override
  void initState(){
    getdataInspiration();
    getdataAwesome();
    getdatasuccess();
    getdataTruth();
    getdataBest();
    getdataHappiness();
    getdataGod();
    getdataCreative();
    getdataFamily();
    getdataForgiveness();
    getdataFriend();
    getdataNaughty();
    getdataRelationship();
    getdataThankyou();
    getdataWeekend();
    getdataLife();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(mainQuote[widget.index],style: TextStyle(fontFamily: 'font',color: Colors.black),),
      ),
      body: ListView.builder(
        itemCount: mainQuoteList.length,
          itemBuilder: (context,index){
            return Card(
              elevation: 50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              margin: EdgeInsets.all(12),
              child: Column(
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return thirdInnerScreen(name: widget.quoteTopic,index: index, quote: mainQuoteList[index]["quote"],authorName: mainQuoteList[index]["author"],);
                      }));
                    },
                    child: Container(
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                          color: Colors.black,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text("“",
                                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 40),)),
                              Flexible(child:
                                 Container(child:
                                    Center(child:
                                       Text("${mainQuoteList[index]["quote"]}",textAlign: TextAlign.center,
                                         style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'font'),)))),
                              Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text("”",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 40))),
                              Align(
                                alignment: Alignment.topRight,
                                child: Text("- ""${mainQuoteList[index]["author"]}",textAlign: TextAlign.center,
                                  style: TextStyle(fontSize:15,color: Colors.white,fontFamily: 'font'),),
                              ),
                            ],
                          ),
                        )),
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                            LikeButton(
                              circleColor: CircleColor(start: Colors.red, end: Colors.red.shade400),
                              bubblesColor: BubblesColor(
                                dotPrimaryColor: Colors.red,
                                dotSecondaryColor: Colors.redAccent,
                              ),
                              likeBuilder: (bool isLiked) {
                                return Icon(
                                  Icons.favorite,
                                  color: isLiked ? Colors.red : Colors.black,
                                );
                              }
                            ),

                        Row(
                          children: [
                            IconButton(
                                onPressed: (){
                                  setState((){
                                    showCustomToast();
                                    FlutterClipboard.copy(mainQuoteList[index]["author"]).then((value) {});
                                    showCustomToast();
                                    copy=true;
                                  });
                                },
                                icon: Icon(Icons.file_copy_outlined)),
                            Text(copy?"Copied":"Copy",style: TextStyle(fontSize: 15,fontFamily: 'iconfont'),),

                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: (){

                                  setState((){
                                    setState((){
                                      _takeScreenshot();
                                      share=true;
                                    });
                                  });
                                },
                                icon: Icon(Icons.share,)),
                            Text("Share",style: TextStyle(fontSize: 15,fontFamily: 'iconfont'),),
                          ],
                        ),

                      ],
                    ),
                    // child: Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: [
                    //     GestureDetector(child: Icon(Icons.favorite_border,color: Colors.grey,)),
                    //     Text("Like",style: TextStyle(color: Colors.grey,fontSize: 15,fontFamily: 'iconfont'),),
                    //     GestureDetector(child: Icon(Icons.save_alt,color: Colors.grey,)),
                    //     Text("Save",style: TextStyle(color: Colors.grey,fontSize: 15,fontFamily: 'iconfont'),),
                    //     GestureDetector(child: Icon(Icons.file_copy_outlined,color: Colors.grey,)),
                    //     Text("Copy",style: TextStyle(color: Colors.grey,fontSize: 15,fontFamily: 'iconfont'),),
                    //     GestureDetector(child: Icon(Icons.share,color: Colors.grey,)),
                    //     Text("Share",style: TextStyle(color: Colors.grey,fontSize: 15,fontFamily: 'iconfont'),)
                    //   ],
                    // ),
                  )
                ],
              ),
            );
          }),
    );
  }
  void _takeScreenshot() async {
    await myscreenController
        .capture(delay: const Duration(milliseconds: 10))
        .then((image) async {
      if (image != null) {
        final directory = await getApplicationDocumentsDirectory();
        final imagePath = await File('${directory.path}/image.png').create();
        await imagePath.writeAsBytes(image);

        /// Share Plugin
        await Share.shareFiles([imagePath.path]);
      }
    });
  }
  showCustomToast() {
    Fluttertoast.showToast(
        timeInSecForIosWeb: 1,
        toastLength: Toast.LENGTH_SHORT,
        msg: 'Copied',
        backgroundColor: Colors.black54,
        gravity: ToastGravity.BOTTOM
    );
  }
}
