import 'dart:io';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:like_button/like_button.dart';
import 'package:path_provider/path_provider.dart';

import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
class thirdInnerScreen extends StatefulWidget {
  String quote;
  String authorName;
  String name;
  int index;
  thirdInnerScreen({required this.index,required this.quote,required this.authorName,required this.name});

  @override
  State<thirdInnerScreen> createState() => _thirdInnerScreenState();
}

class _thirdInnerScreenState extends State<thirdInnerScreen> {
  ScreenshotController screenController = ScreenshotController();
  bool copy = false;
  bool share = false;
  bool first = false;
  bool second = false;
  bool third = false;
  bool fourth = false;
  bool fifth = false;
  bool six = false;
  bool seven = false;
  bool eight = false;
  bool nine = false;
  bool ten = false;
  LinearGradient? colorofContainer;
  LinearGradient? c = LinearGradient(colors: [Colors.black,Colors.grey]);
  double value = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
       title: Text(widget.name,style: TextStyle(fontFamily: 'font',color: Colors.black),),
       // title: Text(mainQuote[widget.index],style: TextStyle(fontFamily: 'font',color: Colors.black),),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 50,left: 10,right: 10),
        child: Column(
          children: [
            Screenshot(
              controller: screenController,
              child: Container(
                height: 450,
                width: double.infinity,
                child: Stack(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: c
                          ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text("“",
                                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 40),)),
                          Expanded(child:
                          Container(child:
                          Center(child:
                          Text("${widget.quote}",textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white,fontSize: value,fontFamily: 'font'),)))),
                          Align(
                              alignment: Alignment.bottomRight,
                              child: Text("”",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 40))),
                          Align(
                            alignment: Alignment.topRight,
                            child: Text("- ""${widget.authorName}",textAlign: TextAlign.center,
                              style: TextStyle(fontSize:15,color: Colors.white,fontFamily: 'font'),),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
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
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: (){
                          setState((){
                            showCustomToast();
                            FlutterClipboard.copy(widget.quote).then((value) {});
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
            CupertinoButton(
                onPressed: (){
                  setState((){
                    changeBackground();
                  });
                },
                child: Text("Tap to Change Background",style: TextStyle(fontFamily: 'iconfont'),)),
            Container(
              width: 250,
              child: CupertinoSlider(
                  value: value,
                  min: 20,
                  max: 30,
                  thumbColor: Colors.black,
                  activeColor: Colors.black,
                  onChanged: (val){
                    setState((){
                      value=val;
                    });
                  }),
            ),
            Text("Change Font size",style: TextStyle(color: Colors.black,fontFamily: 'iconfont'),),
           ],
        ),
      ),
    );
  }
  void _takeScreenshot() async {
    await screenController
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
  changeBackground(){
    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Text("Choose Background",style: TextStyle(fontFamily: 'font')),
            content: Container(
              height: 200,
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                              onTap: (){
                                setState((){
                                  first=true;
                                  second=false;
                                  third = false;
                                  fourth = false;
                                  fifth = false;
                                  six = false;
                                  seven = false;
                                  eight = false;
                                  nine = false;
                                  colorofContainer=LinearGradient(colors: [Colors.black,Colors.grey]);
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  gradient:  LinearGradient(colors: [Colors.black,Colors.grey]),
                                border: first?Border.all(color: Colors.blue,width: 3):Border(),
                              ),
                          ),
                            ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: (){
                              setState((){
                                first=false;
                                second=true;
                                third = false;
                                fourth = false;
                                fifth = false;
                                six = false;
                                seven = false;
                                eight = false;
                                nine = false;
                                colorofContainer=LinearGradient(colors: [Colors.indigo,Colors.teal.shade900]);
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [Colors.indigo,Colors.teal.shade900]),
                                border: second?Border.all(color: Colors.blue,width: 3):Border(),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: (){
                              setState((){
                                first=false;
                                second=false;
                                third = true;
                                fourth = false;
                                fifth = false;
                                six = false;
                                seven = false;
                                eight = false;
                                nine = false;
                                colorofContainer=LinearGradient(colors: [Colors.indigo,Colors.yellow]);
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                border: third?Border.all(color: Colors.blue,width: 3):Border(),
                                gradient: LinearGradient(colors: [Colors.indigo.shade900,Colors.yellow.shade400]),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: (){
                              setState((){
                                first=false;
                                second=false;
                                third = false;
                                fourth = true;
                                fifth = false;
                                six = false;
                                seven = false;
                                eight = false;
                                nine = false;
                                colorofContainer=LinearGradient(colors: [Colors.indigo,Colors.yellow.shade900]);
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                border: fourth?Border.all(color: Colors.blue,width: 3):Border(),
                                gradient:  LinearGradient(colors: [Colors.indigo,Colors.yellow.shade900]),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: (){
                              setState((){
                                first=false;
                                second=false;
                                third = false;
                                fourth = false;
                                fifth = true;
                                six = false;
                                seven = false;
                                eight = false;
                                nine = false;
                                colorofContainer=LinearGradient(colors: [Colors.teal.shade700,Colors.yellow.shade900]);
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                border: fifth?Border.all(color: Colors.blue,width: 3):Border(),
                                gradient: LinearGradient(colors: [Colors.teal.shade700,Colors.yellow.shade900]),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: (){
                              setState((){
                                first=false;
                                second=false;
                                third = false;
                                fourth = false;
                                fifth = false;
                                six = true;
                                seven = false;
                                eight = false;
                                nine = false;
                                colorofContainer=LinearGradient(colors: [Colors.black,Colors.redAccent]);
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                border: six?Border.all(color: Colors.blue,width: 3):Border(),
                                gradient:  LinearGradient(colors: [Colors.black,Colors.redAccent]),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: (){
                              setState((){
                                first=false;
                                second=false;
                                third = false;
                                fourth = false;
                                fifth = false;
                                six = false;
                                seven = true;
                                eight = false;
                                nine = false;
                                colorofContainer=LinearGradient(colors: [Colors.red,Colors.red.shade100]);
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                border: seven?Border.all(color: Colors.blue,width: 3):Border(),
                                gradient:  LinearGradient(colors: [Colors.red,Colors.red.shade100]),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: (){
                              setState((){
                                first=false;
                                second=false;
                                third = false;
                                fourth = false;
                                fifth = false;
                                six = false;
                                seven = false;
                                eight = true;
                                nine = false;
                                colorofContainer=LinearGradient(colors: [Colors.deepPurple.shade900,Colors.pink]);
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  border: eight?Border.all(color: Colors.blue,width: 3):Border(),
                                gradient:  LinearGradient(colors: [Colors.deepPurple.shade900,Colors.pink])
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: (){
                              setState((){
                                first=false;
                                second=false;
                                third = false;
                                fourth = false;
                                fifth = false;
                                six = false;
                                seven = false;
                                eight = false;
                                nine = true;
                                colorofContainer=LinearGradient(colors: [Colors.teal.shade900,Colors.tealAccent]);
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                border: nine?Border.all(color: Colors.blue,width: 3):Border(),
                                gradient:  LinearGradient(colors: [Colors.teal.shade900,Colors.tealAccent]),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black
                  ),
                  onPressed: (){
                    setState((){
                      c=colorofContainer;
                      Navigator.pop(context);
                    });
                  },
                  child: Text("Done",style: TextStyle(fontFamily: 'font')))
            ],
          );
        });
  }
}
