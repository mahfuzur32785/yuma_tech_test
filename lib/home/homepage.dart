import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yuma_tech_test/api_service/api_service.dart';
import 'package:yuma_tech_test/auth/signinpage.dart';
import 'package:yuma_tech_test/model/data_model.dart';
import 'package:yuma_tech_test/provider/token_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, this.token}) : super(key: key);

  final String? token;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<DataModel> dataModel = [];

  bool isLoading = true;

  SharedPreferences? sharedPreferences;

  var token;

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    Provider.of<TokenProvider>(context, listen: false).getSignUpToken();

    dataModel = (await ApiService().getDataList())!;
    setState(() {
      // isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    token = Provider.of<TokenProvider>(context, listen: false).token;
    print('login token ${widget.token} bkjhfahbsf $token');
    var heilight = dataModel
        .where((element) => element.provider!.highlight == 1)
        .toSet()
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yuma Tech"),
        // leading: IconButton(onPressed: () async {
        //   sharedPreferences = await SharedPreferences.getInstance();
        //   sharedPreferences?.clear();
        //   setState(() {
        //
        //   });
        // }, icon: const Icon(Icons.arrow_back)),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 30, bottom: 30),
              child: Column(
                children: [
                  ///Top Search bar
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: "Search",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.grey.shade200),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  ///Sign in button
                  Visibility(
                    visible: widget.token.toString().isEmpty || token.toString().isEmpty,
                    child: SizedBox(
                      height: 45,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignPage(),
                              ));
                        },
                        child: const Text("Sign In"),
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.blue,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 220,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(5),
              // color: Colors.red,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(
                              1.0,
                              1.0,
                            ),
                            blurRadius: 5.0,
                            spreadRadius: 1.0,
                          ),
                        ]),
                    child: Column(
                      children: [
                        Image(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://admin.cashsmarts.co.uk/${heilight[index].provider?.backgroundImagePath}"),
                          height: 100,
                          width: double.infinity,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://admin.cashsmarts.co.uk/${heilight[index].provider?.imagePath}"),
                            ),
                            const SizedBox(width: 10,),
                            Column(
                              children: [
                                Text(
                                    "${heilight[index].provider!.businessName}"),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
                itemCount: heilight.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 10,
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(
                              1.0,
                              1.0,
                            ),
                            blurRadius: 5.0,
                            spreadRadius: 1.0,
                          ),
                        ]),
                    child: Column(
                      children: [
                        Image(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://admin.cashsmarts.co.uk/${dataModel[index].provider?.backgroundImagePath}"),
                          height: 100,
                          width: double.infinity,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://admin.cashsmarts.co.uk/${dataModel[index].provider?.imagePath}"),
                            ),
                            const SizedBox(width: 10,),
                            Column(
                              children: [
                                Text(
                                    "${dataModel[index].provider!.businessName}"),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemCount: dataModel.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
