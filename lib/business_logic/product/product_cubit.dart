import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tokoto_e_commerce/data/models/product.dart';
import 'package:tokoto_e_commerce/presentation/screens/product_details/product_details.dart';

import '../../data/models/cart.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  static ProductCubit get(context) => BlocProvider.of(context);

  List<Product> demoProducts = [
    Product(
      store: 'Sony',
      id: 1,
      images: [
        "assets/images/ps4_console_white_1.png",
        "assets/images/ps4_console_white_2.png",
        "assets/images/ps4_console_white_3.png",
        "assets/images/ps4_console_white_4.png",
      ],
      colors: [
        const Color(0xFFF6625E),
        const Color(0xFF836DB8),
        const Color(0xFFDECB9C),
        Colors.white,
      ],
      title: "Wireless Controller for PS4™",
      price: 64.99,
      description:
          "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …",
      rating: 4.8,
      isFavourite: false,
      isPopular: true,
    ),
    Product(
      store: 'Nike',
      id: 2,
      images: [
        "assets/images/Image Popular Product 2.png",
      ],
      colors: [
        const Color(0xFFF6625E),
        const Color(0xFF836DB8),
        const Color(0xFFDECB9C),
        Colors.white,
      ],
      title: "Nike Sport White - Man Pant",
      price: 50.5,
      description:
          "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …",
      rating: 4.1,
      isPopular: true,
    ),
    Product(
      store: 'Nova',
      id: 3,
      images: [
        "assets/images/glap.png",
      ],
      colors: [
        const Color(0xFFF6625E),
        const Color(0xFF836DB8),
        const Color(0xFFDECB9C),
        Colors.white,
      ],
      title: "Gloves XC Omega - Polygon",
      price: 36.55,
      description:
          "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …",
      rating: 4.1,
      isFavourite: false,
      isPopular: true,
    ),
    Product(
      store: 'Sony',
      id: 4,
      images: [
        "assets/images/wireless headset.png",
      ],
      colors: [
        const Color(0xFFF6625E),
        const Color(0xFF836DB8),
        const Color(0xFFDECB9C),
        Colors.white,
      ],
      title: "Logitech Head",
      price: 20.20,
      description:
          "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …",
      rating: 4.1,
      isFavourite: false,
      isPopular: true,
    ),
  ];
  List<Product> favProducts = [];
  List<Cart> cartList = [];
  List<Map<String, dynamic>> categories = [
    {"icon": "assets/icons/Flash Icon.svg", "text": "Flash Deal"},
    {"icon": "assets/icons/Bill Icon.svg", "text": "Bill"},
    {"icon": "assets/icons/Game Icon.svg", "text": "Game"},
    {"icon": "assets/icons/Gift Icon.svg", "text": "Daily Gift"},
    {"icon": "assets/icons/Discover.svg", "text": "More"},
  ];
  late Product currentProductDetails;
  int selectedImage = 0;
  int selectedColor = 0;
  int selectedCount = 1;
  double totalPrice = 0;

  changeFavourite(Product product) {
    if (product.isFavourite) {
      favProducts.remove(product);
    }

    demoProducts[(product.id - 1)].isFavourite =
        !demoProducts[(product.id - 1)].isFavourite;

    product.isFavourite = product.isFavourite;
    if (product.isFavourite) {
      favProducts.add(product);
    }
    emit(ChangeFav());
  }

  showProductDetails(Product product, BuildContext context) {
    currentProductDetails = product;
    if (currentProductDetails.isInCart) {
      selectedCount = cartList
          .firstWhere((element) => element.product == currentProductDetails)
          .numOfItem;
    }
    Navigator.pushNamed(context, DetailsScreen.routeName, arguments: context);
  }

  changeSelectedImage(int index) {
    selectedImage = index;
    emit(ChangeImage());
  }

  changeSelectedColor(int index) {
    selectedColor = index;
    emit(ChangeImage());
  }

  addSelectedCount() {
    selectedCount++;
    emit(ChangeCount());
  }

  subSelectedCount() {
    selectedCount--;
    emit(ChangeCount());
  }

  addToCart() {
    bool flagProductFound = false;
    for (Cart e in cartList) {
      if (e.product == currentProductDetails) {
        flagProductFound = true;
        e.numOfItem += selectedCount;
      }
    }
    if (!flagProductFound) {
      cartList
          .add(Cart(product: currentProductDetails, numOfItem: selectedCount));
      currentProductDetails.isInCart = true;
    }
    emit(AddToCart());
  }

  updateInCart() {
    cartList.firstWhere((e) => e.product == currentProductDetails).numOfItem =
        selectedCount;
    calcTotalPrice();
  }

  removeFromCart(int index) {
    cartList.removeAt(index);
    calcTotalPrice();
    emit(RemoFromvCart());
  }

  calcTotalPrice() {
    totalPrice = 0;
    for (Cart element in cartList) {
      totalPrice += (element.product.price * element.numOfItem);
    }
  }

  onBack(BuildContext context) {
    selectedImage = 0;
    selectedColor = 0;
    selectedCount = 1;
    Navigator.pop(context);
    emit(OnBack());
  }
}
