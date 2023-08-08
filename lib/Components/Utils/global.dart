import 'package:flutter/cupertino.dart';

import '../../Model/quotes_model.dart';

class Global {
  static late List<Quotes> QuotsData;
  static TextEditingController nameController = TextEditingController();
  static TextEditingController emailController = TextEditingController();

  static String? name;
  static String? email;
}
