import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tasty_cook/routing/app_router.gr.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  context.router.push(
                    const FirstScreen(),
                  );
                },
                child: const Text(
                  'First Screen',
                ),
              ),
              TextButton(
                onPressed: () {
                  context.router.push(
                    const SecondScreen(),
                  );
                },
                child: const Text(
                  'Second Screen',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
