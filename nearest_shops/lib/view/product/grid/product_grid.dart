import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../../home/dashboard/model/dashboard_model.dart';

class ProductGrid extends StatelessWidget {
  final List<DashboardModel>? dashboardModel;

  const ProductGrid({Key? key, this.dashboardModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.9,
      ),
      itemCount: dashboardModel!.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => Padding(
        padding: context.paddingLow,
        child: Card(
          color: Colors.orange[50],
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.orange[50]!, width: 0.5),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 4,
                child: Center(
                  child: Image.asset(dashboardModel![index].url ?? ""),
                ),
              ),
              Expanded(
                  flex: 3,
                  child: Padding(
                    padding: context.paddingLow / 2,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: Column(
                        ///  mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            dashboardModel![index].title ?? "",
                            textAlign: TextAlign.center,
                            style: context.textTheme.headline6,
                          ),
                          Text(
                            dashboardModel![index].body ?? "",
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                dashboardModel![index].price ?? "",
                                style: context.textTheme.headline6!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              Icon(Icons.shopping_bag),
                            ],
                          )
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
