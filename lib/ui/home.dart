import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:peeco_final_project/ui/palette.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 64,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                _pageController.animateToPage(
                  0,
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeInOutExpo,
                );
              },
              child: Text(
                'Home',
                style: TextStyle(
                  fontSize: 16,
                  color: Palette.foregroundColor,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
            const SizedBox(width: 24),
            TextButton(
              onPressed: () {
                _pageController.animateToPage(
                  4,
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeInOutExpo,
                );
              },
              child: Text(
                'About',
                style: TextStyle(
                  fontSize: 16,
                  color: Palette.foregroundColor,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Center(
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                _pageController.previousPage(
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeInOutCubic,
                );
              },
              icon: Icon(
                Icons.chevron_left,
                color: Palette.foregroundColor,
              ),
              iconSize: 64,
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeInOutCubic,
                );
              },
              icon: Icon(
                Icons.chevron_right,
                color: Palette.foregroundColor,
              ),
              iconSize: 64,
            ),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        children: const <Widget>[
          Page(
            title: 'Wind Energy',
            url:
                'https://images.unsplash.com/photo-1654083198752-56ff209c8129?q=80&w=1471&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          ),
          Page(
            title: 'Solar Energy',
            url:
                'https://images.unsplash.com/photo-1625301840055-7c1b7198cfc0?q=80&w=1471&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          ),
          Page(
            title: 'Hydro Energy',
            url:
                'https://images.unsplash.com/photo-1561533115-f893e69758e9?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          ),
          Page(
            title: 'Geothermal Energy',
            url:
                'https://images.unsplash.com/photo-1629985692760-0683f26733e2?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          ),
          Page(
            title: 'Biomass Energy',
            url:
                'https://images.unsplash.com/photo-1673208769691-e74104d853fd?q=80&w=1332&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          ),
        ],
      ),
    );
  }
}

class Page extends StatelessWidget {
  final String url;
  final String title;

  const Page({
    super.key,
    required this.title,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    var bg = Image.network(url);
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(image: bg.image, fit: BoxFit.cover),
              ),
              child: Center(
                child: Text(
                  title.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Palette.foregroundColor,
                    fontSize: 64,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 50.0,
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
