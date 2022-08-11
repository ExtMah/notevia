import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:notevia/controller/global_setting_provider.dart';
import 'package:notevia/view/components/buttons/change_theme_button_widget.dart';
import 'package:provider/provider.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({Key? key}) : super(key: key);

  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  late bool _isSelected;

  int index = 0;

  final List<Map> data = List.generate(
      10, (index) => {'Name': 'Name $index', 'isSelected': false});

  List<String> items = [
    'دسته بندی',
    'Item2',
    'Item3',
  ];

  String selectedValue = "دسته بندی";

  final TextEditingController _categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    GlobalSettingProvider _globalSettingProvider =
        Provider.of(context, listen: false);

    double swiperWidth = MediaQuery.of(context).size.width - 36;
    double swiperHeight = 500;

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
                        hintText: 'نام هزینه',
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
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomDropdownButton2(
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
                              //     ? const Color(0xFF3787a1)
                              //     : Colors.grey[200],

                              color: Theme.of(context).cardColor,

                              // color: const Color(0xFF69bdb2),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            buttonDecoration: BoxDecoration(
                              // color: _globalSettingProvider.isDarkMode == true
                              //     ? const Color(0xFF3787a1)
                              //     : Colors.grey[200],

                              color: Theme.of(context).cardColor,

                              // color: const Color(0xFF69bdb2),

                              borderRadius: BorderRadius.circular(18),
                            ),
                            buttonElevation: 1,
                            dropdownElevation: 1,
                            iconSize: 20,
                          ),
                        ),
                        Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          elevation: 3,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 0),
                          // color: _globalSettingProvider.isDarkMode
                          //     ? const Color(0xFF2c3037)
                          //     : Colors.white,
                          color: Theme.of(context).cardColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18)),
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                context: context,
                                builder: (context) => Container(
                                  margin: MediaQuery.of(context).viewInsets,
                                  height: 200,
                                  color: data[index]['isSelected'] == true
                                      ? Theme.of(context)
                                          .listTileTheme
                                          .selectedColor
                                      : Theme.of(context)
                                          .listTileTheme
                                          .tileColor,
                                  // color: Colors.white,
                                  child: Column(
                                    children: [
                                      TextField(
                                        controller: _categoryController,
                                        cursorColor:
                                            _globalSettingProvider.isDarkMode ==
                                                    true
                                                ? Colors.white
                                                : Colors.black,
                                        cursorHeight: 26,
                                        decoration: InputDecoration(
                                          hintText: 'نام دسته بندی',
                                          hintStyle: TextStyle(
                                            fontSize: 18,
                                            color: data[index]['isSelected'] ==
                                                    true
                                                ? Theme.of(context)
                                                    .textTheme
                                                    .bodyText1
                                                    ?.color
                                                : Theme.of(context)
                                                    .textTheme
                                                    .bodyText2
                                                    ?.color,
                                          ),
                                          // enabledBorder: UnderlineInputBorder(
                                          //   borderSide: BorderSide(
                                          //       color: _globalSettingProvider.isDarkMode == true
                                          //           ? Colors.white
                                          //           : Colors.black),
                                          // ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: _globalSettingProvider
                                                            .isDarkMode ==
                                                        true
                                                    ? Colors.white
                                                    : Colors.black),
                                          ),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      // TextField(
                                      //   controller: _categoryController,
                                      // ),
                                      const SizedBox(
                                        height: 26,
                                      ),
                                      // ElevatedButton(
                                      //   onPressed: () {
                                      //     String? catName =
                                      //         _categoryController.text;
                                      //     if (catName != '') {
                                      //       if (items.contains(catName)) {
                                      //         Navigator.pop(context);
                                      //         ScaffoldMessenger.of(context)
                                      //             .showSnackBar(const SnackBar(
                                      //                 content: Text('dari')));
                                      //         return;
                                      //       }
                                      //
                                      //       items.add(catName);
                                      //       setState(() {
                                      //         _categoryController.clear();
                                      //         Navigator.pop(context);
                                      //       });
                                      //     }
                                      //   },
                                      //   child: const Text('Add'),
                                      // ),
                                      MaterialButton(
                                        elevation: 6,
                                        height: 48,
                                        onPressed: () {
                                          String? catName =
                                              _categoryController.text;
                                          if (catName != '') {
                                            if (items.contains(catName)) {
                                              Navigator.pop(context);
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                      content: Text('dari')));
                                              return;
                                            }

                                            items.add(catName);
                                            setState(() {
                                              _categoryController.clear();
                                              Navigator.pop(context);
                                            });
                                          }
                                        },
                                        child: const Text(
                                          'ایجاد',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                        color: Colors.blueGrey.shade700,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            child: Icon(Icons.add_rounded,
                                size: 42,
                                color: _globalSettingProvider.isDarkMode
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Row(
                      children: [
                        Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          color: data[index]['isSelected'] == true
                              ? Colors.green.withOpacity(.8)
                              : Colors.green.withOpacity(.7),
                          child: InkWell(
                            onTap: () {},
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.moving),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          color: data[index]['isSelected'] == true
                              ? Colors.red.withOpacity(.8)
                              : Colors.red.withOpacity(.7),
                          child: InkWell(
                            onTap: () {},
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.moving),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text('تومان'),
                        Container(
                          padding: const EdgeInsets.only(left: 6),
                          width: 160,
                          child: TextField(
                            cursorColor:
                                _globalSettingProvider.isDarkMode == true
                                    ? Colors.white
                                    : Colors.black,
                            cursorHeight: 26,
                            decoration: InputDecoration(
                                hintText: 'مقدار',
                                hintStyle: TextStyle(
                                  fontSize: 18,
                                  color: data[index]['isSelected'] == true
                                      ? Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.color
                                      : Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          ?.color,
                                ),
                                // enabledBorder: UnderlineInputBorder(
                                //   borderSide: BorderSide(
                                //       color:
                                //           _globalSettingProvider.isDarkMode == true
                                //               ? Colors.white
                                //               : Colors.black),
                                // ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          _globalSettingProvider.isDarkMode ==
                                                  true
                                              ? Colors.white
                                              : Colors.black),
                                )),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 58,
                    ),
                    MaterialButton(
                      elevation: 6,
                      height: 48,
                      onPressed: () {},
                      child: const Text(
                        'ایجاد',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      // color: const Color(0xFF69bdb2),
                      color: Colors.blueGrey.shade700,
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
