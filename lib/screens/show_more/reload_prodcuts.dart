import 'package:flutter/material.dart';
import 'package:magento_mobile/bloc/show_more_bloc.dart';
import 'package:magento_mobile/models/Product.dart';
import 'package:magento_mobile/screens/show_more/components/more_product_widget.dart';

class ReloadListView extends StatefulWidget {
  int id;
  ReloadListView(this.id, {Key? key}) : super(key: key);

  @override
  _ReloadListViewState createState() => _ReloadListViewState(id);
}

class _ReloadListViewState extends State<ReloadListView> {
  late ShowMoreNotifire notifier;
  int id;
  _ReloadListViewState(this.id);
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    notifier = ShowMoreNotifire([]);
    notifier.getMore("category_id", id.toString(), 10, true);
  }

  Future _loadData(bool direction) async {
    // perform fetching data delay
    await notifier.getMore("category_id", id.toString(), 10, direction);
    print("load more");
    // update data and loading status
    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ValueListenableBuilder<List<Product>>(
              valueListenable: notifier,
              builder:
                  (BuildContext context, List<Product> value, Widget? child) {
                /*  return value != null
                    ? RefreshIndicator(
                        onRefresh: () async {
                          return await notifier.reload(
                              "category_id", id.toString(), 10);
                        }, */
                return value.isEmpty
                    ? ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: 1,
                        itemBuilder: (BuildContext context, int index) {
                          return const Center(child: Text('No Product!'));
                        })
                    : NotificationListener<ScrollNotification>(
                        onNotification: (ScrollNotification scrollInfo) {
                          if (scrollInfo is ScrollEndNotification &&
                              scrollInfo.metrics.extentAfter == 0) {
                            _loadData(true);
                            setState(() {
                              isLoading = true;
                            });
                            return true;
                          }
                          if (scrollInfo is ScrollEndNotification &&
                              scrollInfo.metrics.minScrollExtent == 0) {
                            _loadData(false);
                            setState(() {
                              isLoading = true;
                            });
                            return true;
                          }
                          return false;
                        },
                        child: ListView.separated(
                            separatorBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Divider(),
                                ),
                            padding: EdgeInsets.only(top: 20),
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemCount: value.length,
                            cacheExtent: 5,
                            itemBuilder: (BuildContext context, int index) {
                              return ProductInfo(product: value[index]);
                            }),
                      );
                // : Center(child: CircularProgressIndicator());
              }),
        ),
        Container(
          height: isLoading ? 50.0 : 0,
          color: Colors.transparent,
          child: Center(
            child: new CircularProgressIndicator(),
          ),
        ),
      ],
    );
  }
}
