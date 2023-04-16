import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pro_cats/fact_widget.dart';
import 'package:pro_cats/history_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/cats_bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Center(child: FactWidget()),
              Positioned(
                  bottom: 10,
                  right: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageTransition(
                                duration: const Duration(milliseconds: 250),
                                type: PageTransitionType.bottomToTop,
                                child: HistoryScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black45,
                          minimumSize: Size.zero, // Set this
                          padding: const EdgeInsets.all(13),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Row(
                          children: const [
                            Text('Facts History'),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.history,
                              size: 20,
                            ),
                          ],
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
