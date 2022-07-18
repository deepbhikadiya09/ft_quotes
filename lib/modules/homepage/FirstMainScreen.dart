import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../InnerQuotesPage/innerQuotepage.dart';
import '../mainList.dart';

class HomePageApp extends StatefulWidget {
  const HomePageApp({Key? key}) : super(key: key);

  @override
  State<HomePageApp> createState() => _HomePageAppState();
}

class _HomePageAppState extends State<HomePageApp> {

 int currentIndex = 0;
 List<String> images=[
   "lib/assets/asset/image/quote1.jpg",
   "lib/assets/asset/image/quote2.jpg",
   "lib/assets/asset/image/quote3.jpg",
   "lib/assets/asset/image/quote4.jpg",
   "lib/assets/asset/image/quote5.jpg",
   "lib/assets/asset/image/quote6.jpg",
   "lib/assets/asset/image/quote7.jpg",
   "lib/assets/asset/image/quote8.jpg",
 ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text("Daily Motive",style: TextStyle(color: Colors.black,fontFamily: 'font',fontSize: 25),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
                children: [
                  Container(
                    height: 200,
                    child: CarouselSlider.builder(
                        itemCount: images.length,
                        itemBuilder: (context,index,_){
                          return Container(
                              height: double.infinity,
                              width: double.infinity,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset("${images[index]}",fit: BoxFit.cover,)));
                        },
                        options: CarouselOptions(
                          viewportFraction: 1,
                          pageSnapping: true,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration: Duration(seconds: 1),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          onPageChanged: (index,_){
                            setState((){
                              currentIndex=index;
                            });
                          }
                        )),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children:
                      images.map((img) {
                        int index = images.indexOf(img);
                        return Container(
                          width: 5,
                          height: 5,
                          margin: EdgeInsets.symmetric(vertical: 10,horizontal: 1),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                              color: currentIndex == index ? Colors.black:Colors.grey
                          ),
                        );
                      }).toList()
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: mainQuote.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2
                      ), itemBuilder: (context,index){
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return InnerInspiration(index: index, quoteTopic: mainQuote[index]);
                        }));
                      },
                      child: Container(
                        height:170,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)
                          ),
                          elevation: 50,
                          child: Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                height: double.infinity,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset("${mainQuoteImage[index]}",fit: BoxFit.cover,)
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.black38,
                                    borderRadius: BorderRadius.circular(15)
                                ),
                              ),
                              Container(child: Center(child: Text("${mainQuote[index]}",style: TextStyle(fontFamily: 'font',color: Colors.white,fontSize: 20),)))
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
        ),
      ),

    );
  }
}