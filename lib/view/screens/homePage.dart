import 'package:card_swiper/card_swiper.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:geolocator/geolocator.dart';
import 'package:make_happy/view/screens/loginScreen.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../utility/mediaQuery.dart';
import 'cardinfo.dart';
import 'elderProfile.dart';


class HomePage extends StatefulWidget {
  final User user;
  const HomePage({required this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  late User _currentUser;
  bool _isSigningOut = false;

  int activeIndex = 0;

  bool fromBack = false;
  final PageController _pageController = PageController();

  @override
  void initState() {
    _currentUser = widget.user;
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Column(
          // children: [
          //   Text(
          //     'NAME: ${_currentUser.email}',
          //     style: Theme.of(context).textTheme.bodyText1,
          //   ),
          //   Text("hii man"),
          // ElevatedButton(
          //   onPressed: () {
          //    Navigator.push(context, MaterialPageRoute(builder: (context)=>ElderlySellerProfilesScreen()));
          //   },
          //   child: Text('Get Location'),
          // ),
          //
          //   ElevatedButton(
          //     onPressed: () async {
          //       setState(() {
          //         _isSigningOut = true;
          //       });
          //       await FirebaseAuth.instance.signOut();
          //       setState(() {
          //         _isSigningOut = false;
          //       });
          //       Navigator.of(context).pushReplacement(
          //         MaterialPageRoute(
          //           builder: (context) => LoginScreen(),
          //         ),
          //       );
          //     },
          //     child: Text('Sign out'),
          //     style: ElevatedButton.styleFrom(
          //       primary: Colors.red,
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(30),
          //       ),
          //     ),
          //   ),
          //   Container(
          //       height:300,width: MediaQueryHelper.screenWidth,child: CarouselWithIndicatorDemo()),
          //
          // ],

          children: [

            Container(
              height: 300,
                width: MediaQueryHelper.screenWidth,
                child: CarouselWithIndicatorDemo()),
            Container(
              height: 450,
              width: double.maxFinite,
              child: Swiper(
                onIndexChanged: (value) {
                  if (value > activeIndex) {
                    _pageController.nextPage(duration: 400.ms, curve: Curves.decelerate);
                    fromBack = false;
                  }
                  if (value < activeIndex) {
                    _pageController.previousPage(duration: 400.ms, curve: Curves.decelerate);
                    fromBack = true;
                  }
                  activeIndex = value;
                  setState(() {});
                },
                itemBuilder: (BuildContext context, int index) {
                  return SwipeCard(
                    price: listOfData[index]['price'],
                    isActive: activeIndex == index,
                    fromBack: fromBack,
                    title: listOfData[index]['name'],
                    image: listOfData[index]['image'],
                  );
                },
                itemCount: listOfData.length,
                loop: false,
                index: 0,
                itemWidth: 324.0,
                itemHeight: 420,
                layout: SwiperLayout.STACK,
                physics: const BouncingScrollPhysics(),
              ),
            ),
            Container(
              height: 148,
              child: PageView.builder(
                itemCount: listOfData.length,
                controller: _pageController,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return CardInfoWidget(
                    carName: listOfData[index]['name'],
                    year: listOfData[index]['year'],
                    hp: listOfData[index]['hp'],
                    speed: listOfData[index]['speed'],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}


final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];
class CarouselWithIndicatorDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;
  final CarouselController _controller = CarouselController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          child: CarouselSlider(
            items: imageSliders,
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: true,
                viewportFraction: 1.0,
                enlargeCenterPage: true,
                aspectRatio:  2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ]),
    );
  }
}
final List<Widget> imageSliders = imgList
    .map((item) => Container(
  child: Container(
    margin: EdgeInsets.all(5.0),
    child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: <Widget>[
            Image.network(item, fit: BoxFit.cover, width: 1000.0),

            Positioned(

              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(200, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                child: Text(
                  'No. ${imgList.indexOf(item)} image',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

          ],
        )),
  ),
))
    .toList();














class SwipeCard extends StatefulWidget {
  const SwipeCard({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.isActive,
    required this.fromBack,
  });
  final String title;
  final String image;
  final String price;

  final bool isActive;
  final bool fromBack;

  @override
  State<SwipeCard> createState() => _SwipeCardState();
}

class _SwipeCardState extends State<SwipeCard> {
  bool isSwiped = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: const Color(0xFFDEDEDE),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            spreadRadius: 0.5,
            blurRadius: 0.5,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: 350,
            height: 220,
            child: Visibility(
              visible: widget.isActive,
              child: Image.network(
                widget.image,
                fit: BoxFit.fitHeight,
              ),
            ),
          )
              .animate(target: widget.isActive ? 1 : 0)
          // car will come form left or right
              .moveX(begin: widget.fromBack ? -300 : 300, delay: 110.ms, duration: 250.ms, curve: Curves.easeOutCirc)
              .then(delay: 600.ms)
          // then move car forward
              .moveX(end: 100)
              .then()
          // then zoom in 2x
              .scaleXY(end: 2, delay: 200.ms, duration: 1000.ms)
              .then()
          // then move while zoomed in 2x
              .moveX(end: -400, duration: 2000.ms)
              .then()
          // then zoomed view end zoom out back to original size
              .scaleXY(end: 0.5, delay: 300.ms, duration: 500.ms)
              .then()
              .moveX(end: 100, duration: 1000.ms),
          Container(
            padding: const EdgeInsets.all(24),
            color: Colors.grey.shade100,
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  maxLines: 1,
                  style: const TextStyle(color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  "From \$${widget.price}",
                  style: const TextStyle(color: Colors.black54, fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


List<Map> listOfData = [
  {
    'name': '911 GT3',
    'shortDescription': '',
    'year': '2022',
    'hp': '503',
    'speed': '198',
    'price': '1,61,100',
    'image':
    'https://files.porsche.com/filestore/image/multimedia/none/992-gt3-modelexplorer/normal/6bcbc899-51bd-11eb-80d1-005056bbdc38;sO;twebp/porsche-normal.webp'
  },
  {
    'name': '911 Turbo S',
    'shortDescription': '',
    'year': '2023',
    'hp': '640',
    'speed': '205',
    'price': '1,84,500',
    'image':
    'https://files.porsche.com/filestore/image/multimedia/none/992-tus-modelexplorer-01/normal/308346f4-b15c-11ea-80ca-005056bbdc38;sO;twebp/porsche-normal.webp'
  },
  {
    'name': 'Taycan Turbo Cross Turismo',
    'shortDescription': '',
    'year': '2023',
    'hp': '616',
    'speed': '155',
    'price': '1,97,500',
    'image':
    'https://files.porsche.com/filestore/image/multimedia/none/j1-taycan-turbo-cross-turismo-modelexplorer/normal/538d7a9f-7837-11eb-80d3-005056bbdc38;sO;twebp/porsche-normal.webp'
  },
  {
    'name': 'Taycan GTS',
    'shortDescription': '',
    'year': '2022',
    'hp': '590',
    'speed': '155',
    'price': '1,34,500',
    'image':
    'https://files.porsche.com/filestore/image/multimedia/none/j1-taycan-gts-modelexplorer-image/normal/c92737c9-365d-11ec-80e2-005056bbdc38;sO;twebp/porsche-normal.webp'
  },
  {
    'name': 'Taycan Turbo S',
    'shortDescription': '',
    'year': '2020',
    'hp': '616',
    'speed': '161',
    'price': '1,94,900',
    'image':
    'https://files.porsche.com/filestore/image/multimedia/none/j1-taycan-tus-modelexplorer-01/normal/24fe8655-7837-11eb-80d3-005056bbdc38;sN;twebp/porsche-normal.webp'
  },
];