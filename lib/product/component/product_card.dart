import 'package:actual/common/const/colors.dart';
import 'package:actual/restaurant/model/restaurant_detail_model.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Image image;
  final String name;
  final String detail;
  final int price;

  const ProductCard(
      {Key? key,
      required this.image,
      required this.price,
      required this.detail,
      required this.name})
      : super(key: key);

  factory ProductCard.fromModel({required RestaurantProductModel model}) {
    return ProductCard(
        image: Image.network(
          model.imgUrl,
          width: 110,
          height: 100,
          fit: BoxFit.cover,
        ),
        price: model.price,
        detail: model.detail,
        name: model.name);
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          ClipRRect(borderRadius: BorderRadius.circular(8.0), child: image),
          const SizedBox(width: 16.0),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0,
                ),
              ),
              Text(
                detail,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(color: BODY_TEXT_COLOR, fontSize: 14.0),
              ),
              Text(
                price.toString(),
                textAlign: TextAlign.right,
                style: TextStyle(
                    color: PRIMARY_COLOR,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500),
              )
            ],
          ))
        ],
      ),
    );
  }
}
