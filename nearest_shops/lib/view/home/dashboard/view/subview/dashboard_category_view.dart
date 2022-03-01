part of '../dashboard_view.dart';

extension _DashboardProductsWidgets on DashboardView {
  Widget buildCategoriesTabBar(BuildContext context) {
    return TabBar(
      labelColor: context.colorScheme.onError,
      //unselectedLabelColor: context.colorScheme.onError,
      indicatorColor: context.colorScheme.onSecondary,
      labelPadding: EdgeInsets.zero,
      indicatorWeight: 1,
      isScrollable: true,
      tabs: [
        buildCategoryContainer(context, "Shoes", ImagePaths.instance.shoes),
        buildCategoryContainer(context, "Gift", ImagePaths.instance.gift),
        buildCategoryContainer(context, "Kitchen", ImagePaths.instance.kitchen),
        buildCategoryContainer(context, "Cars", ImagePaths.instance.cars),
        buildCategoryContainer(
            context, "Technology", ImagePaths.instance.technology),
      ],
    );
  }

  Widget buildCategoriesRow(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      buildCategoryContainer(context, "Shoes", ImagePaths.instance.shoes),
      buildCategoryContainer(context, "Gift", ImagePaths.instance.gift),
      buildCategoryContainer(context, "Kitchen", ImagePaths.instance.kitchen),
      buildCategoryContainer(context, "Cars", ImagePaths.instance.cars),
      buildCategoryContainer(
          context, "Technology", ImagePaths.instance.technology),
    ]);
  }

  Widget buildCategoryContainer(
      BuildContext context, String title, String iconUrl) {
    return Container(
      height: context.dynamicHeight(0.08),
      width: context.dynamicHeight(0.08),
      child: Column(
        children: [
          Expanded(
            child: Center(
                child: Image.asset(
              iconUrl,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            )),
          ),
          Text(
            title,
            style: context.textTheme.bodyMedium!.copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
