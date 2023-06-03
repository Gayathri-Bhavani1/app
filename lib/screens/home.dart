
import 'package:app/constants/colors.dart';
import 'package:app/constants/fonts.dart';
import 'package:app/screens/registration.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../apis/productgetapi.dart';
import '../widgets/dialogpopup.dart';
import '../widgets/item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  List<dynamic>? productData;

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  void getProducts() {
    procutsgetAPI().then((response) async {
      if (response is DioError) {
        dialogPopUp(
          context,
          'Error',
          response.message!,
          '',
          red,
          () {},
          2,
        );
      } else {
        setState(() {
          productData = response.data as List<dynamic>;
        });
  
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjC0GJJJ1Vhv4CXVhyy7ipRBwG5QFDxBdK6w&usqp=CAU",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
             
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      text: 'Hello,',
                      style: FontStyles().h2(
                        context: context,
                        fontWeight: FontWeight.normal,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: name.text
                              .toUpperCase(), // Assuming you have a variable named 'name'
                          style: FontStyles().h2(
                            color: red,
                            context: context,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Wrap(
          
          children: productData?.map((product) {
            return Container(
              width: size.width * .5,
              height: size.height * .38,
            // Set the width of each card
              decoration: BoxDecoration(
               
                border: Border.all(
                  color: Colors.grey[300]!,
                  width: 1,
                ),
              ),
              child: ItemCard(
                productData: product,
              ),
            );
          }).toList() ?? [],
        ),
      ),
    );
  }
}
