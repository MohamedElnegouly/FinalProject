import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/view/favorite/manager/favorite_cubit.dart';
import 'package:graduationproject/view/workspace/data/workspace_model.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key, required this.product});
  final WorkspaceModel product;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<FavoriteCubit>(context);
    return BlocBuilder<FavoriteCubit, FavoriteState>(builder: (context, state) {
      return GestureDetector(
        onTap: () {
          print('product id : ${product.id}');
          cubit.favoritsID.contains(product.id)
              ? cubit.RemoveFromFavorite(id: product.id!)
              : cubit.AddToFavorite(id: product.id!);
        },
        child: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12, offset: Offset(0, 4), blurRadius: 4)
              ]),
          child: Icon(
            cubit.favoritsID.contains(product.id)
                ? Icons.favorite_rounded
                : Icons.favorite_outline_rounded,
            color:
            cubit.favoritsID.contains(product.id) ? Colors.red :
            Colors.grey,
            size: 16,
          ),
        ),
      );
    });
  }
}