import 'package:flutter/material.dart';

import '../services/ingredient_service.dart';

class SelectableChip extends StatelessWidget {
  final Ingredient ingredient;
  final Function onPressed;
  final Color color;

  const SelectableChip({
    super.key,
    required this.ingredient,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle chipStyle = Theme.of(context)
        .textTheme
        .bodySmall!
        .copyWith(color: Colors.white, fontSize: 14.0);

    if (ingredient.name.isEmpty) {
      return SizedBox(
        width: ingredient.width! - 4.0,
        height: 45.0,
      );
    }

    return GestureDetector(
      onTap: () => onPressed(ingredient.id),
      child: Chip(
        padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 0.0),
        backgroundColor: color,
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              ingredient.name,
              style: chipStyle,
            ),
            IconButton(
              icon: const Icon(
                Icons.add,
                size: 20.0,
              ),
              color: Colors.white,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}

class SelectedChip extends StatelessWidget {
  final Ingredient ingredient;
  final Color color;

  const SelectedChip(
      {super.key, required this.ingredient, required this.color});

  @override
  Widget build(BuildContext context) {
    TextStyle whiteTextTheme =
        Theme.of(context).textTheme.labelLarge!.copyWith(color: Colors.white);

    return Chip(
      backgroundColor: color,
      label: Row(
        children: <Widget>[
          Text(
            ingredient.name,
            style: whiteTextTheme,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 4.0),
            child: Icon(
              Icons.check,
              size: 16.0,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
