import 'package:cached_network_image/cached_network_image.dart';
import 'package:cocktail_one/data/model/receipe_model.dart';
import 'package:flutter/material.dart';

class ShowDetailPage extends StatefulWidget {
  final Drinks recipeMargaritaCocktail;
  ShowDetailPage({this.recipeMargaritaCocktail});
  @override
  _ShowDetailPageState createState() => _ShowDetailPageState();
}

class _ShowDetailPageState extends State<ShowDetailPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            CachedNetworkImage(
              height: size.height,
              width: size.width,
              imageUrl: widget.recipeMargaritaCocktail.strDrinkThumb,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.red.withOpacity(0.6), BlendMode.colorBurn),
                  ),
                ),
              ),
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.9),
                    Colors.black.withOpacity(0.3),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                ),
              ),
            ),
            Positioned(
              bottom: size.height * 0.04,
              left: size.width * 0.01,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  makeText(context,
                      textString: widget.recipeMargaritaCocktail.strDrink,
                      fontWeight: FontWeight.bold,
                      size: Theme.of(context).textTheme.headline6.fontSize),
                  SizedBox(height: size.height * 0.005),
                  makeText(context,
                      textString: widget.recipeMargaritaCocktail.strIBA ??
                          "Occasional Cocktail ",
                      fontWeight: FontWeight.bold,
                      size: Theme.of(context).textTheme.bodyText1.fontSize),
                  SizedBox(height: size.height * 0.005),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amberAccent,
                        size: 20,
                      ),
                      SizedBox(
                        width: size.width * 0.005,
                      ),
                      makeText(
                        context,
                        textString: '4.5',
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.005),
                  makeText(
                    context,
                    textString: 'Instructions',
                    fontWeight: FontWeight.bold,
                    size: Theme.of(context).textTheme.bodyText1.fontSize,
                  ),
                  makeText(
                    context,
                    textString: widget.recipeMargaritaCocktail.strInstructions,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            Positioned(
              right: size.width * 0.01,
              bottom: size.height * 0.15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  makeText(
                    context,
                    textString: "Ingredients",
                    fontWeight: FontWeight.bold,
                    size: Theme.of(context).textTheme.headline5.fontSize,
                  ),
                  SizedBox(height: size.height * 0.013),
                  makeText(
                    context,
                    textString:
                        widget.recipeMargaritaCocktail.strMeasure1 ?? "1 oz",
                    fontWeight: FontWeight.bold,
                    size: Theme.of(context).textTheme.bodyText1.fontSize,
                  ),
                  makeText(
                    context,
                    textString:
                        widget.recipeMargaritaCocktail.strIngredient1 ?? "",
                    fontWeight: FontWeight.bold,
                    size: 18,
                  ),
                  SizedBox(height: size.height * 0.02),
                  makeText(
                    context,
                    textString:
                        widget.recipeMargaritaCocktail.strMeasure2 ?? "1 oz",
                    fontWeight: FontWeight.bold,
                    size: Theme.of(context).textTheme.bodyText1.fontSize,
                  ),
                  makeText(
                    context,
                    textString:
                        widget.recipeMargaritaCocktail.strIngredient2 ?? "",
                    fontWeight: FontWeight.bold,
                    size: 18,
                  ),
                  SizedBox(height: size.height * 0.02),
                  makeText(
                    context,
                    textString:
                        widget.recipeMargaritaCocktail.strMeasure3 ?? "1 oz",
                    fontWeight: FontWeight.bold,
                    size: Theme.of(context).textTheme.bodyText1.fontSize,
                  ),
                  makeText(
                    context,
                    textString:
                        widget.recipeMargaritaCocktail.strIngredient3 ?? "",
                    fontWeight: FontWeight.bold,
                    size: 18,
                  ),
                  SizedBox(height: size.height * 0.02),
                  makeText(
                    context,
                    textString:
                        widget.recipeMargaritaCocktail.strMeasure4 ?? "",
                    fontWeight: FontWeight.bold,
                    size: Theme.of(context).textTheme.bodyText1.fontSize,
                  ),
                  makeText(
                    context,
                    textString:
                        widget.recipeMargaritaCocktail.strIngredient4 ?? "",
                    fontWeight: FontWeight.bold,
                    size: 18,
                  ),
                  SizedBox(height: size.height * 0.02),
                  makeText(
                    context,
                    textString:
                        widget.recipeMargaritaCocktail.strMeasure5 ?? "",
                    fontWeight: FontWeight.bold,
                    size: Theme.of(context).textTheme.bodyText1.fontSize,
                  ),
                  makeText(
                    context,
                    textString:
                        widget.recipeMargaritaCocktail.strIngredient5 ?? "",
                    fontWeight: FontWeight.bold,
                    size: 18,
                  ),
                ],
              ),
            ),
            Positioned(
              left: size.width * 0.005,
              top: size.height * 0.005,
              child: IconButton(
                icon: Icon(
                  Icons.clear,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget makeText(
    BuildContext context, {
    String textString,
    FontWeight fontWeight,
    Color color,
    double size,
  }) {
    return Text(
      textString,
      style: TextStyle(
        color: color ?? Colors.white,
        fontWeight: fontWeight,
        fontSize: size,
      ),
    );
  }
}
