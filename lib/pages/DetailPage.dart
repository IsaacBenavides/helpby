import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mydoctor/Widget/Categories.dart';
import 'package:mydoctor/Widget/Constants.dart';
import 'package:mydoctor/Widget/CustomDivider.dart';
import 'package:mydoctor/Widget/PriceAndButton.dart';
import 'package:mydoctor/tab/model/benefitsModels.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final radiusOfAppBar = Radius.circular(20.0);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 0,
            elevation: 0,
            backgroundColor: Colors.transparent,
            expandedHeight: 240.0,
            pinned: false,
            floating: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                      bottomLeft: radiusOfAppBar, bottomRight: radiusOfAppBar),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Positioned(
                      left: 20,
                      top: 30,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                              size: 19,
                            ),
                          ),
                        ),
                      ),
                    ),
                    //aqui se puede poner una imagen
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              _Components(),
              Container(
                height: 100,
              ),
              Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 10,
                        spreadRadius: 1,
                        offset: Offset(0.0, -3))
                  ],
                  borderRadius: BorderRadius.only(
                      topLeft: radiusOfAppBar, topRight: radiusOfAppBar),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: PriceAndButton(),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class _Components extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Examen de salud básico',
            style: TextStyle(
                color: titleColor,
                fontWeight: FontWeight.w600,
                fontSize: 20,
                fontFamily: 'Poppins'),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            textExample,
            maxLines: 2,
            style: TextStyle(color: secondColor),
          ),
          SizedBox(
            height: 10,
          ),
          Categories(),
          SizedBox(
            height: 20,
          ),
          CustomDivider(),
          SizedBox(
            height: 10,
          ),
          PriceAndButton(),
          SizedBox(
            height: 10,
          ),
          CustomDivider(),
          SizedBox(
            height: 10,
          ),
          Benifits(),
          CustomDivider(),
          SizedBox(
            height: 10,
          ),
          OurProcess(),
          SizedBox(
            height: 10,
          ),
          CustomDivider(),
          SizedBox(
            height: 10,
          ),
          Our13Test(),
          SizedBox(
            height: 10,
          ),
          Our4Categories(),
        ],
      ),
    );
  }
}

class Benifits extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 330,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10, top: 10),
            child: Text("Tus beneficios",
                style: TextStyle(
                    color: titleColor, fontFamily: 'Poppins', fontSize: 20)),
          ),
          SubBenefits(),
        ],
      ),
    );
  }
}

class SubBenefits extends StatelessWidget {
  Widget build(BuildContext context) {
    final _widht = MediaQuery.of(context).size.width;
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          benefit.length,
          (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue.withOpacity(0.15),
                    radius: 25,
                    child: SvgPicture.asset(
                      benefit[index].icon,
                      height: 35,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: _widht - 120,
                          child: Text(
                            benefit[index].title,
                            style: TextStyle(
                                color: secondColor,
                                fontSize: _widht > 422 ? 20 : 15,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 3),
                          width: _widht - _widht * 0.38,
                          child: Text(
                            benefit[index].subtitle,
                            style: TextStyle(
                              fontSize: _widht > 422 ? 15 : 13,
                              color: secondColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class OurProcess extends StatelessWidget {
  final Map<int, String> process = {
    1: 'Nuestros enfermeros vienen a su lugar para tomar muestra.',
    2: 'Lleve su muestra a los centros de salud para analizarla.',
    3: 'El resultado se envía a su teléfono a través de la aplicación EVEC.',
    4: 'Nuestro médico se pondrá en contacto y le dará una consulta.'
  };
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              'Nuestro proceso',
              style: TextStyle(
                  fontSize: 20, color: titleColor, fontFamily: 'Poppins'),
            ),
          ),
          Column(
            children: List.generate(
              process.keys.length,
              (index) => SubProcess(
                process: process,
                index: index,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SubProcess extends StatelessWidget {
  final Map<int, String> process;
  final int index;

  const SubProcess({Key key, @required this.process, @required this.index})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return (index >= 0 && index < 3)
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomCircleavatar(
                process: process,
                index: index,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 4, horizontal: 15),
                width: 2,
                height: 18,
                color: circleAvatorColor,
              )
            ],
          )
        : CustomCircleavatar(
            process: process,
            index: index,
          );
  }
}

class CustomCircleavatar extends StatelessWidget {
  final Map<int, String> process;
  final int index;

  const CustomCircleavatar(
      {Key key, @required this.process, @required this.index})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        CircleAvatar(
          radius: 16,
          backgroundColor: circleAvatorColor,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 14,
            child: Center(
              child: Text('${process.keys.toList()[index]}'),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 10),
          width: _width * 0.75,
          child: Text(
            process.values.toList()[index],
            style: TextStyle(color: secondColor),
          ),
        ),
      ],
    );
  }
}

class Our13Test extends StatelessWidget {
  List<String> test = [
    'Urea',
    'Creatinina',
    'Glucosa',
    'Colesterol LDL',
    'HDL cholest',
    'Triglicérido',
    'GGT',
    'Colesterol',
    'SGOT',
    'Análisis de orina',
    'CBC'
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        test.length,
        (index) {
          return index == 0
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, top: 5),
                  child: Text(
                    'Nuestros 13 Test',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      color: titleColor,
                    ),
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        test[index],
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Poppins',
                            color: subtitleColor),
                      ),
                    ),
                    CustomDivider(),
                  ],
                );
        },
      ),
    );
  }
}

class Our4Categories extends StatelessWidget {
  List<String> _categories = [
    'Exámenes de gestión interna',
    'Radiografía',
    'ECG',
    'Descripción general de la ecografía abdominal en color'
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        _categories.length + 1,
        (index) {
          return (index == 0)
              ? Text(
                  'Nuestros 4 Chequeos',
                  style: TextStyle(
                      color: titleColor, fontFamily: 'Poppins', fontSize: 20),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        _categories[index - 1],
                        style: TextStyle(
                            color: subtitleColor, fontFamily: 'Poppins'),
                      ),
                    ),
                    CustomDivider()
                  ],
                );
        },
      ),
    );
  }
}
