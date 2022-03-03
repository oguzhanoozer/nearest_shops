import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kartal/kartal.dart';
import 'package:nearest_shops/view/home/owner_product_list/view/map_shop_view.dart';
import 'package:nearest_shops/view/home/owner_product_list/viewmodel/owner_product_list_view_model.dart';
import 'package:nearest_shops/view/product/slider/slider_card.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/button/normal_button.dart';
import '../../../../core/components/button/text_button.dart';

class OwnerProductListView extends StatelessWidget {
  const OwnerProductListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<OwnerProductListViewModel>(
      viewModel: OwnerProductListViewModel(),
      onModelReady: (model) {},
      onPageBuilder:
          (BuildContext context, OwnerProductListViewModel viewmodel) =>
              buildScaffold(context, viewmodel),
    );
  }

  Widget buildScaffold(
      BuildContext context, OwnerProductListViewModel viewmodel) {
    return Scaffold(
        body: Stack(children: [
      MapShopView(),
      
      DraggableScrollableSheet(
        initialChildSize: 0.3,
        maxChildSize: 0.8,
        builder: (BuildContext context, myscrollController) {
          return Card(
            color: Colors.white,
            child: ListView.builder(
              controller: myscrollController,
              itemCount: 25,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: context.height * 0.15,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.orange[50]!)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          //child: Image.network(widget.dashboardModelList![index].url ?? "",
                          child: Padding(
                            padding: context.paddingMedium,
                            child: Image.asset(
                                viewmodel.dashboardModelList[index].url ?? "",
                                fit: BoxFit.fill),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                viewmodel.dashboardModelList[index].title ?? "",
                                style: context.textTheme.headline5!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Text(viewmodel.dashboardModelList[index].title ??
                                  ""),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    viewmodel.dashboardModelList[index].price ??
                                        "",
                                    style: context.textTheme.headline6!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  Icon(Icons.shopping_bag),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                        elevation: MaterialStateProperty.all(0),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.transparent)),
                                    child: Text(
                                      "Own other products",
                                      style: context.textTheme.bodyLarge!
                                          .copyWith(
                                              color: context.colorScheme
                                                  .onSurfaceVariant),
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      )
    ]));
  }
}
