import 'package:flutter/material.dart';

class RecommendedJobs extends StatelessWidget {
  const RecommendedJobs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: BackButton(color: Colors.white,),
      ),
    );
  }
}