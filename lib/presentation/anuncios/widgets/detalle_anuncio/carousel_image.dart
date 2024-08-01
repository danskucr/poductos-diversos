import 'package:flutter/material.dart';


class CarouselImage extends StatefulWidget {
  const CarouselImage({super.key});

  @override
  State<CarouselImage> createState() => _CarouselImageState();
}

class _CarouselImageState extends State<CarouselImage> {
int activePage = 0;
late PageController _pageController;
  List<String> images = [
    "https://i.imgur.com/hyHKXnJ.png",
    "https://i.imgur.com/mEbgQGH.png",
    "https://i.imgur.com/pjElZDJ.png",
    "https://i.imgur.com/MOgZDU4.png"
  ];
  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8,initialPage: 0);
  }
List<Widget> indicators(imagesLength,currentIndex) {
  return List<Widget>.generate(imagesLength, (index) {
    return Container(
      margin: EdgeInsets.all(3),
      width: 10,
      height: 20,
      decoration: BoxDecoration(
          color: currentIndex == index ? Colors.white : Colors.white54,
          shape: BoxShape.circle),
    );
  });
}
AnimatedContainer slider(images,pagePosition,active){
  double margin = active ? 10 : 20;
  return AnimatedContainer(
    duration: Duration(milliseconds: 500),
    curve: Curves.easeInOutCubic, 
    margin: EdgeInsets.all(margin),
    decoration: BoxDecoration(
      image: DecorationImage(image: NetworkImage(images[pagePosition]))
    ),
    );
}
@override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 300,
          child: PageView.builder(
              itemCount: images.length,
              pageSnapping: true,
              controller: _pageController,
              itemBuilder: (context, pagePosition) {
                    //checking active position
                    bool active = pagePosition == activePage;
                    return slider(images,pagePosition,active);
              },
              onPageChanged: (page) {
                setState(() {
                  activePage = page;
                });
              }),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: indicators(images.length,activePage)
        )
        ],
    );
  }
}