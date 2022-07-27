import 'package:flutter/material.dart';
import 'package:fpsm_garces/home_page.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'controllers/data_class.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            if (Provider.of<DataClass>(context, listen: false).x <= 0) {
              Get.snackbar(
                "Item", "Can not decrease more",
                backgroundColor: Theme.of(context).primaryColor,
                colorText: Colors.white,
                duration: const Duration(milliseconds: 1500),
                //  titleText: const Text(
                //    "Item",
                //    style: TextStyle(
                //      fontSize: 40,
                //      color: Colors.white
                //    ),
                //  ),
                //  messageText: const Text(
                //    "Can not reduce more",
                //    style: TextStyle(
                //        fontSize: 20,
                //        color: Colors.white
                //    ),
                //  )
              );
            } else {
              Provider.of<DataClass>(context, listen: false).decrementX();
            }
          },
          icon: Icon(Icons.remove, color: Theme.of(context).primaryColor),
        ),
        title: Consumer<DataClass>(builder: (context, data, child) {
          return Text(
            'Total Count: ${data.x}',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Theme.of(context).primaryColor),
          );
        }),
      ),
      backgroundColor: const Color(0xFFfefcff),
      body: Container(
          padding: const EdgeInsets.all(10),
          width: double.maxFinite,
          height: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Consumer<DataClass>(builder: (context, data, child) {
                      return Text(
                        '${data.x}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      );
                    }),
                    Text(
                      "Subtract from Total",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Container(
                width: double.maxFinite,
                margin: const EdgeInsets.only(left: 40, right: 40),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (Provider.of<DataClass>(context, listen: false).x <=
                            0) {
                          Get.snackbar(
                            "Item", "Can not decrease more",
                            backgroundColor: Theme.of(context).primaryColor,
                            colorText: Colors.white,
                            duration: const Duration(milliseconds: 1500),
                            //  titleText: const Text(
                            //    "Item",
                            //    style: TextStyle(
                            //      fontSize: 40,
                            //      color: Colors.white
                            //    ),
                            //  ),
                            //  messageText: const Text(
                            //    "Can not reduce more",
                            //    style: TextStyle(
                            //        fontSize: 20,
                            //        color: Colors.white
                            //    ),
                            //  )
                          );
                        } else {
                          Provider.of<DataClass>(context, listen: false)
                              .decrementX();
                        }
                      },
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 1,
                                color: Theme.of(context).primaryColor)),
                        child: Icon(
                          Icons.remove,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        height: 60,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => const HomePage(),
                                transition: Transition.downToUp,
                                duration: const Duration(milliseconds: 500));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Icon(Icons.skip_previous,
                                  color: Color(0xFFfefeff)),
                              Text(
                                "Prev Page",
                                style: TextStyle(
                                    fontSize: 20, color: Color(0xFFfefeff)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
