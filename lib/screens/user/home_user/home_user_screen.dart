import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:liberty/constants.dart';
import 'package:liberty/models/product_manager_brasil/product_one_brasil.dart';
import 'package:liberty/models/user_manager.dart';
import 'package:liberty/word/brasil/UmBrasil.dart';
import 'package:provider/provider.dart';

class HomeUserScreen extends StatelessWidget {
  static String routeName = "/HomeUserScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF5624D0),
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Texto",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
          leading: IconButton(
            icon: SvgPicture.asset("assets/icons/menu_3.svg"),
            onPressed: () {

              Navigator.of(context).pushNamed('/ProfileScreen');
            },
          ),
        ),
        backgroundColor: const Color(0xFF5624D0),
        body: SafeArea(
          bottom: false,
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                    ),
                    child: Consumer<UserManager>(
                      builder: (_, userManager, __) {
                        return Row(
                          children: <Widget>[
                            Text(
                              'Olá, ${userManager.user.name}',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const Spacer(),
                            Row(
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    '${userManager.user.photoUrl}',
                                  ),
                                  maxRadius: 30,
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    )),
                const SizedBox(height: TonyPadding / 2),
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(top: 70),
                        decoration: BoxDecoration(
                          color: kBackgroundColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                      ),

                      ListView(
                        children: <Widget>[

                          Container(
                            height: 5000,
                            child: Consumer<ProductOneBrasil>(
                                builder: (_, ProductOneBrasil, __) {
                              return ListView.builder(
                                itemCount: ProductOneBrasil
                                    .allProductsOneBrasil.length,
                                itemBuilder: (_, index) {
                                  return UmBrasil(ProductOneBrasil
                                      .allProductsOneBrasil[index]);
                                },
                              );
                            }),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
