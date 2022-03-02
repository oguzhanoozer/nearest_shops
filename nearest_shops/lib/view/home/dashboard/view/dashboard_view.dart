import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../../../../core/extension/widget_extension.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../product/contstants/image_path.dart';
import '../../../product/grid/product_grid.dart';
import '../../../product/slider/dashboard_ads_slider.dart';
import '../viewmodel/dashboard_view_model.dart';

part 'subview/dashboard_category_view.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<DashboardViewModel>(
      viewModel: DashboardViewModel(),
      onModelReady: (model) {},
      onPageBuilder: (BuildContext context, DashboardViewModel viewmodel) =>
          buildScaffold(context, viewmodel),
    );
  }

  Scaffold buildScaffold(BuildContext context, DashboardViewModel viewmodel) =>
      Scaffold(
        body: Padding(
            padding: context.paddingNormal,
            child: CustomScrollView(
              slivers: [
                buildSliverApp(context),
                SizedBox(
                  height: context.dynamicHeight(0.25),
                  child: DashboardAdsSlider(
                      dashboardModelList: viewmodel.dashboardModelList),
                ).toSliver,
                buildCategoriesText(context).toSliver,
                //buildCategoriesTabBar(context).toSliver,
                buildCategoriesRow(context).toSliver,
                buildProductsGrid(context, viewmodel).toSliver,
              ],
            )),
      );

  SliverAppBar buildSliverApp(BuildContext context) {
    return SliverAppBar(
        expandedHeight: context.height * 0.18,
        pinned: false,
        // backgroundColor: Colors.grey,
        // shape: ContinuousRectangleBorder(
        //     borderRadius: BorderRadius.only(
        //         bottomLeft: Radius.circular(40),
        //         bottomRight: Radius.circular(40))),
        actions: [buildAppBarActionsContainer()],
        title: buildAppBarTitle(context),
        flexibleSpace: buildFlexibleSpaceBar(context));
  }

  Widget buildProductsGrid(
    BuildContext context,
    DashboardViewModel viewModel,
  ) {
    return ProductGrid(
      dashboardModel: viewModel.dashboardModelList,
    );
  }

  Widget buildCategoriesText(BuildContext context) {
    return Padding(
      padding: context.horizontalPaddingNormal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Top Categories",
            style: context.textTheme.headline5!.copyWith(
              fontWeight: FontWeight.bold,
              color: context.colorScheme.primary,
            ),
          ),
          Text(
            "SEE ALL",
            style: context.textTheme.headline6!.copyWith(
                fontWeight: FontWeight.w500,
                color: context.colorScheme.onSurfaceVariant),
          ),
        ],
      ),
    );
  }

  Container buildAppBarActionsContainer() {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,

        ///border: Border.all(width: 0.5, color: Colors.grey),
        image: DecorationImage(
            image: AssetImage(ImagePaths.instance.profile), fit: BoxFit.fill),
      ),
    );
  }

  Container buildAppBarTitle(BuildContext context) {
    return Container(
      height: context.height * 0.1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Hey Oğuzhan",
            style: context.textTheme.headline5,
          ),
          Text("What you need to buy ?")
        ],
      ),
    );
  }

  FlexibleSpaceBar buildFlexibleSpaceBar(BuildContext context) {
    return FlexibleSpaceBar(
      titlePadding: context.paddingLow,
      title: SizedBox(
        height: 40,
        child: Center(
          child: TextFormField(
            textAlignVertical: TextAlignVertical.center,
            //textAlign: TextAlign.center,
            validator: (value) => null,
            obscureText: false,
            decoration: buildInputDecoration(context),
          ),
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration(BuildContext context) {
    return InputDecoration(
      fillColor: Colors.grey.withOpacity(0.05),
      contentPadding: EdgeInsets.zero,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 0.5,
          color: Colors.grey.withOpacity(0.3),
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(10),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(10),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(10),
      ),

      prefixIcon: Icon(Icons.search, color: Colors.grey, size: 20),
      //  prefixText: "Search product",

      //labelStyle: context.textTheme.subtitle1,
      hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
      hintText: "Search product",
      suffixIcon: Icon(
        Icons.filter_list_outlined,
        size: 30,
        color: context.colorScheme.onSurfaceVariant,
      ),
    );
  }
}
