import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oro/home/bloc/cubit/ekyc_cubit.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class BlockDialog extends StatelessWidget {
  const BlockDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> menuItems = const [
      DropdownMenuItem(value: "english", child: Text("English")),
      DropdownMenuItem(value: "tamil", child: Text("Tamil")),
      DropdownMenuItem(value: "telugu", child: Text("Telugu")),
      DropdownMenuItem(value: "kannada", child: Text("Kannada")),
      DropdownMenuItem(value: "marathi", child: Text("Marathi")),
      DropdownMenuItem(value: "hindi", child: Text("Hindi")),
    ];
    return AlertDialog(
      contentPadding: const EdgeInsets.all(24),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'e-Kyc Confirmation',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              BlocBuilder<EkycCubit, EkycState>(
                builder: (context, state) {
                  return DropdownButtonHideUnderline(
                    child: SizedBox(
                      height: 25,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFE1A8),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: DropdownButton(
                            value: state.fileName,
                            items: menuItems,
                            icon: const Icon(
                              Icons.translate_sharp,
                              size: 15,
                            ),
                            onChanged: (Object? value) {
                              context
                                  .read<EkycCubit>()
                                  .changeLanguage(value.toString());
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Please read the document carefully before proceeding further.",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.grey),
          ),
          const Divider(),
          const SizedBox(
            height: 8,
          ),
          BlocBuilder<EkycCubit, EkycState>(
            builder: (context, state) {
              return Container(
                width: double.infinity,
                color: Colors.grey[300],
                height: 400,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SfPdfViewer.asset(
                      'assets/data/${state.fileName}_oro.pdf'),
                ),
              );
            },
          )
        ],
      ),
      actions: [
        TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              side: MaterialStateProperty.all(
                  const BorderSide(color: Colors.grey))),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Close',
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Confirm to proceed further',
          ),
        ),
      ],
    );
  }
}
