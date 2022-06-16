import 'dart:ui';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class EComAppHomeScreen extends StatefulWidget {
  @override
  _EComAppHomeScreenState createState() => _EComAppHomeScreenState();
}

class Products {
  late String productName;
  late String productDesc;
  late String price;
  late String rating;
  late bool isFavourite;
  late AssetImage productpic;

  Products(this.productName, this.productDesc, this.price, this.rating,
      this.isFavourite, this.productpic);
}

class _EComAppHomeScreenState extends State<EComAppHomeScreen> {
  final Color colorCode = const Color(0x00fa6163);
  int _currentIndex = 0;
  int _currentSelectedCat = 0;

  late List<String> catNameList;
  late List<Products> productsList;

  @override
  initState() {
    super.initState();
    catNameList = [
      "All",
      "Women",
      "Men",
      "Summer",
      "Winter",
      "Rainy",
    ];

    productsList = [
      Products("Froks", "Grils Maxi/Full Length Party Dress", "₹ 499", "4.9", true, const AssetImage("images/froks.webp")),
      Products("Socks", "Baby Boys & Girls Printed Socks", "₹ 150", "4.2", true,  const AssetImage("images/socks.webp")),
      Products("T-Shirt", "Boys Printed Cotton Jersey T-shirt", "₹ 299", "4.4", true,  const AssetImage("images/mens.webp")),
      Products("Jogger", "Solid Men Black Track Pants", "₹ 799", "4.7", true,  const AssetImage("images/jogger.webp")),
      Products("Full Sleve T-Shirt", "Boys Solid Cotton T-Shirt", "₹ 449", "4.8", true,  const AssetImage("images/men.webp")),
      Products("Girls Dress", "Emblellished Fashion Lycra Blend", "₹ 699", "4.0", true,  const AssetImage("images/women.webp")),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Container(
            margin: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
                color: Color(0xfffbded5),
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            child: const Icon(
              Icons.grid_view,
              color: Colors.deepOrangeAccent,
            ),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: const BoxDecoration(
                  color: Color(0xfffbded5),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: const Icon(
                Icons.notifications_none,
                color: Colors.deepOrangeAccent,
              ),
            ),
          ],
          title: const Text("Bestbazar",
              style: TextStyle(
                  color: Colors.deepOrangeAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  fontStyle: FontStyle.italic)),
        ),
        body: Container(
          padding: const EdgeInsets.all(10.0),
          width: double.infinity,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10.0,
              ),
              titleText("Find all yours style here!"),
              const SizedBox(
                height: 20.0,
              ),
              searchFilterView(),
              const SizedBox(
                height: 20.0,
              ),
              titleText("Discover"),
              const SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: 50,
                child: categoryList(),
              ),
              const SizedBox(height: 10.0),
              postsGrid()
            ],
          ),
        ),
        bottomNavigationBar: customBottomNavigationBar());
  }

  postsGrid() {
    return Expanded(
        child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            shrinkWrap: true,
            children: List.generate(
              productsList.length,
                  (index) {
                return posts(productsList[index]);
              },
            )
    )
    );
  }

  posts(Products products) {
    return Container(
      padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      decoration:  BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          border: Border.all(color: const Color(0xfffbded5)),
          color: Colors.white//Color(0xfffbded5)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Image(
            alignment: Alignment.center,
            fit: BoxFit.fitHeight,
            width: 150,
            height: 110,
            image: products.productpic,
          ),
          const SizedBox(height: 10.0),
          Text(products.productName,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0)),
          const SizedBox(height: 5.0),
          Text(products.productDesc,
              style: const TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0)),
          const SizedBox(height: 5.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Text(
                products.price,
                style: const TextStyle(color: Colors.deepOrangeAccent, fontWeight: FontWeight.bold, fontSize: 12.0),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    size: 18.0,
                    color: Colors.yellow,
                  ),
                  Text(products.rating, style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),)
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  customBottomNavigationBar() {
    return BottomNavyBar(
      showElevation: true,
      backgroundColor: Colors.white,
      selectedIndex: _currentIndex,
      items: [
        BottomNavyBarItem(
            icon: const Icon(Icons.home),
            title: const Text("Home"),
            textAlign: TextAlign.center,
            activeColor: Colors.deepOrangeAccent),
        BottomNavyBarItem(
            icon: const Icon(Icons.favorite),
            title: const Text("Favourite"),
            textAlign: TextAlign.center,
            activeColor: Colors.deepOrangeAccent),
        BottomNavyBarItem(
            icon: const Icon(Icons.shopping_bag),
            title: const Text("Cart"),
            textAlign: TextAlign.center,
            activeColor: Colors.deepOrangeAccent),
        BottomNavyBarItem(
            icon: const Icon(Icons.person),
            title: const Text("Account"),
            textAlign: TextAlign.center,
            activeColor: Colors.deepOrangeAccent),
      ],
      onItemSelected: (index) => setState(() => this._currentIndex = index),
    );
  }

  Widget categoryList() {
    return Expanded(
      child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(width: 10.0);
          },
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: catNameList.length,
          itemBuilder: (BuildContext context, int index) {
            return singleChip(catNameList[index], index);
          }),
    );
  }

  singleChip(String catName, int index) {
    return ChoiceChip(
        selected: index == _currentSelectedCat,
        selectedColor: Colors.deepOrangeAccent,
        backgroundColor: const Color(0xfffbded5),
        padding: const EdgeInsets.all(8),
        onSelected: (bool selected) {
          setState(() {
            _currentSelectedCat = index;
            //catNameList[index].isSelected = selected;
          });
        },
        label: Text(
          catName,
          style: TextStyle(
              color: (index == _currentSelectedCat)
                  ? Colors.white
                  : Colors.deepOrangeAccent),
        ));
  }

  searchFilterView() {
    return Row(
      children: [
        Container(
          width: 318,
          padding: const EdgeInsets.all(10.0),
          decoration: const BoxDecoration(
              color: Color(0xfffbded5),
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          child: Row(
            children: const [
              Icon(
                Icons.search,
                color: Colors.deepOrangeAccent,
              ),
              SizedBox(
                width: 10.0,
              ),
              SizedBox(
                width: 220,
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  decoration:
                      InputDecoration.collapsed(hintText: 'Search here...'),
                ),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.only(left: 8.0),
          decoration: const BoxDecoration(
              color: Color(0xfffbded5),
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          child: const Icon(
            Icons.filter_list,
            color: Colors.deepOrangeAccent,
          ),
        ),
      ],
    );
  }

  titleText(String message) {
    return Text(
      message,
      style: const TextStyle(
        color: Colors.black87,
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
