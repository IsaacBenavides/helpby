import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mydoctor/Widget/Constants.dart';
import 'package:mydoctor/Widget/Search.dart';
import 'package:mydoctor/tab/model/CategoriesForCommunityModels.dart';

class CategoriesForCommunity extends StatelessWidget {
  const CategoriesForCommunity({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Categorias',
          style: TextStyle(color: titleColor, fontFamily: 'Poppins'),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            color: Colors.transparent,
            height: 30,
            width: 30,
            child: Icon(
              Icons.arrow_back_ios,
              size: 17,
              color: titleColor,
            ),
          ),
        ),
      ),
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Search(descriptions: 'Búsqueda por especialista'),
        Expanded(
          child: GridView.builder(
            itemCount: categorieForCommunity.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              childAspectRatio: 3.5,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {},
                child: Container(
                    padding: EdgeInsets.only(left: 30),
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(categorieForCommunity[index].route),
                        SizedBox(
                          width: 10,
                        ),
                        Text(categorieForCommunity[index].title)
                      ],
                    )),
              );
            },
          ),
        )
      ],
    );
  }
}
