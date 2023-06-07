import 'package:flutter/material.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
          title: Text(
            "Explore The World",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),
          ),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 160,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: InkWell(
                              onTap: (){},
                              child: Image.asset("lib/assets/images/hotels.png"),
                            ),
                          ),
                        ),
                        Container(
                          width: 160,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: InkWell(
                              onTap: (){},
                              child: Image.asset("lib/assets/images/restaurants.png"),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 160,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: InkWell(
                              onTap: (){},
                              child: Image.asset("lib/assets/images/temples.png"),
                            ),
                          ),
                        ),
                        Container(
                          width: 160,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: InkWell(
                              onTap: (){},
                              child: Image.asset("lib/assets/images/monuments.png"),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 160,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          onTap: (){},
                          child: Image.asset("lib/assets/images/landscapes.png"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Text("Blogs", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25),),
              Container(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Container(
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  "lib/assets/images/blog_image.png",
                                  fit: BoxFit.cover,
                                )),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Chandan Kashyap",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                                ),
                                Text(
                                  "Jan 22 2022",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                                )
                              ],
                            ),
                            Text("25 Must See UNESCO World Heritage Sites")
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
