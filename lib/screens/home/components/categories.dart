import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:magento_mobile/bloc/categories_bloc.dart';
import 'package:magento_mobile/models/categories_models.dart';
import 'package:magento_mobile/models/login_modal.dart';
import 'package:magento_mobile/repository/categories_repository.dart';
import 'package:magento_mobile/screens/show_more/show_more.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../size_config.dart';
import '../../../utils.dart';

class Categories extends StatelessWidget {
  List<Map<String, dynamic>> categories = [];
  @override
  Widget build(BuildContext context) {
    logd(getProportionateScreenWidth(55));
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(getProportionateScreenWidth(20), 0,
          getProportionateScreenWidth(20), 0),
      height: getProportionateScreenHeight(120),
      //width: getProportionateScreenWidth(75),
      child: FutureBuilder(
          future: CategoriesBloc().doGetCategoriesList(1, 4),
          builder: (context, AsyncSnapshot<CategoriesListModal> snapShot) {
            if (snapShot.hasData && snapShot.data != null) {
              logd("worth it ${snapShot.data?.childrenData[0].childrenData}");
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      separatorBuilder: (BuildContext context, int index) =>
                          Divider(
                        thickness: 15,
                        indent: 12,
                      ),
                      itemCount:
                          snapShot.data!.childrenData[0].childrenData.length,
                      itemBuilder: (context, index) {
                        return CategoryCard(
                          icon: snapShot
                              .data!.childrenData[0].childrenData[index].id
                              .toString(),
                          text: snapShot
                              .data!.childrenData[0].childrenData[index].name,
                          press: () {
                            Navigator.pushNamed(context, ShowMore.routeName);
                          },
                        );
                      },
                    ),
                  )
                ],
              );
            } else
              return Text("Category will show here");
          }),
    );
  }

  makeCategory(CategoriesListModal value) {
    categories.add(value.toMap());
    int ff = value.childrenData.elementAt(0).childrenData.elementAt(1).id;
    print(ff);
    //CategoriesBloc().doGetCategoryImg(ff, 1);
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    logd("label is $icon");
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(5)),
                //height: double.infinity,
                width: getProportionateScreenWidth(75),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: FutureBuilder(
                  future: CategoriesBloc().doGetCategoryImg(icon, 1),
                  builder: (context, AsyncSnapshot<String> snapshot) {
                    //logd(snapshot.data);
                    if (snapshot.hasData)
                      return iconBuilder(snapshot.data!);
                    else
                      return Text("Category Icon Should Be Here");
                  },
                ),
              ),
            ),
          ),
          //SizedBox(height: 5),
          Text(text, textAlign: TextAlign.center)
        ],
      ),
    );
  }
}

iconBuilder(String icon) {
  return CachedNetworkImage(
    imageUrl: icon,
    //CategoriesBloc().doGetCategoryImg().then((value) => return value;),
    imageBuilder: (context, imageProvider) => Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
            colorFilter:
                ColorFilter.mode(Color(0xFFFFECDF), BlendMode.colorBurn)),
      ),
    ),
    placeholder: (context, url) => CircularProgressIndicator(),
  );
}
