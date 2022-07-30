import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oro/locker/repo/locker_repo.dart';

import '../../routes/routes.dart';
import '../bloc/cubit/locker_cubit.dart';

class Locker extends StatelessWidget {
  const Locker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LockerCubit>(
      create: (context) => LockerCubit(LockerRepositry()),
      child: Scaffold(
        body: Stack(
          children: [
            SafeArea(
              child: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) => [
                  SliverAppBar(
                    toolbarHeight: 60.0,
                    backgroundColor: Theme.of(context).canvasColor,
                    foregroundColor: Theme.of(context).colorScheme.onBackground,
                    pinned: true,
                    title: Text(
                      'Locker Contents',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ],
                body: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      BlocBuilder<LockerCubit, LockerState>(
                        builder: (context, state) {
                          if (state.status == Status.initial) {
                            context.read<LockerCubit>().getData();
                          }
                          if (state.status == Status.success) {
                            return LockerItem(state: state);
                          }
                          return const CircularProgressIndicator();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: 0,
                child: Center(
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 70,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, Routes.payment);
                            },
                            child: const Text('Pay')),
                      )),
                ))
          ],
        ),
      ),
    );
  }
}

class LockerItem extends StatelessWidget {
  const LockerItem({
    Key? key,
    required this.state,
  }) : super(key: key);
  final LockerState state;
  @override
  Widget build(BuildContext context) {
    const List<String> itemCatogary = [
      "QUALITY",
      "STONE WEIGHT",
      "GROSS WEIGHT",
      "NET WEIGHT / ANW"
    ];

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: state.lockerModel!.lockerConent.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
            childAspectRatio: 0.55),
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 120,
                    color: Colors.grey[100],
                    child: Center(
                        child: Text(
                      'seal photos here'.toUpperCase(),
                      textAlign: TextAlign.center,
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      state.lockerModel!.lockerConent[index].srNo,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        state.lockerModel!.lockerConent[index].item,
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xFFFFF7EA),
                            borderRadius: BorderRadius.circular(08),
                            border: Border.all(color: const Color(0xFFFFE1A8))),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            '${state.lockerModel!.lockerConent[index].quantity} qty'
                                .toUpperCase(),
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      childAspectRatio: 2.1,
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      children: List<Widget>.generate(4, (gIndex) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              itemCatogary[gIndex],
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(fontSize: 06),
                            ),
                            Text(
                                gIndex == 0
                                    ? state.lockerModel!.lockerConent[index]
                                        .quality
                                    : gIndex == 1
                                        ? state.lockerModel!.lockerConent[index]
                                            .stoneWeight
                                        : gIndex == 2
                                            ? state.lockerModel!
                                                .lockerConent[index].grossWeight
                                            : state.lockerModel!
                                                .lockerConent[index].netWeight,
                                style: Theme.of(context).textTheme.bodyMedium!),
                          ],
                        );
                      }),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'View gold photos'.toUpperCase(),
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
