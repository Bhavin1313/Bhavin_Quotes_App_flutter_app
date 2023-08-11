import 'package:flutter/material.dart';

import '../../Model/quotes_model.dart';

class Global {
  static late List<Quotes> QuotsData;
  static TextEditingController nameController = TextEditingController();
  static TextEditingController emailController = TextEditingController();

  static String? name;
  static String? email;

  static String fontFamily = "Roboto";
  static Color fontColor = Colors.black;
  static Color bgColor = Colors.white;
  static String bgImage = "";

  static List<String> bgImageList = [
    "https://img.freepik.com/free-photo/beautiful-view-greenery-bridge-forest-perfect-background_181624-17827.jpg?w=2000",
    "https://img.rawpixel.com/private/static/images/website/2022-05/rm422-076-x.jpg?w=1200&h=1200&dpr=1&fit=clip&crop=default&fm=jpg&q=75&vib=3&con=3&usm=15&cs=srgb&bg=F4F4F3&ixlib=js-2.2.1&s=444e119094ef45a3248aa529fb696b2b",
    "https://thumbs.dreamstime.com/b/spring-summer-season-abstract-nature-background-grass-blue-sky-back-49716369.jpg",
    "https://e0.pxfuel.com/wallpapers/521/162/desktop-wallpaper-dslr-blur-background-ideas-dslr-blur-background-hop-digital-background-dslr-background-thumbnail.jpg",
    "https://thumbs.dreamstime.com/b/incredibly-beautiful-sunset-sun-lake-sunrise-landscape-panorama-nature-sky-amazing-colorful-clouds-fantasy-design-115177001.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1rxGkHuhr9UzdHoQvq4NH_a2Fm6caFPBCeA&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWi1usda5OqelxzJkVMLf8UAtSu4gBuBrymg&usqp=CAU",
    "https://t4.ftcdn.net/jpg/05/71/83/47/360_F_571834789_ujYbUnH190iUokdDhZq7GXeTBRgqYVwa.jpg",
    "https://www.creativefabrica.com/wp-content/uploads/2021/03/07/Background-Triangular-Dark-Blue-Graphics-9290410-1-580x363.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-jsY2KVTg7NhkEsZ-PbAmr2_5Z6s9HRkFdQ&usqp=CAU",
    "https://cdn.pixabay.com/photo/2018/01/14/23/12/nature-3082832_640.jpg",
    "https://e0.pxfuel.com/wallpapers/595/364/desktop-wallpaper-dslr-nature-background-dslr-blur.jpg",
    "https://i.pinimg.com/1200x/e0/50/eb/e050ebcd5ee148bf2d4298e33fb11c30.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJmR8LF39ptV7-8XwO-3fw1VV0iU0cXa46-A&usqp=CAU",
    "https://media.istockphoto.com/id/1248542684/vector/abstract-blurred-colorful-background.jpg?s=612x612&w=0&k=20&c=6aJX8oyUBsSBZFQUCJDP7KZ1y4vrf-wEH_SJsuq7B5I=",
    "https://img.rawpixel.com/s3fs-private/rawpixel_images/website_content/v1016-c-08_1-ksh6mza3.jpg?w=800&dpr=1&fit=default&crop=default&q=65&vib=3&con=3&usm=15&bg=F4F4F3&ixlib=js-2.2.1&s=f584d8501c27c5f649bc2cfce50705c0",
  ];

  static List<String> fontFamilyList = [
    "Roboto",
    "Open Sans",
    "Lato",
    "Montserrat",
    "Raleway",
    "Poppins",
    "Ubuntu",
    "Oswald",
    "Source Sans Pro",
    "Noto Sans",
    "Quicksand",
    "Playfair Display",
    "Merriweather",
    "Cabin",
    "Fira Sans",
    "Roboto Condensed",
    "Pacifico",
    "Comfortaa",
    "Alegreya",
    "Crimson Text",
    "Karla",
    "Cairo",
    "Varela Round",
    "Exo",
    "Josefin Sans",
    "Rubik",
    "PT Sans",
    "Inter",
    "Titillium Web",
    "Archivo",
    "Work Sans",
    "Archivo Narrow",
    "Lora",
    "Nunito Sans",
    "Libre Franklin",
    "Prompt",
    "Anton",
    "Rajdhani",
    "Oxygen",
    "Kanit",
    "Zilla Slab",
    "Signika",
  ];
  static List<Color> bgColorList = [
    Color.fromARGB(255, 148, 0, 211),
    Color.fromARGB(255, 75, 0, 130),
    Color.fromARGB(255, 0, 0, 255),
    Color.fromARGB(255, 0, 255, 0),
    Color.fromARGB(255, 255, 255, 0),
    Color.fromARGB(255, 255, 127, 0),
    Color.fromARGB(255, 255, 0, 0),
    Color.fromARGB(255, 139, 0, 0),
    Color.fromARGB(255, 128, 0, 0),
    Color.fromARGB(255, 255, 20, 147),
    Color.fromARGB(255, 255, 105, 180),
    Color.fromARGB(255, 255, 182, 193),
    Color.fromARGB(255, 255, 192, 203),
    Color.fromARGB(255, 219, 112, 147),
    Color.fromARGB(255, 255, 0, 255),
    Color.fromARGB(255, 148, 0, 211),
    Color.fromARGB(255, 75, 0, 130),
    Color.fromARGB(255, 0, 0, 255),
    Color.fromARGB(255, 0, 255, 0),
    Color.fromARGB(255, 255, 255, 0),
    Color.fromARGB(255, 255, 127, 0),
    Color.fromARGB(255, 255, 0, 0),
    Color.fromARGB(255, 139, 0, 0),
    Color.fromARGB(255, 128, 0, 0),
    Color.fromARGB(255, 255, 20, 147),
    Color.fromARGB(255, 255, 105, 180),
    Color.fromARGB(255, 255, 182, 193),
    Color.fromARGB(255, 255, 192, 203),
    Color.fromARGB(255, 219, 112, 147),
    Color.fromARGB(255, 255, 0, 255),
    Color.fromARGB(255, 148, 0, 211),
    Color.fromARGB(255, 75, 0, 130),
    Color.fromARGB(255, 0, 0, 255),
    Color.fromARGB(255, 0, 255, 0),
    Color.fromARGB(255, 255, 255, 0),
    Color.fromARGB(255, 255, 127, 0),
    Color.fromARGB(255, 255, 0, 0),
    Color.fromARGB(255, 139, 0, 0),
    Color.fromARGB(255, 128, 0, 0),
    Color.fromARGB(255, 255, 20, 147),
    Color.fromARGB(255, 255, 105, 180),
    Color.fromARGB(255, 255, 182, 193),
    Color.fromARGB(255, 255, 192, 203),
    Color.fromARGB(255, 219, 112, 147),
    Color.fromARGB(255, 255, 0, 255),
    Color.fromARGB(255, 148, 0, 211),
  ];
}
