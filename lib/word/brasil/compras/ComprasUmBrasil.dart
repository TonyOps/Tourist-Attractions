import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:liberty/models/product.dart';
import 'package:liberty/models/product_manager_brasil/product_one_brasil.dart';
import 'package:liberty/models/user_manager.dart';
import 'package:liberty/screens/login/sign/components/default_message_button.dart';
import 'package:liberty/tamanho_config.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:url_launcher/url_launcher.dart';

class ComprasUmBrasil extends StatelessWidget {
  const ComprasUmBrasil(this.product);

  final Product product;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double defaultSize = SizeConfig.defaultSize;
    TextStyle lightTextStyle = TextStyle(color: CTonyCorTexto.withOpacity(0.6));
    return Scaffold(
      backgroundColor: CTonyColor,
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/arrow-long-left.svg"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: CTonyColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Liberty',
          style: TextStyle(
            color: Colors.black38,
            fontSize: 26,
            //fontFamily: 'stalker2',
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                width: SizeConfig.defaultSize,
              ),
              SizedBox(
                width: double.infinity,
                height: SizeConfig.orientation == Orientation.landscape
                    ? SizeConfig.screenWidth
                    : SizeConfig.screenHeight - AppBar().preferredSize.height,
                child: Stack(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: defaultSize * 2),
                      height: defaultSize * 37.5,
                      width: defaultSize *
                          (SizeConfig.orientation == Orientation.landscape
                              ? 35
                              : 15),
                      //color: Colors.amber,
                      child: SafeArea(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Local".toUpperCase(), style: lightTextStyle),
                            SizedBox(height: defaultSize),
                            AutoSizeText(
                              product.officeJob,
                              maxLines: 1,
                              minFontSize: 10,
                              style: TextStyle(
                                fontSize: defaultSize * 2.1,
                                fontWeight: FontWeight.bold,
                                letterSpacing: -0.8,
                                height: 1.4,
                              ),
                            ),
                            SizedBox(height: defaultSize * 2),
                            Text("Criado em:", style: lightTextStyle),
                            Text(
                              product.date,
                              style: TextStyle(
                                fontSize: defaultSize * 1.6,
                                fontWeight: FontWeight.bold,
                                height: 1.6,
                              ),
                            ),
                            SizedBox(height: defaultSize * 2),
                            Text("Redes Sociais", style: lightTextStyle),
                            Row(
                              children: <Widget>[
                                Container(
                                  child: IconButton(
                                    icon: SvgPicture.asset(
                                        "assets/icons/facebook.svg"),
                                    onPressed: () async {
                                      var facebookUrl = '${product.facebook}';
                                      if (await canLaunch(facebookUrl)) {
                                        await launch(facebookUrl);
                                      } else {
                                        throw 'Could not launch $facebookUrl';
                                      }
                                    },

                                  ),
                                  margin: EdgeInsets.only(
                                      top: defaultSize, right: defaultSize),
                                  height: defaultSize * 4.5,
                                  width: defaultSize * 4.5,
                                  decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                                Container(
                                  child: IconButton(
                                    icon: SvgPicture.asset(
                                        "assets/icons/twitter.svg"),
                                    onPressed: () async {
                                      var twitterUrl = '${product.twitter}';
                                      if (await canLaunch(twitterUrl)) {
                                        await launch(twitterUrl);
                                      } else {
                                        throw 'Could not launch $twitterUrl';
                                      }
                                    },
                                  ),
                                  margin: EdgeInsets.only(
                                      top: defaultSize, right: defaultSize),
                                  height: defaultSize * 4.5,
                                  width: defaultSize * 4.5,
                                  decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    child: IconButton(
                                      icon: SvgPicture.asset(
                                          "assets/icons/instagram-sketched.svg"),
                                      onPressed: () async {
                                        var instagramUrl =
                                            '${product.instagram}';
                                        if (await canLaunch(instagramUrl)) {
                                          await launch(instagramUrl);
                                        } else {
                                          throw 'Could not launch $instagramUrl';
                                        }
                                      },
                                    ),
                                    margin: EdgeInsets.only(
                                        top: defaultSize, right: defaultSize),
                                    height: defaultSize * 4.5,
                                    width: defaultSize * 4.5,
                                    decoration: BoxDecoration(
                                      color: Colors.black12,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
                                  Container(
                                    child: IconButton(
                                      icon: SvgPicture.asset(
                                          "assets/icons/email.svg"),
                                      onPressed: () async {
                                        final Uri params = Uri(
                                          scheme: 'mailto',
                                          path: '${product.email}',
                                          query:
                                              'subject=Reportar&body=Detalhe aqui qual bug você encontrou: ',
                                        );
                                        String url = params.toString();
                                        if (await canLaunch(url)) {
                                          await launch(url);
                                        } else {
                                          print('Could not launch $url');
                                        }
                                      },
                                    ),
                                    margin: EdgeInsets.only(
                                        top: defaultSize, right: defaultSize),
                                    height: defaultSize * 4.5,
                                    width: defaultSize * 4.5,
                                    decoration: BoxDecoration(
                                      color: Colors.black12,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: defaultSize * 37.5,
                      left: 0,
                      right: 0,
                      child: Container(
                        constraints:
                            BoxConstraints(minHeight: defaultSize * 44),
                        padding: EdgeInsets.only(
                            top: defaultSize * 9,
                            left: defaultSize * 2,
                            right: defaultSize * 2),
                        //height: 500,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(defaultSize * 1.2),
                            topRight: Radius.circular(defaultSize * 1.2),
                          ),
                        ),
                        child: SafeArea(
                          child: Column(
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: defaultSize * 3),
                              Text(
                                product.name,
                                style: TextStyle(
                                  fontSize: defaultSize * 1.8,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              //SizedBox(height: defaultSize * 3),
                              SizedBox(height: defaultSize * 3),
                              Container(
                                child: Text(
                                  product.description,
                                  style: TextStyle(
                                    color: CTonyCorTexto.withOpacity(0.7),
                                    height: 1.5,
                                  ),
                                ),
                              ),
                              SizedBox(height: defaultSize * 3),
                              SizedBox(
                                  width: double.infinity,
                                  child:
                                      Consumer2<UserManager, ProductOneBrasil>(
                                          builder:
                                              (_, userManager, product, __) {
                                    return DefaultMessageButton(
                                      text: "Mensagem",
                                      press: () {
                                        Navigator.of(context).pushNamed(
                                            '/ChatScreen',
                                            arguments: product);
                                        //Navigator.push(
                                        //context,
                                        //MaterialPageRoute(
                                        // builder:
                                        // (BuildContext context) =>
                                        //ChatScreen()));
                                      },
                                    );
                                  })),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: defaultSize * 9.5,
                      right: -defaultSize * 7.5,
                      child: Hero(
                        tag: '${product.id}',
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: product.photos.first,
                          height: defaultSize * 37.8,
                          width: defaultSize * 36.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
