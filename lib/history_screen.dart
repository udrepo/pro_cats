import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'date_row_widget.dart';
import 'entity/cat_fact.dart';
class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<List<CatFact>> fetchSavedFacts() async {
      var box = await Hive.openBox<CatFact>('facts');
      List<CatFact> facts = List.from(box.values.toList().reversed);
      return facts;
    }

    var formatter = DateFormat.yMMMMd(Localizations.localeOf(context).toString());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: ()=>Navigator.pop(context),
          child: const Icon(
            Icons.close,
            size: 30,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Facts History',
          style: TextStyle(fontSize: 25, color: Colors.black),
        ),
        elevation: 0,
      ),
      body: Center(
        child: FutureBuilder(
            future: fetchSavedFacts(),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return ListView.separated(
                  itemCount: snapshot.data.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data[index].fact,
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 5,),
                          DateRow(
                            color: Colors.black,
                            text: formatter.format(snapshot.data[index].createdAt),)
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      height: 0,
                      thickness: 0.5,
                      indent: 20,
                      endIndent: 20,
                      color: Colors.black45,
                    );
                  },
                );
              }
            }),
      ),
    );
  }
}