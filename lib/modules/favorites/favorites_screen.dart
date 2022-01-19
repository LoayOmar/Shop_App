import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/cubit/cubit.dart';
import 'package:shop_app/shared/cubit/states.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ShopCubit.get(context).favoritesModel!.data == null
            ? Center(
                child: Text(
                  'No Item Added',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              )
            : state is! ShopLoadingGetFavoritesState
                ? ListView.separated(
                    itemBuilder: (context, index) => buildListProduct(
                        ShopCubit.get(context)
                            .favoritesModel!
                            .data!
                            .data![index]
                            .product!,
                        context),
                    separatorBuilder: (context, index) => myDivider(),
                    itemCount: ShopCubit.get(context)
                        .favoritesModel!
                        .data!
                        .data!
                        .length,
                  )
                : Center(child: CircularProgressIndicator());
      },
    );
  }
}
