import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pro_cats/bloc/fact_bloc.dart';
import 'package:pro_cats/date_row_widget.dart';

class FactWidget extends StatelessWidget {
  const FactWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    var formatter =
        DateFormat.yMMMMd(Localizations.localeOf(context).toString());

    return Center(
      child: Container(
        height: height * 0.65,
        width: double.infinity,
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(10.0),
        decoration: const BoxDecoration(
            color: Colors.black45,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          children: [
            const Text(
              'Did you know?',
              style: TextStyle(color: Colors.white, fontSize: 42),
            ),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<FactBloc, FactState>(
              builder: (context, state) {
                if (state is FactInitial) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  );
                }
                if (state is FactLoaded) {
                  return Expanded(
                    child: Column(
                      children: [
                        Text(
                          state.catFact.fact,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        DateRow(
                          color: Colors.white,
                          text: formatter.format(state.catFact.createdAt!),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AspectRatio(
                          aspectRatio: 16 / 9,
                          child: CachedNetworkImage(
                            imageUrl: "https://cataas.com/cat",
                            placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                        const Spacer(),
                        ElevatedButton(
                            onPressed: () =>
                                context.read<FactBloc>().add(UpdateFact()),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              minimumSize: Size.zero, // Set this
                              padding: const EdgeInsets.all(13),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              'Another fact!',
                              style: TextStyle(color: Colors.black),
                            )),
                      ],
                    ),
                  );
                } else {
                  return const Text('something went wrong');
                }
              },
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
