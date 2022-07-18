import 'package:flutter/material.dart';
class CommonAppContainer extends StatelessWidget {
  final Widget? image;
  final String? text;
  final Function()? onTap;
  const CommonAppContainer({
    Key? key,
    this.image,
    this.text,
    this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
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
                      child: image!
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.circular(15)
                  ),
                ),
                Container(child: Center(child: Text(text!,style: TextStyle(fontFamily: 'font',color: Colors.white,fontSize: 20),)))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
