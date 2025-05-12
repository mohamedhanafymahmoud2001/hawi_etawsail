import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hawy_altawsil/componant/ImageView.dart';
import 'package:hawy_altawsil/prov/prov.dart';
import 'package:provider/provider.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeView();
}

class _HomeView extends State<HomeView> {
  late PageController _pageController;
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(viewportFraction: 1.0);

    Future.delayed(Duration.zero, () {
      final control = Provider.of<Control>(context, listen: false);
      if (control.home['data']?['banners'] != null) {
        final bannerCount = control.home['data']['banners'].length;

        if (bannerCount > 1) {
          _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
            if (_currentPage < bannerCount - 1) {
              _currentPage++;
            } else {
              _currentPage = 0;
            }
            if (_pageController.hasClients) {
              _pageController.animateToPage(
                _currentPage,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            }
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel(); // إيقاف المؤقت عند التخلص من الـ Widget
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      final banners = val.home['data']?['banners'];

      if (banners == null || banners.isEmpty) {
        return Center(child: CircularProgressIndicator());
      }

      return Directionality(
        textDirection: val.direction,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 16),
              Container(
                height: 230,
                width: MediaQuery.of(context).size.width,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: banners.length,
                  itemBuilder: (context, i) {
                    return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ImageViewBanner(
                            image: "${val.api.ip}/${banners[i]['image']}"));
                  },
                ),
              ),
              SizedBox(height: 16),
              HomeViewBody()
            ],
          ),
        ),
      );
    });
  }
}
