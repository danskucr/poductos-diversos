import 'package:flutter/material.dart';
import 'package:productos_diversos/constants/colors/palette.dart';
import 'package:productos_diversos/data/models/productos/productos_model.dart';


class CarouselImage extends StatefulWidget {
  Producto producto;
  CarouselImage({super.key, required this.producto});

  @override
  State<CarouselImage> createState() => _CarouselImageState();
}

class _CarouselImageState extends State<CarouselImage> {
int activePage = 0;
late PageController _pageController;
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
          color: currentIndex == index ? ColorsPalette().greenAquaPD: ColorsPalette().greyPD,
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
              itemCount: widget.producto.imagen.length,
              pageSnapping: true,
              controller: _pageController,
              itemBuilder: (context, pagePosition) {
                    bool active = pagePosition == activePage;
                    return slider(widget.producto.imagen,pagePosition,active);
              },
              onPageChanged: (page) {
                setState(() {
                  activePage = page;
                });
              }),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: indicators(widget.producto.imagen.length,activePage)
        )
        ],
    );
  }
}