import 'package:breaking_bad/controllers/load_characters_controller.dart';
import 'package:breaking_bad/screens/quotesPage.dart';
import 'package:breaking_bad/screens/searchCharactersPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'characterDetailsPage.dart';
class AllCharactersPage extends StatefulWidget {
  const AllCharactersPage({Key? key}) : super(key: key);

  @override
  State<AllCharactersPage> createState() => _AllCharactersPageState();
}

class _AllCharactersPageState extends State<AllCharactersPage> {
  final controller=Get.put(LoadCharactersController());
  int pageIndex = 0;

  final pages = [
    const AllCharactersPage(),
    const SearchCharactersPage(),
    const QuotesPage(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("BreakingBad",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 24,fontFamily: "Poppins",height: 2,color:Colors.green),),
      //   centerTitle: true,
      //   backgroundColor: Colors.white60,
      //   elevation: 0,
      //
      // ),
      // bottomNavigationBar:Container(
      // height: 60,
      // decoration: BoxDecoration(
      //   color: Colors.green.shade50,
      //   borderRadius: const BorderRadius.only(
      //     topLeft: Radius.circular(20),
      //     topRight: Radius.circular(20),
      //   ),
      // ),
      // child: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
      //   children: [
      //     IconButton(
      //       enableFeedback: false,
      //       onPressed: () {
      //         Get.offAll(AllCharactersPage());
      //       },
      //       icon: const Icon(
      //         Icons.home_filled,
      //         color: Colors.green,
      //         size: 35,
      //       ),
      //     ),
      //     IconButton(
      //       enableFeedback: false,
      //       onPressed: () {
      //         Get.offAll(SearchCharactersPage());
      //       },
      //       icon: const Icon(
      //         Icons.search_sharp,
      //         color: Colors.green,
      //         size: 35,
      //       ),
      //     ),
      //     IconButton(
      //       enableFeedback: false,
      //       onPressed: () {
      //         Get.offAll(QuotesPage());
      //       },
      //       icon: const Icon(
      //         Icons.format_quote_sharp,
      //         color: Colors.green,
      //         size: 35,
      //       ),
      //     ),
      //   ],
      // ),),
      body: CustomScrollView(

        slivers:[
          SliverAppBar(
            backgroundColor: Colors.green.withOpacity(0.2),
            expandedHeight: MediaQuery.of(context).size.height * 0.50,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text('Breaking Bad', textScaleFactor: 1,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 24,fontFamily: "Poppins",height: 2,color: Colors.tealAccent)),
              background: Image.asset("assets/breakingBad.jpg",fit: BoxFit.cover,),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (_, int index) {
                return Padding(
                  padding:  const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const Text("Characters",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 24,fontFamily: "Poppins",height: 2),),
                      Obx(()=> controller.isDataLoadingCharacter.isTrue?ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount:controller.allCharactersList.length ,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            var e = controller.allCharactersList[index];
                            var f=e.charId;
                            return Padding(
                              padding:  const EdgeInsets.only(bottom: 24),
                              child: InkWell(
                                onTap: () async{
                                  await controller.getSingleCharacterDetail('$f');
                                  Get.to(const CharactersDetailsPage());
                                },
                                child: Container(
                                  height: 150,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                      color: Colors.green.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(25),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(0.1),spreadRadius: 3,blurStyle: BlurStyle.inner
                                        )
                                      ]
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(

                                      children: [
                                        Container(height: Get.height/4,decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),width: Get.width/4,child: ClipRRect(borderRadius: BorderRadius.circular(25),child: Image.network("${e.img}",fit: BoxFit.cover,))),
                                        const SizedBox(width: 15,),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("${e.name}",style: const TextStyle(fontWeight: FontWeight.w800,fontSize: 16,fontFamily: "Poppins",height: 2)),
                                            Text("${e.birthday}",style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 12,fontFamily: "Poppins",height: 2)),
                                          ],
                                        )

                                      ],
                                    ),
                                  ),

                                ),
                              ),
                            );
                          }):Center(
                        child: LoadingAnimationWidget.inkDrop(

                          size: 25, color: Colors.green,
                        ),
                      ),),
                    ],
                  ),
                );
              },
              childCount: 20,
            ),
          ),

        ]
      ),
    );
  }
}
