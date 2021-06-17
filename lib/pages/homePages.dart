import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cocktail_one/data/model/receipe_model.dart';
import 'package:cocktail_one/pages/showDetailPage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class HomePages extends StatefulWidget {
  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  @override
  void initState() {
    super.initState();
    getDrinks();
  }

  RecipeMargaritaCocktail drink;
  final String url =
      'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita';

  getDrinks() async {
    var resp = await http.get(Uri.parse(url));
    var json = jsonDecode(resp.body);
    setState(() {
      drink = RecipeMargaritaCocktail.fromJson(json);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appbar(),
      body: drink != null
          ? ListView(
              physics: BouncingScrollPhysics(),
              children: drink.drinks
                  .map((e) => Padding(
                        padding: EdgeInsets.only(
                          left: size.width * 0.02,
                          right: size.width * 0.02,
                          bottom: size.height * 0.02,
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    ShowDetailPage(recipeMargaritaCocktail: e),
                              ),
                            );
                          },
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(18),
                                child: Container(
                                  height: size.height * 0.3,
                                  child: CachedNetworkImage(
                                    height: size.height,
                                    width: size.width,
                                    imageUrl: e.strDrinkThumb,
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                          colorFilter: ColorFilter.mode(
                                              Colors.red.withOpacity(0.4),
                                              BlendMode.colorBurn),
                                        ),
                                      ),
                                    ),
                                    placeholder: (context, url) => Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(18),
                                child: Container(
                                  height: 250,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [
                                          Colors.black.withOpacity(0.9),
                                          Colors.black.withOpacity(0.1),
                                        ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.center),
                                  ),
                                ),
                              ),
                              Positioned(
                                  bottom: size.height * 0.015,
                                  left: size.width * 0.03,
                                  child: Text(
                                    e.strDrink,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: Theme.of(context)
                                          .textTheme
                                          .headline6
                                          .fontSize,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ))
                  .toList(),
            )
          : Container(),
    );
  }

  Widget appbar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        'Cocktail One',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      centerTitle: true,
    );
  }
}
