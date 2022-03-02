import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../home/dashboard/model/dashboard_ads_slider_model.dart';
import '../../home/dashboard/model/dashboard_model.dart';
import 'circle_indicator_list.dart';

class DashboardAdsSlider extends StatefulWidget {
  final List<DashboardModel>? dashboardModelList;

  DashboardAdsSlider({Key? key, this.dashboardModelList}) : super(key: key);

  @override
  State<DashboardAdsSlider> createState() => _DashboardAdsSliderState();
}

class _DashboardAdsSliderState extends State<DashboardAdsSlider> {
  int _selectedCurrentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 9,
          child: buildImagePageView(_selectedCurrentIndex),
        ),
        Expanded(
          flex: 1,
          child: BuildCircleIndicator(
              currentIndex: _selectedCurrentIndex,
              length: widget.dashboardModelList!.length),
        )
      ],
    );
  }

  PageView buildImagePageView(int _selectedCurrentIndex) {
    return PageView.builder(
      onPageChanged: _onChanged,
      controller: PageController(),
      itemCount: widget.dashboardModelList!.length,
      itemBuilder: (context, index) {
        return buildImageNetwork(context, index);
      },
    );
  }

  Widget buildImageListView() {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.dashboardModelList!.length,
        itemBuilder: (context, index) {
          return buildImageNetwork(context, index);
        });
  }

  void _onChanged(int index) {
    _selectedCurrentIndex = index;
    setState(() {});
  }

  Widget buildImageNetwork(BuildContext context, int index) {
    return Padding(
      padding: context.paddingNormal,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(width: 1, color: Colors.orange[100]!)),
        child: Padding(
          padding: context.paddingNormal,
          child: Row(
            children: [
              Expanded(
                //child: Image.network(widget.dashboardModelList![index].url ?? "",
                child: Image.asset(widget.dashboardModelList![index].url ?? "",
                    fit: BoxFit.fill),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.dashboardModelList![index].title ?? "",
                      style: context.textTheme.headline4!.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    Text(widget.dashboardModelList![index].title ?? ""),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          widget.dashboardModelList![index].price ?? "",
                          style: context.textTheme.headline6!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Icon(Icons.shopping_bag),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
