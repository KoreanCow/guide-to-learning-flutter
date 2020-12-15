import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> dummyItems = [
  'https://cdn.pixabay.com/photo/2017/08/30/01/05/milky-way-2695569__340.jpg',
  'https://cdn.pixabay.com/photo/2017/03/28/22/55/night-photograph-2183637__340.jpg',
  'https://cdn.pixabay.com/photo/2015/03/26/09/59/purple-690724__340.jpg'
];

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _buildTop(),
        _buildMiddle(),
        _buildBottom(),
      ],
    );
  }

  Widget _buildTop() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20), // 위 아래 여백
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              InkWell(
                onTap: () {
                  print('클릭');
                },
                child: Column(
                  children: <Widget>[
                    Icon(Icons.local_taxi, size: 40),
                    Text('택시')
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  print('클릭');
                },
                child: Column(
                  children: <Widget>[
                    Icon(Icons.local_taxi, size: 40),
                    Text('블랙')
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  print('클릭');
                },
                child: Column(
                  children: <Widget>[
                    Icon(Icons.local_taxi, size: 40),
                    Text('바이크')
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  print('클릭');
                },
                child: Column(
                  children: <Widget>[
                    Icon(Icons.local_taxi, size: 40),
                    Text('대리')
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              InkWell(
                onTap: () {
                  print('클릭');
                },
                child: Column(
                  children: <Widget>[
                    Icon(Icons.local_taxi, size: 40),
                    Text('택시')
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  print('클릭');
                },
                child: Column(
                  children: <Widget>[
                    Icon(Icons.local_taxi, size: 40),
                    Text('블랙')
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  print('클릭');
                },
                child: Column(
                  children: <Widget>[
                    Icon(Icons.local_taxi, size: 40),
                    Text('바이크')
                  ],
                ),
              ),
              Opacity(
                opacity: 0.0,
                child: Column(
                  children: <Widget>[Icon(Icons.local_taxi), Text('대리')],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMiddle() {
    return CarouselSlider(
      options: CarouselOptions(
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 5),
          height: 200.0),
      items: dummyItems.map((index) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    index,
                    fit: BoxFit.cover,
                  ),
                ));
          },
        );
      }).toList(),
    );
  }

  Widget _buildBottom() {
    final items = List.generate(10, (index) {
      return ListTile(
        leading: Icon(Icons.notifications_none),
        title: (Text('[이벤트] 이것은 공지사항입니다.')),
      );
    });

    return ListView(
      physics: NeverScrollableScrollPhysics(), // 이 리스트의 스크롤 동작금지
      shrinkWrap: true, // 이 리스트가 다른 스크롤 객체 안에 있다면 true로 설정해야 함
      children: items,
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('페이지2'),
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('내정보'),
    );
  }
}
