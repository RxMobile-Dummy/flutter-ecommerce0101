import 'package:flutter/material.dart';

class GlobalVariables {
  static const uri = 'https://068b-180-211-112-179.in.ngrok.io';
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

  static const double bottomBarWidth = 42;
  static const double bottomBarBorderWidth = 5;
  static const noRoutesFound = "Screen doesn't exist";
  static const welcome = "Welcome";
  static const createAccount = "Create Account";
  static const signIn = "Sign-In.";
  static const signInButton = "Sign In";
  static const email = "Email";
  static const name = "Name";
  static const password = "Password";
  static const signUp = "Sign Up";
  static const yourOrders = 'Your Orders';
  static const turnSeller = 'Turn Seller';
  static const wishList = 'Your Wish List';
  static const logOut = 'Log Out';
  static const logOutSuccess = 'Log out successfully';
  static const seeAll = 'See all';
  static const search = 'Search Amazon.in';
  static const dealOfTheDay = 'Deal of the day';
  static const hundred = '\$100';
  static const vivek = 'Vivek';
  static const viewOrderDetails = 'View order details';
  static const purchaseDetails = 'Purchase Details';
  static const tracking = 'Tracking';
  static const pending = 'Pending';
  static const received = 'Received';
  static const admin = 'Admin';
  static const yetDelivered = 'Your order is yet to be delivered';
  static const delivered = 'Delivered';
  static const yetToSign = 'Your order has been delivered, you are yet to sign.';
  static const signedByYou = 'Your order has been delivered and signed by you.';
  static const completed = 'Completed';
  static const seeAllDeals = 'See all deals';
  static const addProduct = 'Add a Product';
  static const mobiles = 'Mobiles';
  static const essentials = 'Essentials';
  static const appliances = 'Appliances';
  static const books = 'Books';
  static const fashion = 'Fashion';
  static const productName = 'Product Name';
  static const selectProductImage = 'Select Product Images';
  static const sell = 'Sell';
  static const description = 'Description';
  static const price = 'Price';
  static const quantity = 'Quantity';
  static const inStock = 'In Stock';
  static const searchInAmazon = 'Search Amazon.in';
  static const amazon = 'Amazon';
  static const freeShipping = 'Eligible for Shipping';
  static const productAddSuccess = 'Product Added Successfully!';
  static const productDeleteSuccess = 'Product Delete Successfully!';
  static const orderStatusSuccess = 'Changed Order Status!';
  static const dealPrice = 'Deal Price: ';
  static const buyNow = 'Buy Now';
  static const rateTheProduct = 'Rate The Product';
  static const addToCart = 'Add to Cart';
  static const subtotal = 'Subtotal ';
  static const orderEmpty = 'Order is Empty';
  static const totalAmount = 'Total Amount';
  static const done = 'Done';
  static const deleteProductSuccess = 'Product deleted successfully';
  static const ratingSuccess = 'Thanks for rating';
  static const addressLoc = 'Flat, House no, Building';
  static const street = 'Area, Street';
  static const pinCode = 'Pin code';
  static const city = 'Town/City';
  static const or = 'OR';
  static const pleaseEnter = 'Please enter all the values!';
  static const accountSuccess =
      'Account created! Login with the same credentials!';

  static const imageAmazon = 'assets/images/amazon_in.png';
}
