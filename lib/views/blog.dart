import 'package:flutter/material.dart';

class Blog extends StatefulWidget {
  const Blog({super.key});

  @override
  State<Blog> createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios, color: Colors.white,),
        ),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset("lib/assets/images/blog_image.png"),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "25 Must See UNESCO World Heritage Sites",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "From supernatural stories to cultural legends, every UNESCO World Heritage Site has a tale to tell. There are over 1100 protected sites spread over 167 countries worldwide so there’s enough for you to discover! Here are the 25 Must-See UNESCO World Heritage Sites to check off your bucket list.",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    color: Colors.white),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "1. Bagan, Myanmar",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Bagan may just be the real-life ‘Fairy-tale’. Float in a hot air balloon across temples rising out of the mist and the green. Discover this legendary site of 2200+ temples in central Myanmar. It finally received its UNESCO status in 2019.",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            "https://images.pexels.com/photos/6534866/pexels-photo-6534866.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                            fit: BoxFit.cover,
                          ),
                        ))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "1. Bagan, Myanmar",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Bagan may just be the real-life ‘Fairy-tale’. Float in a hot air balloon across temples rising out of the mist and the green. Discover this legendary site of 2200+ temples in central Myanmar. It finally received its UNESCO status in 2019.",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            "https://images.pexels.com/photos/6534866/pexels-photo-6534866.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                            fit: BoxFit.cover,
                          ),
                        ))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "1. Bagan, Myanmar",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Bagan may just be the real-life ‘Fairy-tale’. Float in a hot air balloon across temples rising out of the mist and the green. Discover this legendary site of 2200+ temples in central Myanmar. It finally received its UNESCO status in 2019.",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            "https://images.pexels.com/photos/6534866/pexels-photo-6534866.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                            fit: BoxFit.cover,
                          ),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
