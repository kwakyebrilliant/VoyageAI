import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String bookmark;
  const DetailScreen({super.key, required this.bookmark});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: const Color(0xFFFFFFFF),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: IconButton(
                icon: Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFFF6C00A),
                    border: Border.all(
                      color: const Color(0xFF494B45).withOpacity(0.2),
                      width: 0.2,
                    ),
                  ),
                  child: const Icon(
                    Icons.close_outlined,
                    color: Color(0xFFFFFFFF),
                    size: 40.0,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            floating: true,
            snap: true,
            expandedHeight: 80.0,
            collapsedHeight: 52.0,
            toolbarHeight: 52.0,
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 80.0,
                left: 10.0,
                right: 10.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    bookmark,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
