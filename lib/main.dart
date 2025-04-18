import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
// // // import 'package:flutter/material.dart';
// // //
// // // void main() {
// // //   runApp(const FractionViewerApp());
// // // }
// // //
// // // class FractionViewerApp extends StatelessWidget {
// // //   const FractionViewerApp({super.key});
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       title: 'Fraction Viewer',
// // //       theme: ThemeData(
// // //         primarySwatch: Colors.blue,
// // //       ),
// // //       home: const PageViewer(),
// // //     );
// // //   }
// // // }
// // //
// // // class PageViewer extends StatefulWidget {
// // //   const PageViewer({super.key});
// // //
// // //   @override
// // //   State<PageViewer> createState() => _PageViewerState();
// // // }
// // //
// // // class _PageViewerState extends State<PageViewer> {
// // //   final PageController _pageController = PageController(initialPage: 1);
// // //   int _currentPage = 1;
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: const Text('Fraction Viewer'),
// // //       ),
// // //       body: PageView(
// // //         controller: _pageController,
// // //         onPageChanged: (int page) {
// // //           setState(() {
// // //             _currentPage = page;
// // //           });
// // //         },
// // //         children: const [
// // //           Center(child: Text('Page 1 - Empty')),
// // //           FractionPage(content: r'\[ \frac{1}{2} \]'),
// // //           Center(child: Text('Page 3 - Empty')),
// // //         ],
// // //       ),
// // //       floatingActionButton: Row(
// // //         mainAxisAlignment: MainAxisAlignment.end,
// // //         children: [
// // //           if (_currentPage > 0)
// // //             FloatingActionButton(
// // //               onPressed: () {
// // //                 _pageController.previousPage(
// // //                   duration: const Duration(milliseconds: 300),
// // //                   curve: Curves.easeInOut,
// // //                 );
// // //               },
// // //               child: const Icon(Icons.arrow_left),
// // //             ),
// // //           const SizedBox(width: 10),
// // //           if (_currentPage < 2)
// // //             FloatingActionButton(
// // //               onPressed: () {
// // //                 _pageController.nextPage(
// // //                   duration: const Duration(milliseconds: 300),
// // //                   curve: Curves.easeInOut,
// // //                 );
// // //               },
// // //               child: const Icon(Icons.arrow_right),
// // //             ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // //
// // //   @override
// // //   void dispose() {
// // //     _pageController.dispose();
// // //     super.dispose();
// // //   }
// // // }
// // //
// // // class FractionPage extends StatelessWidget {
// // //   final String content;
// // //
// // //   const FractionPage({super.key, required this.content});
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Center(
// // //       child: Column(
// // //         mainAxisAlignment: MainAxisAlignment.center,
// // //         children: [
// // //           Text(
// // //             content,
// // //             style: const TextStyle(fontSize: 48),
// // //           ),
// // //           const SizedBox(height: 20),
// // //           Text(
// // //             'Page ${content.contains(r'\frac{1}{2}') ? 2 : 3}',
// // //             style: const TextStyle(fontSize: 24),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }
