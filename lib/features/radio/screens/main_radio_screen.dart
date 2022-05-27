import 'package:aorl_apps_getx/features/radio/models/bank_list_model.dart';
import 'package:aorl_apps_getx/features/radio/models/gender_model.dart';
import 'package:aorl_apps_getx/router/route_name.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/radio_controllers.dart';
import 'components/card_bank_list.dart';

class MainRadioScreen extends StatelessWidget {
  MainRadioScreen({Key? key}) : super(key: key);

  final radioC = Get.find<RadioController>();

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('rebuild MainRadioScreen');
    }
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text('Radio GetX'),
      ),
      floatingActionButton: MaterialButton(
        onPressed: () {
          if (radioC.selectedGenders.value == 'Male') {
            Get.toNamed(RouteName.maleScreen);
          } else {
            Get.toNamed(
              RouteName.femaleScreen,
              arguments: radioC.banks[radioC.selectedBank.value],
            );
            print(radioC.selectedBank.value);
          }
        },
        child: const Text('Go To Next Screen'),
      ),
      body: Center(
        child: Card(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: radioC.gendersLenght(),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (ctx, index) => (radioC.genders[index].label ==
                        'Female' ||
                    radioC.genders[index].label == 'Male')
                ? Obx(
                    () => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RadioListTile(
                          title: Text(radioC.genders[index].label),
                          value: radioC.genders[index].label,
                          groupValue: radioC.selectedGenders.value,
                          onChanged: (value) {
                            radioC.onChangedGender(value);
                            if (kDebugMode) {
                              print('tapped: ${radioC.selectedGenders.value}');
                            }
                          },
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 36.0 * 2),
                          child: Column(
                            children: [
                              (radioC.genders[index].label == 'Female')
                                  ? Column(
                                      children: [
                                        Text(
                                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
                                          style: ThemeData.light()
                                              .textTheme
                                              .bodyText2,
                                          textAlign: TextAlign.justify,
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        CardBankList(radioC: radioC),
                                      ],
                                    )
                                  : (radioC.genders[index].label == 'Male')
                                      ? Column(
                                          children: const [
                                            Text('Male'),
                                            Text('Male'),
                                            Text('Male'),
                                          ],
                                        )
                                      : Container(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(),
          ),
        ),
      ),
    );
  }
}
