import 'package:astronomy_app/app/app_controller.dart';
import 'package:astronomy_app/app/core/components/background_gradient.dart';
import 'package:astronomy_app/app/core/components/loader.dart';
import 'package:astronomy_app/app/core/components/message_error.dart';
import 'package:astronomy_app/app/modules/astronomy/components/astronomy_item.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'astronomy_controller.dart';

class AstronomyPage extends StatefulWidget {
  @override
  _AstronomyPageState createState() => _AstronomyPageState();
}

class _AstronomyPageState
    extends ModularState<AstronomyPage, AstronomyController> {
  final appController = Modular.get<AppController>();
  final _controllerSearch = TextEditingController();
  final _scrollController = ScrollController();
  var _disposer;

  @override
  void initState() {
    //reaction to filter the data when "search" is change.
    _disposer = reaction((r) => controller.search, (search) {
      if (search == null) {
        controller.filteredList = controller.astronomyList;
        return;
      }
      var searchedItem = search.toLowerCase();
      controller.filteredList = controller.astronomyList
          .where(
            (item) =>
                item.title.toLowerCase().contains(searchedItem) ||
                item.date.toLowerCase().contains(searchedItem),
          )
          .toList()
          .asObservable();
    });

    //Pagination
    _scrollController.addListener(() {
      var positionScroll = _scrollController.position;
      if (positionScroll.pixels == positionScroll.maxScrollExtent) {
        controller.isPagination = true;
        controller.getApodData().then((_) {
          controller.isPagination = false;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _disposer?.call();
    _controllerSearch.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NASA - APOD'),
      ),
      body: BackgroundGradient(
        padding: EdgeInsets.all(8),
        child: Observer(builder: (_) {
          if (appController.connectivityResult == ConnectivityResult.none) {
            return MessageError(
              msg: 'No internet connection!',
            );
          }

          if (controller.error == DioErrorType.DEFAULT) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MessageError(
                  msg: 'An unexpected error has occurred!',
                ),
                RaisedButton.icon(
                  onPressed: () {
                    controller.clear();
                    controller.getApodData();
                  },
                  icon: Icon(Icons.refresh),
                  label: Text('Refresh'),
                )
              ],
            );
          }

          if (controller.error == DioErrorType.CONNECT_TIMEOUT) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MessageError(
                  msg: 'Connecting timed out!',
                ),
                RaisedButton.icon(
                  onPressed: () {
                    controller.clear();
                    controller.getApodData();
                  },
                  icon: Icon(Icons.refresh),
                  label: Text('Refresh'),
                )
              ],
            );
          }

          var astronomyList = controller.filteredList;

          if (astronomyList == null) {
            return Loader();
          }

          return RefreshIndicator(
            color: Colors.black,
            strokeWidth: 3.0,
            onRefresh: controller.getApodData,
            child: Column(
              children: [
                SizedBox(height: 10),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: _controllerSearch,
                  onChanged: controller.setSearch,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Search',
                    labelStyle: TextStyle(fontSize: 18, color: Colors.white),
                    suffixIcon: controller.isSearch
                        ? IconButton(
                            icon: Icon(Icons.close, color: Colors.white),
                            onPressed: () {
                              controller.clearSearch();
                              _controllerSearch.clear();
                              FocusScope.of(context).unfocus();
                            },
                          )
                        : null,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ListView.builder(
                    itemCount: astronomyList.length + 1,
                    controller: _scrollController,
                    shrinkWrap: true,
                    itemBuilder: (context, idx) {
                      if (idx == astronomyList.length) {
                        if (controller.isSearch) return Container();
                        return Loader();
                      }

                      var astronomyModel = astronomyList[idx];

                      return AstronomyItem(
                        astronomyModel: astronomyModel,
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
