import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:notevia/controller/global_setting_provider.dart';
import 'package:notevia/view/components/buttons/change_theme_button_widget.dart';
import 'package:provider/provider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class AddCategoryPage extends StatefulWidget {
  const AddCategoryPage({Key? key}) : super(key: key);

  @override
  State<AddCategoryPage> createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage> {
  late bool _isSelected;

  int index = 0;

  final List<Map> data = List.generate(
      10, (index) => {'Name': 'Name $index', 'isSelected': false});

  List<String> items = [
    'All',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item81',
    'Item82',
    'Item83',
    'Item84',
    'Item85',
    'Item86',
    'Item87',
    'Item88',
  ];

  String selectedValue = "All";

  @override
  Widget build(BuildContext context) {
    GlobalSettingProvider _globalSettingProvider =
        Provider.of(context, listen: false);

    double swiperWidth = MediaQuery.of(context).size.width - 36;
    double swiperHeight = 260;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        actions: const [
          ChangeThemeButtonWidget(),
        ],
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: SizedBox(
            width: swiperWidth,
            height: swiperHeight,
            child: Card(
              color: data[index]['isSelected'] == true
                  ? Theme.of(context).listTileTheme.selectedColor
                  : Theme.of(context).listTileTheme.tileColor,
              elevation: 24,
              // shadowColor: Theme.of(context).shadowColor,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                // side: _globalSettingProvider.isDarkMode
                //     ? const BorderSide(color: Colors.white, width: 3)
                //     : BorderSide.none,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextField(
                      cursorColor: _globalSettingProvider.isDarkMode == true
                          ? Colors.white
                          : Colors.black,
                      cursorHeight: 26,
                      decoration: InputDecoration(
                          hintText: 'نام دسته بندی',
                          hintStyle: TextStyle(
                            fontSize: 18,
                            color: data[index]['isSelected'] == true
                                ? Theme.of(context).textTheme.bodyText1?.color
                                : Theme.of(context).textTheme.bodyText2?.color,
                          ),
                          // enabledBorder: UnderlineInputBorder(
                          //   borderSide: BorderSide(
                          //       color: _globalSettingProvider.isDarkMode == true
                          //           ? Colors.white
                          //           : Colors.black),
                          // ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: _globalSettingProvider.isDarkMode == true
                                    ? Colors.white
                                    : Colors.black),
                          )),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    CustomDropdownButton2(
                      hint: '',
                      value: selectedValue,
                      dropdownItems: items,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue = newValue!;
                        });
                      },
                      itemHeight: 48,
                      buttonHeight: 48,
                      buttonWidth: 300,
                      dropdownHeight: 200,
                      dropdownWidth: 300,
                      dropdownDecoration: BoxDecoration(
                        // color: _globalSettingProvider.isDarkMode == true
                        //     ? Colors.blueGrey
                        //     : Colors.grey[200],

                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      buttonDecoration: BoxDecoration(
                        // color: _globalSettingProvider.isDarkMode == true
                        //     ? Colors.blueGrey
                        //     : Colors.grey[200],

                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      buttonElevation: 0,
                      dropdownElevation: 0,
                      iconSize: 20,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    MaterialButton(
                      height: 48,
                      onPressed: () {},
                      child: const Text(
                        'ایجاد',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      // color: Colors.blueGrey.withOpacity(0.9),
                      color: const Color(0xFF69bdb2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
