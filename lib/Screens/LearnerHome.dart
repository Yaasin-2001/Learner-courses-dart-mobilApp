import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
//import 'package:learner_prokit/model/LearnerModels.dart';
import 'package:postgres/postgres.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:learner_prokit/model/LearnerFeaturedModel.dart';
import 'package:learner_prokit/model/LearnerCategoryModel.dart';

class LearnerHome extends StatefulWidget {
  @override
  _LearnerHomeState createState() => _LearnerHomeState();
}

class _LearnerHomeState extends State<LearnerHome> {
  late List<LearnerFeaturedModel> mList1 = [];
  late List<LearnerCategoryModel> mList2 = [];

  @override
  void initState() {
    super.initState();
    fetchFeaturedData();
    fetchCategoriesData();
  }

  void fetchFeaturedData() async {
    final connection = PostgreSQLConnection(
      '91.225.104.133',
      5432,
      'learning',
      username: 'learning',
      password: 'jI13K02U',
    );

    await connection.open();

    final results =
        await connection.query('SELECT * FROM learnerfeaturedmodel');
    List<LearnerFeaturedModel> featuredData = results.map((row) {
      return LearnerFeaturedModel(
        img: row[1],
        name: row[2],
        price: row[3],
        strikePrice: row[4],
        type: row[5],
      );
    }).toList();
    print(results);

    setState(() {
      mList1 = featuredData;
    });

    await connection.close();
  }

  void fetchCategoriesData() async {
    final connection = PostgreSQLConnection(
      '91.225.104.133',
      5432,
      'learning',
      username: 'learning',
      password: 'jI13K02U',
    );

    await connection.open();

    final results =
        await connection.query('SELECT * FROM learnercategorymodel');
    List<LearnerCategoryModel> categoriesData = results.map((row) {
      return LearnerCategoryModel(
        image: row[1],
        name: row[2],
      );
    }).toList();
    print(results);
    setState(() {
      mList2 = categoriesData;
    });

    await connection.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Featured',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('See All',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 270,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: mList1.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(right: 16),
                itemBuilder: (context, index) {
                  return LearnerFeatured(mList1[index]);
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16),
              child: Text('Categories',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ),
            SizedBox(height: 16),
            GridView.builder(
              scrollDirection: Axis.vertical,
              itemCount: mList2.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return LearnerCategory(mList2[index]);
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class LearnerFeatured extends StatelessWidget {
  final LearnerFeaturedModel model;

  LearnerFeatured(this.model);

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;

    return Container(
      width: MediaQuery.of(context).size.width * 0.35,
      margin: EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: CachedNetworkImage(
              placeholder: (context, url) => CircularProgressIndicator(),
              imageUrl: model.img,
              fit: BoxFit.cover,
              height: w * 0.4,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          SizedBox(height: 4),
          Padding(
            padding: EdgeInsets.only(left: 4, right: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(model.name, style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text(model.price, style: TextStyle(color: Colors.grey)),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class LearnerCategory extends StatelessWidget {
  final LearnerCategoryModel model;

  LearnerCategory(this.model);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: CachedNetworkImage(
                  placeholder: (context, url) => CircularProgressIndicator(),
                  imageUrl: model.image,
                  //fit: BoxFit.cover,
                  height: context.width() * 0.17,
                  width: context.width(),
                ),
              ),
              SizedBox(height: 8),
              Text(model.name, style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ],
    );
  }
}
