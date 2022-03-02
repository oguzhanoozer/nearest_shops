import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/button/normal_button.dart';
import '../../../product/slider/dashboard_ads_slider.dart';
import '../viewmodel/product_detail_view_model.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ProductDetailViewModel>(
      viewModel: ProductDetailViewModel(),
      onModelReady: (model) {},
      onPageBuilder: (BuildContext context, ProductDetailViewModel viewmodel) =>
          buildScaffold(context, viewmodel),
    );
  }

  Scaffold buildScaffold(
      BuildContext context, ProductDetailViewModel viewModel) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Padding(
        padding: context.paddingLow,
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: DashboardAdsSlider(
                    dashboardModelList: viewModel.dashboardModelList)),
            Expanded(
              flex: 2,
              child: Padding(
                padding: context.horizontalPaddingNormal,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Car Cleaner",
                          style: context.textTheme.headline6!.copyWith(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "\$250",
                          style: context.textTheme.headline5!.copyWith(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Text(
                          "(4,5)",
                          style: context.textTheme.bodyText2!.copyWith(
                              color: Colors.yellow,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: context.verticalPaddingNormal,
                        child: Column(
                          children: [
                            Expanded(
                              child: AutoSizeText(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry." +
                                      " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s," +
                                      " when an unknown printer took a galley of type and scrambled it to make a type specimen book." +
                                      "It has survived not only five centuries, but also the leap into electronic typesetting, " +
                                      "remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                                  style: context.textTheme.headline6!),
                            ),
                            NormalButton(
                              child: Text(
                                "See our other products",
                                style: context.textTheme.headline6!.copyWith(
                                    color: context.colorScheme.onSecondary),
                              ),
                              onPressed: null,
                              color:
                                  context.appTheme.colorScheme.onSurfaceVariant,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: context.horizontalPaddingLow,
        child: Icon(
          Icons.cancel,
          color: Colors.grey[400],
          size: 40,
        ),
      ),
      actions: [
        Padding(
          padding: context.horizontalPaddingLow,
          child: Icon(
            Icons.favorite,
            color: Colors.grey[400],
            size: 40,
          ),
        )
      ],
    );
  }
}
