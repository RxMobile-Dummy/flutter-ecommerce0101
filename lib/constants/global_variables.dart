import 'package:flutter/material.dart';

class GlobalVariables {
  static const uri = 'http://192.168.101.159:3000';
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 29, 201, 192),
      Color.fromARGB(255, 125, 221, 216),
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundColor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;
  static const textFieldBorderSide = Colors.black38;

  // STATIC IMAGES
  static const List<String> carouselImages = [
    'https://images-eu.ssl-images-amazon.com/images/G/31/img21/Wireless/WLA/TS/D37847648_Accessories_savingdays_Jan22_Cat_PC_1500.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img2021/Vday/bwl/English.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img22/Wireless/AdvantagePrime/BAU/14thJan/D37196025_IN_WL_AdvantageJustforPrime_Jan_Mob_ingress-banner_1242x450.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/31/Symbol/2020/00NEW/1242_450Banners/PL31_copy._CB432483346_.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/31/img21/shoes/September/SSW/pc-header._CB641971330_.jpg',
  ];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Mobiles',
      'image': 'assets/images/mobiles.jpeg',
    },
    {
      'title': 'Essentials',
      'image': 'assets/images/essentials.jpeg',
    },
    {
      'title': 'Appliances',
      'image': 'assets/images/appliances.jpeg',
    },
    {
      'title': 'Books',
      'image': 'assets/images/books.jpeg',
    },
    {
      'title': 'Fashion',
      'image': 'assets/images/fashion.jpeg',
    },
  ];

  static const   double bottomBarWidth = 42;
  static const  double bottomBarBorderWidth = 5;
  static const noRoutesFound ="Screen doesn't exist";
  static const welcome ="Welcome";
  static const createAccount ="Create Account";
  static const signIn ="Sign-In.";
  static const signInButton ="Sign In";
  static const email ="Email";
  static const name ="Name";
  static const password ="Password";
  static const signUp ="Sign Up";
  static const yourOrders ='Your Orders';
  static const turnSeller ='Turn Seller';
  static const wishList ='Your Wish List';
  static const logOut ='Log Out';
  static const seeAll ='See all';
  static const search ='Search Amazon.in';
  static const dealOfTheDay ='Deal of the day';
  static const hundred ='\$100';
  static const vivek ='Vivek';
  static const admin ='Admin';
  static const seeAllDeals ='See all deals';
  static const addProduct ='Add a Product';
  static const mobiles ='Mobiles';
  static const essentials ='Essentials';
  static const appliances = 'Appliances';
  static const books = 'Books';
  static const fashion =  'Fashion';
  static const productName =  'Product Name';
  static const selectProductImage =  'Select Product Images';
  static const sell =  'Sell';
  static const description =  'Description';
  static const price =  'Price';
  static const quantity =  'Quantity';
  static const accountSuccess ='Account created! Login with the same credentials!';

  static const imageAmazon ='assets/images/amazon_in.png';

}