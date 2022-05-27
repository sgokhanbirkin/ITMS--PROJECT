import 'package:flutter/material.dart';
import '../../../product/widgets/appbar.dart';

import 'addFoodPage_view_body.dart';

class AddFoodPageView extends StatelessWidget {
  const AddFoodPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context: context, name: "Tarif Ekleme", isback: true),
      body: const AddFoodPageViewBody(),
    );
  }
}
