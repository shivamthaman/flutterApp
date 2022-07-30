import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oro/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import '../bloc/cubit/ekyc_cubit.dart';
import '../widget/circle_icon.dart';
import '../widget/dialog.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder:
              (BuildContext context, bool innerBoxIsScrolled) => [
            SliverAppBar(
              toolbarHeight: 80.0,
              backgroundColor: Theme.of(context).canvasColor,
              foregroundColor: Theme.of(context).colorScheme.onBackground,
              pinned: true,
              title: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 18,
                ),
                child: AppBarRow(),
              ),
            ),
          ],
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: const [
                HomeContainer(),
                SubTitileRow(title: "Advantages of Doorstep Lockers"),
                InfoCard(),
                SubTitileRow(title: "A sneak-peek into our Locker Space!"),
                VideoDialog(),
                SubTitileRow(title: "Where are your Locker Items stored?"),
                ImageListView(),
                SubTitileRow(title: "Safe & Secure Guarantee"),
                BottomBrand(),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        width: double.infinity,
        height: 60,
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              SizedBox(),
              Text('Access lockers at your doorstep.'),
              SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

class VideoDialog extends StatelessWidget {
  const VideoDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(12.0),
      child: SizedBox(
        width: double.infinity,
        height: 200,
        child: Card(
          child: Icon(
            Icons.play_arrow_outlined,
            size: 40,
          ),
        ),
      ),
    );
  }
}

class BottomBrand extends StatelessWidget {
  const BottomBrand({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(
          'assets/images/oro_logo.png',
          height: 50,
        ),
        Image.asset(
          'assets/images/g10.png',
          height: 50,
        ),
        Image.asset(
          'assets/images/ims1.png',
          height: 50,
        ),
      ],
    );
  }
}

class ImageListView extends StatelessWidget {
  const ImageListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      height: 150.0,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(left: 12),
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/1.png',
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}

class HomeContainer extends StatelessWidget {
  const HomeContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: double.infinity,
      color: Colors.white,
      child: Row(
        children: [
          const SizedBox(
            width: 12,
          ),
          Stack(
            children: [
              const Align(
                alignment: Alignment.center,
                child: VerticalDivider(
                  indent: 40,
                  endIndent: 40,
                  thickness: 1,
                  width: 40,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  CircleIcon(
                    enable: true,
                    icon: Icon(
                      CupertinoIcons.clock,
                      color: Colors.white,
                    ),
                  ),
                  CircleIcon(
                    enable: false,
                    icon: Icon(
                      Icons.check,
                      color: Colors.grey,
                    ),
                  ),
                  CircleIcon(
                    enable: false,
                    icon: Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            width: 30,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Current doorstep locker visit'.toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.grey),
              ),
              Text(
                'Locker',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                'We will confirm your request shortly.',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.grey),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.5,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.locker);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Locker Contents'),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(CupertinoIcons.right_chevron, size: 15),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AppBarRow extends StatelessWidget {
  const AppBarRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(CupertinoIcons.line_horizontal_3, size: 40),
        Image.asset(
          'assets/images/oro_logo.png',
          height: 50,
        ),
        InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return BlocProvider<EkycCubit>(
                    create: (context) => EkycCubit(),
                    child: const BlockDialog());
              },
            );
          },
          child: Row(children: [
            const Icon(
              CupertinoIcons.location_solid,
              color: Color(0xFFFFC351),
            ),
            Text(
              'Ekyc',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(fontWeight: FontWeight.w800),
            )
          ]),
        ),
      ],
    );
  }
}

class SubTitileRow extends StatelessWidget {
  final String title;
  const SubTitileRow({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontWeight: FontWeight.w800, color: const Color(0xff454545)),
          ),
          Expanded(
            child: Container(
              height: 3,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    stops: [
                      0.1,
                      0.9,
                    ],
                    colors: [
                      Color(0xFFF8B830),
                      Colors.white10,
                    ],
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Image.asset(
              'assets/images/oro.png',
              height: 15,
            ),
          ),
        ],
      ),
    );
  }
}
