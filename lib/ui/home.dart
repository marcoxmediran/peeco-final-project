import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peeco_final_project/ui/palette.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void decrementCounter() {
    setState(() {
      counter--;
    });
  }

  void setCounter(int c) {
    setState(() {
      counter = c;
    });
  }

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
                setCounter(0);
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
                showAboutDialog(
                  context: context,
                  children: [
                    const Center(
                      child: Text(
                        'A PEECO Final Project\nabout Renewable Energy.\nMade with love.',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 16),
                    InkWell(
                      onTap: () {
                        launchUrlString(
                            'https://www.un.org/en/climatechange/what-is-renewable-energy');
                      },
                      child: const ListTile(
                        leading: Icon(Icons.newspaper),
                        title: Text('Reference 1'),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        launchUrlString(
                            'https://www.nrdc.org/stories/renewable-energy-clean-facts#sec-whatis');
                      },
                      child: const ListTile(
                        leading: Icon(Icons.newspaper),
                        title: Text('Reference 2'),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        launchUrlString(
                            'https://github.com/marcoxmediran/peeco-final-project');
                      },
                      child: const ListTile(
                        leading: Icon(Icons.newspaper),
                        title: Text('Source Code'),
                      ),
                    ),
                  ],
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
            (counter > 0)
                ? IconButton(
                    onPressed: () {
                      decrementCounter();
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.easeInOutCubic,
                      );
                    },
                    icon: Icon(
                      Icons.chevron_left,
                      color: Palette.foregroundColor,
                    ),
                    iconSize: 48,
                  )
                : Container(),
            const Spacer(),
            (counter < 5)
                ? IconButton(
                    onPressed: () {
                      incrementCounter();
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.easeInOutCubic,
                      );
                    },
                    icon: Icon(
                      Icons.chevron_right,
                      color: Palette.foregroundColor,
                    ),
                    iconSize: 48,
                  )
                : Container(),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        children: const <Widget>[
          Introduction(),
          Page(
            header: 'Renewable Energy No. 1',
            title: 'Wind Energy',
            location: 'Oostende, Belgium',
            description:
                'Wind energy harnesses the power of wind to generate electricity using wind turbines. These turbines are often installed in windy areas, such as open plains, hilltops, or offshore locations. When wind moves the blades of a turbine, it spins a shaft connected to a generator, producing electricity. Wind energy is a clean and sustainable source of power that reduces greenhouse gas emissions and dependence on fossil fuels. Advances in technology have significantly increased the efficiency and capacity of wind turbines, making wind energy one of the fastest-growing renewable energy sources globally.',
            accentColor: Color.fromARGB(255, 136, 202, 217),
            url:
                'https://images.unsplash.com/photo-1654083198752-56ff209c8129?q=80&w=1471&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          ),
          Page(
            header: 'Renewable Energy No. 2',
            title: 'Solar Energy',
            location: 'Bubenreuth, Deutschland',
            description:
                'Solar energy captures sunlight and converts it into electricity or heat using photovoltaic (PV) panels or solar thermal collectors. PV panels, made from semiconductor materials like silicon, generate electricity when exposed to sunlight. Solar thermal systems use mirrors or lenses to concentrate sunlight, producing heat that can generate electricity or be used directly for heating. Solar energy is abundant, widely available, and generates no emissions during operation, making it an essential component of the renewable energy landscape.',
            accentColor: Color.fromARGB(255, 185, 147, 242),
            url:
                'https://images.unsplash.com/photo-1625301840055-7c1b7198cfc0?q=80&w=1471&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          ),
          Page(
            header: 'Renewable Energy No. 3',
            title: 'Hydro Energy',
            location: 'Marion County, Oregon',
            description:
                'Hydro energy, or hydropower, generates electricity by harnessing the energy of flowing or falling water. Dams or run-of-river systems are commonly used to capture this energy. In a dam-based system, water stored in a reservoir is released to flow through turbines, generating electricity. Run-of-river systems utilize the natural flow of rivers without large reservoirs. Hydropower is a reliable and efficient renewable energy source, capable of providing large-scale power generation and grid stability. It also offers benefits such as flood control, irrigation support, and water supply.',
            accentColor: Color.fromARGB(255, 203, 230, 140),
            url:
                'https://images.unsplash.com/photo-1561533115-f893e69758e9?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          ),
          Page(
            header: 'Renewable Energy No. 4',
            title: 'Geothermal Energy',
            location: 'Grand Prismatic Spring, Wyoming, USA',
            description:
                'Geothermal energy utilizes heat from the Earth\'s interior to generate electricity and provide heating. This heat originates from the Earth\'s core and the decay of radioactive materials in the crust. Geothermal power plants typically use steam produced from geothermal reservoirs to drive turbines and generate electricity. Geothermal energy is a stable and reliable source of power, capable of providing baseload electricity with minimal environmental impact. It is available 24/7, unaffected by weather conditions, making it a valuable complement to other renewable energy sources.',
            accentColor: Color.fromARGB(255, 232, 186, 133),
            url:
                'https://images.unsplash.com/photo-1629985692760-0683f26733e2?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          ),
          Page(
            header: 'Renewable Energy No. 5',
            title: 'Biomass Energy',
            location: 'Grasleben, Grasleben, Deutschland',
            description:
                'Biomass energy is produced from organic materials, such as plant matter, agricultural residues, and animal waste. These materials can be converted into electricity, heat, or biofuels through various processes, including combustion, anaerobic digestion, and gasification. Biomass energy is considered renewable because the carbon dioxide released during combustion is offset by the carbon dioxide absorbed by plants during their growth. It also helps reduce waste and can be a sustainable way to manage agricultural and forestry byproducts.',
            accentColor: Color.fromARGB(255, 162, 219, 240),
            url:
                'https://images.unsplash.com/photo-1673208769691-e74104d853fd?q=80&w=1332&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          ),
        ],
      ),
    );
  }
}

class Introduction extends StatelessWidget {
  const Introduction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 164,
            right: 164,
            bottom: 64,
            top: 196,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Marcox Mediran | BSCS 2-1',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    color: Palette.darkAccentColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Discover renewable, and\nsustainable energy.',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    color: Palette.foregroundColor,
                    fontSize: 70,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 80),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Environmental\nScience Topic',
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              color: Palette.foregroundColor,
                              fontSize: 40,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Renewable energy, often referred to as clean energy, are replenished at a higher rate than they are consumed. Sunlight and wind, for example, are such sources that are constantly being replenished. Renewable energy sources are plentiful and all around us. These sources are abundant, sustainable, and generate little to no greenhouse gas emissions or pollutants during energy production.',
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              color: Palette.darkAccentColor,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Flexible(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(color: Palette.darkAccentColor),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(height: 16),
                                Text(
                                  'Why use it?',
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                      color: Palette.lightAccentColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Uses and Benefits of\nUsing Renewable Energy',
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                      color: Palette.foregroundColor,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Generating renewable energy creates far lower emissions than burning fossil fuels. Renewables are also cheaper, and genereate 3 times more jobs than fossil fuels.',
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                      color: Palette.darkAccentColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 48),
                        Flexible(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(color: Palette.darkAccentColor),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(height: 16),
                                Text(
                                  'Classifications',
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                      color: Palette.lightAccentColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Text(
                                  'What are the 5 Types of\nRenewable Energy?',
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                      color: Palette.foregroundColor,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Text(
                                  'There are several types of renewable energies. For this IEC, wind, solar, hydro, geothermal, and biomass energies will be discussed on the following pages.',
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                      color: Palette.darkAccentColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Page extends StatelessWidget {
  final String header;
  final String title;
  final String location;
  final String description;
  final Color accentColor;
  final String url;

  const Page({
    super.key,
    required this.header,
    required this.title,
    required this.location,
    required this.description,
    required this.accentColor,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    var bg = Image.network(url);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const PageScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(image: bg.image, fit: BoxFit.cover),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Expanded(
                    child: Text(
                      title.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          color: Palette.foregroundColor,
                          fontSize: 64,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 50.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 64),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: Column(
                      children: [
                        Icon(
                          Icons.keyboard_double_arrow_down,
                          color: Palette.foregroundColor,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Scroll for more info',
                          style: TextStyle(
                            color: Palette.foregroundColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Palette.backgroundColor,
              ),
              child: Center(
                child: Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 32,
                        spreadRadius: 16,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Palette.cardColor,
                      ),
                      height: MediaQuery.of(context).size.height * 0.8,
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: bg.image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 16, left: 16),
                                  child: InkWell(
                                    onTap: () async {
                                      await launchUrlString(url);
                                    },
                                    child: ListTile(
                                      title: Text(
                                        location,
                                        style: GoogleFonts.inter(
                                          textStyle: TextStyle(
                                            color: Palette.foregroundColor,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      leading: Icon(
                                        Icons.explore,
                                        color: Palette.foregroundColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(48),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Spacer(),
                                  Text(
                                    header,
                                    style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                        fontSize: 18,
                                        color: accentColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: Text(
                                      title,
                                      style: GoogleFonts.inter(
                                        textStyle: TextStyle(
                                          color: Palette.foregroundColor,
                                          fontSize: 64,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 2,
                                    child: Text(
                                      description,
                                      textAlign: TextAlign.justify,
                                      style: GoogleFonts.inter(
                                        textStyle: TextStyle(
                                          fontSize: 18,
                                          color: Palette.foregroundColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
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
          ],
        ),
      ),
    );
  }
}
