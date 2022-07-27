import 'package:flutter/material.dart';
import 'package:fpsm_garces/second_page.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'controllers/data_class.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            if (context.read<DataClass>().x >= 15) {
              Get.snackbar(
                "Item", "Can not more than this",
                backgroundColor: Theme.of(context).primaryColor,
                duration: const Duration(milliseconds: 1500),
                colorText: Colors.white,
                // titleText: const Text(
                //   "Item",
                //   style: TextStyle(
                //       fontSize: 40,
                //       color: Colors.white
                //   ),
                // ),
                // messageText: const Text(
                //   "Can not be more than this",
                //   style: TextStyle(
                //       fontSize: 20,
                //       color: Colors.white
                //   ),
                // )
              );
            } else {
              context.read<DataClass>().incrementX();
            }
          },
          icon: Icon(Icons.add, color: Theme.of(context).primaryColor),
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
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              children: [
                Consumer<DataClass>(builder: (context, data, child) {
                  return Text(
                    '${data.x}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  );
                }),
                const Spacer(),
                Text(
                  "Add to Total",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                      fontSize: 40),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              children: [
                GestureDetector(
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Theme.of(context).primaryColor, width: 1)),
                    child: Icon(
                      Icons.add,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  onTap: () {
                    if (context.read<DataClass>().x >= 15) {
                      Get.snackbar(
                        "Item", "Can not more than this",
                        backgroundColor: Theme.of(context).primaryColor,
                        duration: const Duration(milliseconds: 1500),
                        colorText: Colors.white,
                        // titleText: const Text(
                        //   "Item",
                        //   style: TextStyle(
                        //       fontSize: 40,
                        //       color: Colors.white
                        //   ),
                        // ),
                        // messageText: const Text(
                        //   "Can not be more than this",
                        //   style: TextStyle(
                        //       fontSize: 20,
                        //       color: Colors.white
                        //   ),
                        // )
                      );
                    } else {
                      context.read<DataClass>().incrementX();
                    }
                  },
                ),
                const Spacer(),
                Container(
                  height: 60,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).primaryColor),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Get.to(() => const SecondPage(),
                                  transition: Transition.upToDown,
                                  duration: const Duration(milliseconds: 500));
                            },
                            child: const Text(
                              "Next Page",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )),
                        const Spacer(),
                        const Icon(Icons.skip_next, color: Colors.white)
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
