import 'package:flutter/material.dart';
import 'package:notevia/controller/global_setting_provider.dart';
import 'package:notevia/controller/home_provider.dart';
import 'package:notevia/model/model_category.dart';
import 'package:notevia/view/components/buttons/change_theme_button_widget.dart';
import 'package:notevia/view/ui/add_transaction_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<DropdownMenuItem<int>> get dropdownItems {
    List<DropdownMenuItem<int>> menuItems = [
      const DropdownMenuItem(child: Text("All"), value: 0),
      const DropdownMenuItem(child: Text("Canadaaaaaaaaaaaaaa"), value: 1),
      const DropdownMenuItem(child: Text("USA"), value: 2),
      const DropdownMenuItem(child: Text("Engfland"), value: 3),
    ];
    return menuItems;
  }

  int selectedValue = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() => context.read<HomeProvider>().getCategoriesRequest());
  }

  @override
  Widget build(BuildContext context) {
    double swiperWidth = MediaQuery.of(context).size.width - 36;
    double swiperHeight = 260;

    HomeProvider _homeProvider = Provider.of(context);

    GlobalSettingProvider _globalSettingProvider =
        Provider.of(context, listen: false);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.pink,
          actions: const [
            ChangeThemeButtonWidget(),
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 38,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          // Card(
                          //   clipBehavior: Clip.antiAliasWithSaveLayer,
                          //   elevation: 6,
                          //   margin: const EdgeInsets.symmetric(
                          //       horizontal: 12, vertical: 0),
                          //   color: _globalSettingProvider.isDarkMode
                          //       ? const Color(0xFF2c3037)
                          //       : Colors.white,
                          //   shape: RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.circular(18)),
                          //   child: InkWell(
                          //     onTap: () {
                          //       Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //           builder: (context) =>
                          //               const AddCategoryPage(),
                          //         ),
                          //       );
                          //     },
                          //     child: Icon(Icons.add_rounded,
                          //         size: 44,
                          //         color: _globalSettingProvider.isDarkMode
                          //             ? Colors.white
                          //             : Colors.black),
                          //   ),
                          // ),
                        ],
                      ),
                      SizedBox(
                        height: 260,
                        child: ListView(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: SizedBox(
                                width: swiperWidth,
                                child: Card(
                                  color: _homeProvider.currentCategoryIndex ==
                                          -1
                                      ? Theme.of(context).backgroundColor
                                      : Theme.of(context).unselectedWidgetColor,
                                  elevation: 14,
                                  // shadowColor: Theme.of(context).shadowColor,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 10),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: _homeProvider
                                                  .currentCategoryIndex ==
                                              -1
                                          ? _globalSettingProvider.isDarkMode
                                              ? const BorderSide(
                                                  color: Colors.white, width: 3)
                                              : BorderSide.none
                                          : BorderSide.none),
                                  child: InkWell(
                                    onTap: () {
                                      _homeProvider.setCurrentCategoryIndex =
                                          -1;
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                        children: [
                                          Text(
                                            "All",
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: _homeProvider
                                                          .currentCategoryIndex ==
                                                      -1
                                                  ? Theme.of(context)
                                                      .textTheme
                                                      .bodyText1
                                                      ?.color
                                                  : Theme.of(context)
                                                      .textTheme
                                                      .bodyText2
                                                      ?.color,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 12,
                                          ),
                                          ListTile(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 4),
                                            tileColor: _homeProvider
                                                        .currentCategoryIndex ==
                                                    -1
                                                ? Theme.of(context)
                                                    .listTileTheme
                                                    .selectedColor
                                                : Theme.of(context)
                                                    .listTileTheme
                                                    .tileColor,
                                            title: Text(
                                              '135,000',
                                              style: TextStyle(
                                                color: _homeProvider
                                                            .currentCategoryIndex ==
                                                        -1
                                                    ? Theme.of(context)
                                                        .textTheme
                                                        .bodyText1
                                                        ?.color
                                                    : Theme.of(context)
                                                        .textTheme
                                                        .bodyText2
                                                        ?.color,
                                              ),
                                            ),
                                            trailing: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 12.0),
                                              child: Text(
                                                'ورودی',
                                                style: TextStyle(
                                                  color: _homeProvider
                                                              .currentCategoryIndex ==
                                                          -1
                                                      ? Theme.of(context)
                                                          .textTheme
                                                          .bodyText1
                                                          ?.color
                                                      : Theme.of(context)
                                                          .textTheme
                                                          .bodyText2
                                                          ?.color,
                                                ),
                                              ),
                                            ),
                                            leading: Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(14),
                                              ),
                                              elevation: 0,
                                              color: _homeProvider
                                                          .currentCategoryIndex ==
                                                      -1
                                                  ? Colors.green.withOpacity(.8)
                                                  : Colors.green
                                                      .withOpacity(.7),
                                              child: const Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Icon(Icons.moving),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          ListTile(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 4),
                                            tileColor: _homeProvider
                                                        .currentCategoryIndex ==
                                                    -1
                                                ? Theme.of(context)
                                                    .listTileTheme
                                                    .selectedColor
                                                : Theme.of(context)
                                                    .listTileTheme
                                                    .tileColor,
                                            title: Text(
                                              '135,000',
                                              style: TextStyle(
                                                color: _homeProvider
                                                            .currentCategoryIndex ==
                                                        -1
                                                    ? Theme.of(context)
                                                        .textTheme
                                                        .bodyText1
                                                        ?.color
                                                    : Theme.of(context)
                                                        .textTheme
                                                        .bodyText2
                                                        ?.color,
                                              ),
                                            ),
                                            trailing: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 12.0),
                                              child: Text(
                                                'خروجی',
                                                style: TextStyle(
                                                  color: _homeProvider
                                                              .currentCategoryIndex ==
                                                          -1
                                                      ? Theme.of(context)
                                                          .textTheme
                                                          .bodyText1
                                                          ?.color
                                                      : Theme.of(context)
                                                          .textTheme
                                                          .bodyText2
                                                          ?.color,
                                                ),
                                              ),
                                            ),
                                            leading: Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(14),
                                              ),
                                              elevation: 0,
                                              color: _homeProvider
                                                          .currentCategoryIndex ==
                                                      -1
                                                  ? Colors.red.withOpacity(.8)
                                                  : Colors.red.withOpacity(.7),
                                              child: const Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Icon(Icons.moving),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: itemSwiper,
                              itemCount: _homeProvider.categories.length,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          // Card(
                          //   clipBehavior: Clip.antiAliasWithSaveLayer,
                          //   elevation: 6,
                          //   margin: const EdgeInsets.symmetric(
                          //       horizontal: 12, vertical: 0),
                          //   color: _globalSettingProvider.isDarkMode
                          //       ? const Color(0xFF2c3037)
                          //       : Colors.white,
                          //   shape: RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.circular(18)),
                          //   child: InkWell(
                          //     onTap: () {
                          //       Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //           builder: (context) =>
                          //               const AddTransactionPage(),
                          //         ),
                          //       );
                          //     },
                          //     child: Icon(Icons.add_rounded,
                          //         size: 38,
                          //         color: _globalSettingProvider.isDarkMode
                          //             ? Colors.white
                          //             : Colors.black),
                          //   ),
                          // ),
                          Spacer(),
                          Icon(Icons.keyboard_arrow_down_rounded),
                          Text(
                            'هزینه ها',
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(width: 20),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      ListView.builder(
                        padding: const EdgeInsets.only(bottom: 28),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: itemList,
                        scrollDirection: Axis.vertical,
                        itemCount: _homeProvider.transactions.length,
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                ),
                elevation: 16,
                shadowColor: Theme.of(context).shadowColor,
                color: Theme.of(context).primaryColor,
                margin: EdgeInsets.zero,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Row(
                    children: [
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        elevation: 0,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(18),
                              bottomRight: Radius.circular(18)),
                        ),
                        color: Theme.of(context).cardColor,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 20),
                        child: InkWell(
                          onTap: () {},
                          child: const Padding(
                            padding: EdgeInsets.only(
                                right: 8.0, left: 20, top: 8, bottom: 8),
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Card(
                          // margin: EdgeInsets.only(top: 50),
                          color: Theme.of(context).cardColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18)),
                          elevation: 0,
                          child: SizedBox(
                            height: 43,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 16.0, right: 10),
                              child: DropdownButton<int>(
                                  underline: const SizedBox(),
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: Theme.of(context).iconTheme.color,
                                  ),
                                  elevation: 0,
                                  dropdownColor: Theme.of(context).cardColor,
                                  value: selectedValue,
                                  onChanged: (int? newValue) {
                                    setState(() {
                                      selectedValue = newValue!;
                                    });
                                  },
                                  borderRadius: BorderRadius.circular(18),
                                  // iconEnabledColor: Colors.black,
                                  menuMaxHeight: 360,
                                  isExpanded: true,
                                  items: dropdownItems),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 18,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              'وضعیت',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          Row(
                            children: const [
                              Text(
                                'تومان',
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '135,000',
                                style: TextStyle(fontSize: 30),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          notchMargin: 6,
          shape: const CircularNotchedRectangle(),
          // child: Row(
          //   children: [
          //     Expanded(
          //       child: ImageIcon(
          //         AssetImage('assets/images/s_home.png'),
          //         size: 25,
          //         color: Colors.black,
          //       ),
          //     ),
          //     Expanded(
          //       child: ImageIcon(
          //         AssetImage('assets/images/s_home.png'),
          //         size: 25,
          //         color: Colors.black,
          //       ),
          //     ),
          //     Spacer(),
          //     Expanded(
          //       child: ImageIcon(
          //         AssetImage('assets/images/s_home.png'),
          //         size: 25,
          //         color: Colors.black,
          //       ),
          //     ),
          //     Expanded(
          //       child: ImageIcon(
          //         AssetImage('assets/images/s_home.png'),
          //         size: 25,
          //         color: Colors.black,
          //       ),
          //     ),
          //   ],
          // ),
          child: Container(
            height: 60,
            child: Row(
              children: List.generate(
                5,
                (index) => index == 2
                    ? const Spacer()
                    : const Expanded(
                        child: ImageIcon(
                          AssetImage('assets/images/s_home.png'),
                          size: 25,
                          color: Colors.black,
                        ),
                      ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddTransactionPage(),
              ),
            );
          },
          child: const Icon(Icons.add_rounded),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked);
  }

  Widget itemSwiper(BuildContext context, int index) {
    GlobalSettingProvider _globalSettingProvider =
        Provider.of(context, listen: false);

    HomeProvider _homeProvider = context.watch<HomeProvider>();

    ModelCategory modelCategory = _homeProvider.categories[index];

    double swiperWidth = MediaQuery.of(context).size.width - 36;
    double swiperHeight = 260;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: SizedBox(
        width: swiperWidth,
        child: Card(
          color: _homeProvider.currentCategoryIndex == index
              ? Theme.of(context).backgroundColor
              : Theme.of(context).unselectedWidgetColor,
          elevation: 14,
          // shadowColor: Theme.of(context).shadowColor,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: _homeProvider.currentCategoryIndex == index
                  ? _globalSettingProvider.isDarkMode
                      ? const BorderSide(color: Colors.white, width: 3)
                      : BorderSide.none
                  : BorderSide.none),
          child: InkWell(
            onTap: () {
              _homeProvider.setCurrentCategoryIndex = index;
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    modelCategory.name!,
                    style: TextStyle(
                      fontSize: 20,
                      color: _homeProvider.currentCategoryIndex == index
                          ? Theme.of(context).textTheme.bodyText1?.color
                          : Theme.of(context).textTheme.bodyText2?.color,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 4),
                    tileColor: _homeProvider.currentCategoryIndex == index
                        ? Theme.of(context).listTileTheme.selectedColor
                        : Theme.of(context).listTileTheme.tileColor,
                    title: Text(
                      '135,000',
                      style: TextStyle(
                        color: _homeProvider.currentCategoryIndex == index
                            ? Theme.of(context).textTheme.bodyText1?.color
                            : Theme.of(context).textTheme.bodyText2?.color,
                      ),
                    ),
                    trailing: Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Text(
                        'ورودی',
                        style: TextStyle(
                          color: _homeProvider.currentCategoryIndex == index
                              ? Theme.of(context).textTheme.bodyText1?.color
                              : Theme.of(context).textTheme.bodyText2?.color,
                        ),
                      ),
                    ),
                    leading: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      elevation: 0,
                      color: _homeProvider.currentCategoryIndex == index
                          ? Colors.green.withOpacity(.8)
                          : Colors.green.withOpacity(.7),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.moving),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 4),
                    tileColor: _homeProvider.currentCategoryIndex == index
                        ? Theme.of(context).listTileTheme.selectedColor
                        : Theme.of(context).listTileTheme.tileColor,
                    title: Text(
                      '135,000',
                      style: TextStyle(
                        color: _homeProvider.currentCategoryIndex == index
                            ? Theme.of(context).textTheme.bodyText1?.color
                            : Theme.of(context).textTheme.bodyText2?.color,
                      ),
                    ),
                    trailing: Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Text(
                        'خروجی',
                        style: TextStyle(
                          color: _homeProvider.currentCategoryIndex == index
                              ? Theme.of(context).textTheme.bodyText1?.color
                              : Theme.of(context).textTheme.bodyText2?.color,
                        ),
                      ),
                    ),
                    leading: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      elevation: 0,
                      color: _homeProvider.currentCategoryIndex == index
                          ? Colors.red.withOpacity(.8)
                          : Colors.red.withOpacity(.7),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.moving),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget itemList(context, int index) {
    HomeProvider _homeProvider = Provider.of(context);
    return SizedBox(
      height: 65,
      child: Card(
        elevation: 0,
        margin: EdgeInsets.zero,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Row(
          children: [
            const SizedBox(
              width: 16,
            ),
            const Text(
              'تومان',
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(
              width: 4,
            ),
            Text(_homeProvider.transactions[index]['amount']),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Facebook'),
                Text(
                  'June 10 - 02:30 AM',
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
            const SizedBox(
              width: 12,
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              elevation: 0,
              color: Colors.red.withOpacity(.7),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.moving),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
          ],
        ),
      ),
    );
  }
}
