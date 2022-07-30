import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/payment_cubit.dart';
import '../repositry/payment_repo.dart';

class Payment extends StatelessWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PaymentCubit>(
      create: (context) => PaymentCubit(PaymentRepositry()),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const AppBarRow(),
              BlocBuilder<PaymentCubit, PaymentState>(
                builder: (context, state) {
                  if (state.status == Status.initial) {
                    context.read<PaymentCubit>().getData();
                  }
                  if (state.status == Status.success) {
                    return PaymentTile(
                      state: state,
                    );
                  }
                  return const CircularProgressIndicator();
                },
              ),
              const Spacer(),
              const SecurityTile(),
              BlocBuilder<PaymentCubit, PaymentState>(
                builder: (context, state) {
                  if (state.status == Status.success) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          Text('Tax payable (18%): ₹${state.tax.toString()}'),
                    );
                  }
                  return const Offstage();
                },
              ),
              const PricingBox(),
            ],
          ),
        ),
      ),
    );
  }
}

class PricingBox extends StatelessWidget {
  const PricingBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            spreadRadius: 08,
            blurRadius: 20,
            offset: const Offset(0, 7), // changes position of shadow
          ),
        ],
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [
            0.1,
            2.0,
          ],
          colors: [
            Color(0xFFFFE9BF),
            Color(0xFFFFFFFF),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('DURATION'),
                RichText(
                  text: TextSpan(
                    text: 'AMOUNT ',
                    style: Theme.of(context).textTheme.bodyLarge,
                    children: const <TextSpan>[
                      TextSpan(
                          text: '(INCL. TAX)',
                          style: TextStyle(
                            fontSize: 08,
                          )),
                    ],
                  ),
                ),
                //   Text('amount (incl. tax)'),
              ],
            ),
            BlocBuilder<PaymentCubit, PaymentState>(
              builder: (context, state) {
                if (state.status == Status.success) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${state.paymentModel!.payment[state.selectedIndex].period} MONTHS',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        '₹${state.payableAmount.toString()}',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  );
                }
                return const Offstage();
              },
            ),
            Row(
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  side: MaterialStateBorderSide.resolveWith(
                    (states) =>
                        const BorderSide(width: 1.0, color: Colors.greenAccent),
                  ),
                  activeColor: Colors.white,
                  checkColor: Colors.greenAccent,
                  value: true,
                  onChanged: (value) {},
                ),
                const SizedBox(
                  width: 10,
                ),
                RichText(
                  text: const TextSpan(
                    text: 'I agree to ',
                    style: TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'terms & conditions',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          )),
                    ],
                  ),
                ), //SizedBox
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              child: const SizedBox(
                width: double.maxFinite,
                height: 50,
                child: Center(child: Text('Confirm Plan Selection')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecurityTile extends StatelessWidget {
  const SecurityTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          stops: [
            0.1,
            0.8,
          ],
          colors: [
            Color(0xFFFFB81E),
            Color(0xFFF8B830),
          ],
        )),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Icon(
              CupertinoIcons.check_mark_circled_solid,
              color: Colors.white,
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('no security deposit'.toUpperCase()),
                Text(
                  'Oro Safe does not charge security deposit for your lockers.',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 09),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class PaymentTile extends StatelessWidget {
  PaymentTile({Key? key, required this.state}) : super(key: key);
  PaymentState state;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: state.paymentModel!.payment.length,
          itemBuilder: (context, index) {
            return Card(
              color: state.selectedIndex == index
                  ? const Color(0xFFFFF7EA)
                  : Colors.white,
              child: InkWell(
                onTap: () => context.read<PaymentCubit>().seletedIndex(index),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    dense: false,
                    leading: Radio(
                        activeColor: const Color(0xFF5A953E),
                        toggleable: true,
                        value: state.selectedIndex == index ? true : false,
                        groupValue: true,
                        onChanged: (value) {
                          //selected value
                        }),
                    title: Text(
                      '${state.paymentModel!.payment[index].period} Months',
                      textScaleFactor: 1.2,
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          ' ₹ ${state.paymentModel!.payment[index].amount}',
                          textScaleFactor: 1.0,
                        ),
                        Text(
                          '₹${state.paymentModel!.payment[index].monthly} monthly',
                          textScaleFactor: 0.8,
                          style: const TextStyle(color: Color(0xFF5A953E)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class AppBarRow extends StatelessWidget {
  const AppBarRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  border:
                      Border.all(width: 1.0, color: const Color(0xFFFFAA07)),
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    stops: [
                      0.1,
                      0.8,
                    ],
                    colors: [
                      Color(0xFFFFE79B),
                      Color(0xFFFFB81E),
                    ],
                  ),
                ),
                child: Image.asset('assets/images/bar.png'),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Choose Plan & Pay',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
          InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap: (() {
              Navigator.pop(context);
            }),
            child: const Icon(
              Icons.close,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}
