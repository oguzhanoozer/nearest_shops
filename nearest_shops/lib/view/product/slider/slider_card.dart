import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../home/dashboard/model/dashboard_model.dart';

class SliderCard extends Card {
 
  final BuildContext context;
  final DashboardModel dashboardModel;

  SliderCard({required this.dashboardModel ,required this.context,}) : super(shape:  RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(width: 1, color: Colors.orange[100]!)),child:  Padding(
          padding: context.paddingNormal,
          child: Row(
            children: [
              Expanded(
                //child: Image.network(widget.dashboardModelList![index].url ?? "",
                child: Image.asset(dashboardModel.url ?? "",
                    fit: BoxFit.fill),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                    dashboardModel.title ?? "",
                      style: context.textTheme.headline4!.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    Text(dashboardModel.title ?? ""),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                         dashboardModel.price ?? "",
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
        ),);
}
