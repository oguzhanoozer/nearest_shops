import 'package:mobx/mobx.dart';
import 'package:nearest_shops/view/product/contstants/image_path.dart';

import '../model/dashboard_ads_slider_model.dart';
import '../model/dashboard_model.dart';

part 'dashboard_view_model.g.dart';

class DashboardViewModel = _DashboardViewModelBase with _$DashboardViewModel;

abstract class _DashboardViewModelBase with Store {
  List<DashboardModel> dashboardModelList = [
    DashboardModel(
      url: ImagePaths.instance.hotDog,
      title: "Product title",
      body: "Product body",
      price: "\$50",
    ),
    DashboardModel(
      url: ImagePaths.instance.kiwi,
      title: "Product title",
      body: "Product body",
      price: "\$50",
    ),
    DashboardModel(
      url: ImagePaths.instance.tulip,
      title: "Product title",
      body: "Product body",
      price: "\$50",
    ),
    DashboardModel(
      url: ImagePaths.instance.currant,
      title: "Product title",
      body: "Product body",
      price: "\$50",
    ),
    DashboardModel(
      url: ImagePaths.instance.turnip,
      title: "Product title",
      body: "Product body",
      price: "\$50",
    )

    /*DashboardModel(
      url:
          "https://www.pngkey.com/png/detail/20-205800_free-png-apple-fruit-png-file-png-images.png",
      title: "Product title",
      body: "Product body",
      price: "\$50",
    ),
    DashboardModel(
      url:
          "https://www.pngkey.com/png/detail/20-205800_free-png-apple-fruit-png-file-png-images.png",
      title: "Product title",
      body: "Product body",
      price: "\$50",
    ),
    DashboardModel(
      url:
          "https://www.pngkey.com/png/detail/20-205800_free-png-apple-fruit-png-file-png-images.png",
      title: "Product title",
      body: "Product body",
      price: "\$50",
    ),
    DashboardModel(
      url:
          "https://www.pngkey.com/png/detail/20-205800_free-png-apple-fruit-png-file-png-images.png",
      title: "Product title",
      body: "Product body",
      price: "\$50",
    ),
    DashboardModel(
      url:
          "https://www.pngkey.com/png/detail/20-205800_free-png-apple-fruit-png-file-png-images.png",
      title: "Product title",
      body: "Product body",
      price: "\$50",
    )*/
  ];
}
