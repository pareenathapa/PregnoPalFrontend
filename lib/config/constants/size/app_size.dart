import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Common spacing constants
const double xs = 2.0;
const double sm = 4.0;
const double xsm = 6.0;
const double md = 8.0;
const double lg = 10.0;
const double l = 12.0;
const double xlm = 14.0;
const double xl = 16.0;

// Empty widgets to reduce boilerplate
const emptyWidget = SizedBox.shrink();
final emptyWidgetWide = SizedBox(width: double.infinity.w);
const emptySliver = SliverToBoxAdapter();

// Margins
// Horizontal margins using SizedBox for consistent spacing
final horizontalMargin2 = SizedBox(width: 2.0.w);
final horizontalMargin4 = SizedBox(width: 4.0.w);
final horizontalMargin6 = SizedBox(width: 6.0.w);
final horizontalMargin8 = SizedBox(width: 8.0.w);
final horizontalMargin10 = SizedBox(width: 10.0.w);
final horizontalMargin12 = SizedBox(width: 12.0.w);
final horizontalMargin14 = SizedBox(width: 14.0.w);
final horizontalMargin16 = SizedBox(width: 16.0.w);
final horizontalMargin18 = SizedBox(width: 18.0.w);
final horizontalMargin20 = SizedBox(width: 20.0.w);
final horizontalMargin22 = SizedBox(width: 22.0.w);
final horizontalMargin24 = SizedBox(width: 24.0.w);
final horizontalMargin26 = SizedBox(width: 26.0.w);
final horizontalMargin28 = SizedBox(width: 28.0.w);
final horizontalMargin30 = SizedBox(width: 30.0.w);
final horizontalMargin32 = SizedBox(width: 32.0.w);
final horizontalMargin34 = SizedBox(width: 34.0.w);
final horizontalMargin36 = SizedBox(width: 36.0.w);
final horizontalMargin38 = SizedBox(width: 38.0.w);
final horizontalMargin40 = SizedBox(width: 40.0.w);
final horizontalMargin42 = SizedBox(width: 42.0.w);
final horizontalMargin44 = SizedBox(width: 44.0.w);
final horizontalMargin46 = SizedBox(width: 46.0.w);
final horizontalMargin48 = SizedBox(width: 48.0.w);
final horizontalMargin50 = SizedBox(width: 50.0.w);

final verticalMargin2 = SizedBox(height: 2.0.h);
final verticalMargin4 = SizedBox(height: 4.0.h);
final verticalMargin6 = SizedBox(height: 6.0.h);
final verticalMargin8 = SizedBox(height: 8.0.h);
final verticalMargin10 = SizedBox(height: 10.0.h);
final verticalMargin12 = SizedBox(height: 12.0.h);
final verticalMargin14 = SizedBox(height: 14.0.h);
final verticalMargin16 = SizedBox(height: 16.0.h);
final verticalMargin18 = SizedBox(height: 18.0.h);
final verticalMargin20 = SizedBox(height: 20.0.h);
final verticalMargin22 = SizedBox(height: 22.0.h);
final verticalMargin24 = SizedBox(height: 24.0.h);
final verticalMargin26 = SizedBox(height: 26.0.h);
final verticalMargin28 = SizedBox(height: 28.0.h);
final verticalMargin30 = SizedBox(height: 30.0.h);
final verticalMargin32 = SizedBox(height: 32.0.h);
final verticalMargin34 = SizedBox(height: 34.0.h);
final verticalMargin36 = SizedBox(height: 36.0.h);
final verticalMargin38 = SizedBox(height: 38.0.h);
final verticalMargin40 = SizedBox(height: 40.0.h);
final verticalMargin42 = SizedBox(height: 42.0.h);
final verticalMargin44 = SizedBox(height: 44.0.h);
final verticalMargin46 = SizedBox(height: 46.0.h);
final verticalMargin48 = SizedBox(height: 48.0.h);
final verticalMargin50 = SizedBox(height: 50.0.h);

// Sliver Margins
// Sliver margins for sliver widgets spacing
final sliverMainAxisHorizontalMargin2 =
    SliverToBoxAdapter(child: SizedBox(width: 2.0.w));
final sliverMainAxisHorizontalMargin4 =
    SliverToBoxAdapter(child: SizedBox(width: 4.0.w));
final sliverMainAxisHorizontalMargin6 =
    SliverToBoxAdapter(child: SizedBox(width: 6.0.w));
final sliverMainAxisHorizontalMargin8 =
    SliverToBoxAdapter(child: SizedBox(width: 8.0.w));
final sliverMainAxisHorizontalMargin10 =
    SliverToBoxAdapter(child: SizedBox(width: 10.0.w));
final sliverMainAxisHorizontalMargin12 =
    SliverToBoxAdapter(child: SizedBox(width: 12.0.w));
final sliverMainAxisHorizontalMargin14 =
    SliverToBoxAdapter(child: SizedBox(width: 14.0.w));
final sliverMainAxisHorizontalMargin16 =
    SliverToBoxAdapter(child: SizedBox(width: 16.0.w));
final sliverMainAxisHorizontalMargin18 =
    SliverToBoxAdapter(child: SizedBox(width: 18.0.w));
final sliverMainAxisHorizontalMargin20 =
    SliverToBoxAdapter(child: SizedBox(width: 20.0.w));
final sliverMainAxisHorizontalMargin22 =
    SliverToBoxAdapter(child: SizedBox(width: 22.0.w));
final sliverMainAxisHorizontalMargin24 =
    SliverToBoxAdapter(child: SizedBox(width: 24.0.w));
final sliverMainAxisHorizontalMargin26 =
    SliverToBoxAdapter(child: SizedBox(width: 26.0.w));
final sliverMainAxisHorizontalMargin28 =
    SliverToBoxAdapter(child: SizedBox(width: 28.0.w));
final sliverMainAxisHorizontalMargin30 =
    SliverToBoxAdapter(child: SizedBox(width: 30.0.w));
final sliverMainAxisHorizontalMargin32 =
    SliverToBoxAdapter(child: SizedBox(width: 32.0.w));
final sliverMainAxisHorizontalMargin34 =
    SliverToBoxAdapter(child: SizedBox(width: 34.0.w));
final sliverMainAxisHorizontalMargin36 =
    SliverToBoxAdapter(child: SizedBox(width: 36.0.w));
final sliverMainAxisHorizontalMargin38 =
    SliverToBoxAdapter(child: SizedBox(width: 38.0.w));
final sliverMainAxisHorizontalMargin40 =
    SliverToBoxAdapter(child: SizedBox(width: 40.0.w));
final sliverMainAxisHorizontalMargin42 =
    SliverToBoxAdapter(child: SizedBox(width: 42.0.w));
final sliverMainAxisHorizontalMargin44 =
    SliverToBoxAdapter(child: SizedBox(width: 44.0.w));
final sliverMainAxisHorizontalMargin46 =
    SliverToBoxAdapter(child: SizedBox(width: 46.0.w));
final sliverMainAxisHorizontalMargin48 =
    SliverToBoxAdapter(child: SizedBox(width: 48.0.w));
final sliverMainAxisHorizontalMargin50 =
    SliverToBoxAdapter(child: SizedBox(width: 50.0.w));

final sliverMainAxisVerticalMargin2 =
    SliverToBoxAdapter(child: SizedBox(height: 2.0.h));
final sliverMainAxisVerticalMargin4 =
    SliverToBoxAdapter(child: SizedBox(height: 4.0.h));
final sliverMainAxisVerticalMargin6 =
    SliverToBoxAdapter(child: SizedBox(height: 6.0.h));
final sliverMainAxisVerticalMargin8 =
    SliverToBoxAdapter(child: SizedBox(height: 8.0.h));
final sliverMainAxisVerticalMargin10 =
    SliverToBoxAdapter(child: SizedBox(height: 10.0.h));
final sliverMainAxisVerticalMargin12 =
    SliverToBoxAdapter(child: SizedBox(height: 12.0.h));
final sliverMainAxisVerticalMargin14 =
    SliverToBoxAdapter(child: SizedBox(height: 14.0.h));
final sliverMainAxisVerticalMargin16 =
    SliverToBoxAdapter(child: SizedBox(height: 16.0.h));
final sliverMainAxisVerticalMargin18 =
    SliverToBoxAdapter(child: SizedBox(height: 18.0.h));
final sliverMainAxisVerticalMargin20 =
    SliverToBoxAdapter(child: SizedBox(height: 20.0.h));
final sliverMainAxisVerticalMargin22 =
    SliverToBoxAdapter(child: SizedBox(height: 22.0.h));
final sliverMainAxisVerticalMargin24 =
    SliverToBoxAdapter(child: SizedBox(height: 24.0.h));
final sliverMainAxisVerticalMargin26 =
    SliverToBoxAdapter(child: SizedBox(height: 26.0.h));
final sliverMainAxisVerticalMargin28 =
    SliverToBoxAdapter(child: SizedBox(height: 28.0.h));
final sliverMainAxisVerticalMargin30 =
    SliverToBoxAdapter(child: SizedBox(height: 30.0.h));
final sliverMainAxisVerticalMargin32 =
    SliverToBoxAdapter(child: SizedBox(height: 32.0.h));
final sliverMainAxisVerticalMargin34 =
    SliverToBoxAdapter(child: SizedBox(height: 34.0.h));
final sliverMainAxisVerticalMargin36 =
    SliverToBoxAdapter(child: SizedBox(height: 36.0.h));
final sliverMainAxisVerticalMargin38 =
    SliverToBoxAdapter(child: SizedBox(height: 38.0.h));
final sliverMainAxisVerticalMargin40 =
    SliverToBoxAdapter(child: SizedBox(height: 40.0.h));
final sliverMainAxisVerticalMargin42 =
    SliverToBoxAdapter(child: SizedBox(height: 42.0.h));
final sliverMainAxisVerticalMargin44 =
    SliverToBoxAdapter(child: SizedBox(height: 44.0.h));
final sliverMainAxisVerticalMargin46 =
    SliverToBoxAdapter(child: SizedBox(height: 46.0.h));
final sliverMainAxisVerticalMargin48 =
    SliverToBoxAdapter(child: SizedBox(height: 48.0.h));
final sliverMainAxisVerticalMargin50 =
    SliverToBoxAdapter(child: SizedBox(height: 50.0.h));

const sliverCrossAxisHorizontalMargin2 = SliverCrossAxisMargin(extent: 2.0);
const sliverCrossAxisHorizontalMargin4 = SliverCrossAxisMargin(extent: 4.0);
const sliverCrossAxisHorizontalMargin6 = SliverCrossAxisMargin(extent: 6.0);
const sliverCrossAxisHorizontalMargin8 = SliverCrossAxisMargin(extent: 8.0);
const sliverCrossAxisHorizontalMargin10 = SliverCrossAxisMargin(extent: 10.0);
const sliverCrossAxisHorizontalMargin12 = SliverCrossAxisMargin(extent: 12.0);
const sliverCrossAxisHorizontalMargin14 = SliverCrossAxisMargin(extent: 14.0);
const sliverCrossAxisHorizontalMargin16 = SliverCrossAxisMargin(extent: 16.0);
const sliverCrossAxisHorizontalMargin18 = SliverCrossAxisMargin(extent: 18.0);
const sliverCrossAxisHorizontalMargin20 = SliverCrossAxisMargin(extent: 20.0);
const sliverCrossAxisHorizontalMargin22 = SliverCrossAxisMargin(extent: 22.0);
const sliverCrossAxisHorizontalMargin24 = SliverCrossAxisMargin(extent: 24.0);
const sliverCrossAxisHorizontalMargin26 = SliverCrossAxisMargin(extent: 26.0);
const sliverCrossAxisHorizontalMargin28 = SliverCrossAxisMargin(extent: 28.0);
const sliverCrossAxisHorizontalMargin30 = SliverCrossAxisMargin(extent: 30.0);
const sliverCrossAxisHorizontalMargin32 = SliverCrossAxisMargin(extent: 32.0);
const sliverCrossAxisHorizontalMargin34 = SliverCrossAxisMargin(extent: 34.0);
const sliverCrossAxisHorizontalMargin36 = SliverCrossAxisMargin(extent: 36.0);
const sliverCrossAxisHorizontalMargin38 = SliverCrossAxisMargin(extent: 38.0);
const sliverCrossAxisHorizontalMargin40 = SliverCrossAxisMargin(extent: 40.0);
const sliverCrossAxisHorizontalMargin42 = SliverCrossAxisMargin(extent: 42.0);
const sliverCrossAxisHorizontalMargin44 = SliverCrossAxisMargin(extent: 44.0);
const sliverCrossAxisHorizontalMargin46 = SliverCrossAxisMargin(extent: 46.0);
const sliverCrossAxisHorizontalMargin48 = SliverCrossAxisMargin(extent: 48.0);
const sliverCrossAxisHorizontalMargin50 = SliverCrossAxisMargin(extent: 50.0);

const sliverCrossAxisVerticalMargin2 = SliverCrossAxisMargin(extent: 2.0);
const sliverCrossAxisVerticalMargin4 = SliverCrossAxisMargin(extent: 4.0);
const sliverCrossAxisVerticalMargin6 = SliverCrossAxisMargin(extent: 6.0);
const sliverCrossAxisVerticalMargin8 = SliverCrossAxisMargin(extent: 8.0);
const sliverCrossAxisVerticalMargin10 = SliverCrossAxisMargin(extent: 10.0);
const sliverCrossAxisVerticalMargin12 = SliverCrossAxisMargin(extent: 12.0);
const sliverCrossAxisVerticalMargin14 = SliverCrossAxisMargin(extent: 14.0);
const sliverCrossAxisVerticalMargin16 = SliverCrossAxisMargin(extent: 16.0);
const sliverCrossAxisVerticalMargin18 = SliverCrossAxisMargin(extent: 18.0);
const sliverCrossAxisVerticalMargin20 = SliverCrossAxisMargin(extent: 20.0);
const sliverCrossAxisVerticalMargin22 = SliverCrossAxisMargin(extent: 22.0);
const sliverCrossAxisVerticalMargin24 = SliverCrossAxisMargin(extent: 24.0);
const sliverCrossAxisVerticalMargin26 = SliverCrossAxisMargin(extent: 26.0);
const sliverCrossAxisVerticalMargin28 = SliverCrossAxisMargin(extent: 28.0);
const sliverCrossAxisVerticalMargin30 = SliverCrossAxisMargin(extent: 30.0);
const sliverCrossAxisVerticalMargin32 = SliverCrossAxisMargin(extent: 32.0);
const sliverCrossAxisVerticalMargin34 = SliverCrossAxisMargin(extent: 34.0);
const sliverCrossAxisVerticalMargin36 = SliverCrossAxisMargin(extent: 36.0);
const sliverCrossAxisVerticalMargin38 = SliverCrossAxisMargin(extent: 38.0);
const sliverCrossAxisVerticalMargin40 = SliverCrossAxisMargin(extent: 40.0);
const sliverCrossAxisVerticalMargin42 = SliverCrossAxisMargin(extent: 42.0);
const sliverCrossAxisVerticalMargin44 = SliverCrossAxisMargin(extent: 44.0);
const sliverCrossAxisVerticalMargin46 = SliverCrossAxisMargin(extent: 46.0);
const sliverCrossAxisVerticalMargin48 = SliverCrossAxisMargin(extent: 48.0);
const sliverCrossAxisVerticalMargin50 = SliverCrossAxisMargin(extent: 50.0);

// Paddings
// Paddings for consistent use of EdgeInsets throughout the app
const emptyPadding = EdgeInsets.zero;

final horizontalPadding2 = EdgeInsets.symmetric(horizontal: 2.0.w);
final horizontalPadding4 = EdgeInsets.symmetric(horizontal: 4.0.w);
final horizontalPadding6 = EdgeInsets.symmetric(horizontal: 6.0.w);
final horizontalPadding8 = EdgeInsets.symmetric(horizontal: 8.0.w);
final horizontalPadding10 = EdgeInsets.symmetric(horizontal: 10.0.w);
final horizontalPadding12 = EdgeInsets.symmetric(horizontal: 12.0.w);
final horizontalPadding14 = EdgeInsets.symmetric(horizontal: 14.0.w);
final horizontalPadding16 = EdgeInsets.symmetric(horizontal: 16.0.w);
final horizontalPadding18 = EdgeInsets.symmetric(horizontal: 18.0.w);
final horizontalPadding20 = EdgeInsets.symmetric(horizontal: 20.0.w);
final horizontalPadding22 = EdgeInsets.symmetric(horizontal: 22.0.w);
final horizontalPadding24 = EdgeInsets.symmetric(horizontal: 24.0.w);
final horizontalPadding26 = EdgeInsets.symmetric(horizontal: 26.0.w);
final horizontalPadding28 = EdgeInsets.symmetric(horizontal: 28.0.w);
final horizontalPadding30 = EdgeInsets.symmetric(horizontal: 30.0.w);
final horizontalPadding32 = EdgeInsets.symmetric(horizontal: 32.0.w);
final horizontalPadding34 = EdgeInsets.symmetric(horizontal: 34.0.w);
final horizontalPadding36 = EdgeInsets.symmetric(horizontal: 36.0.w);
final horizontalPadding38 = EdgeInsets.symmetric(horizontal: 38.0.w);
final horizontalPadding40 = EdgeInsets.symmetric(horizontal: 40.0.w);
final horizontalPadding42 = EdgeInsets.symmetric(horizontal: 42.0.w);
final horizontalPadding44 = EdgeInsets.symmetric(horizontal: 44.0.w);
final horizontalPadding46 = EdgeInsets.symmetric(horizontal: 46.0.w);
final horizontalPadding48 = EdgeInsets.symmetric(horizontal: 48.0.w);
final horizontalPadding50 = EdgeInsets.symmetric(horizontal: 50.0.w);

final verticalPadding2 = EdgeInsets.symmetric(vertical: 2.0.h);
final verticalPadding4 = EdgeInsets.symmetric(vertical: 4.0.h);
final verticalPadding6 = EdgeInsets.symmetric(vertical: 6.0.h);
final verticalPadding8 = EdgeInsets.symmetric(vertical: 8.0.h);
final verticalPadding10 = EdgeInsets.symmetric(vertical: 10.0.h);
final verticalPadding12 = EdgeInsets.symmetric(vertical: 12.0.h);
final verticalPadding14 = EdgeInsets.symmetric(vertical: 14.0.h);
final verticalPadding16 = EdgeInsets.symmetric(vertical: 16.0.h);
final verticalPadding18 = EdgeInsets.symmetric(vertical: 18.0.h);
final verticalPadding20 = EdgeInsets.symmetric(vertical: 20.0.h);
final verticalPadding22 = EdgeInsets.symmetric(vertical: 22.0.h);
final verticalPadding24 = EdgeInsets.symmetric(vertical: 24.0.h);
final verticalPadding26 = EdgeInsets.symmetric(vertical: 26.0.h);
final verticalPadding28 = EdgeInsets.symmetric(vertical: 28.0.h);
final verticalPadding30 = EdgeInsets.symmetric(vertical: 30.0.h);
final verticalPadding32 = EdgeInsets.symmetric(vertical: 32.0.h);
final verticalPadding34 = EdgeInsets.symmetric(vertical: 34.0.h);
final verticalPadding36 = EdgeInsets.symmetric(vertical: 36.0.h);
final verticalPadding38 = EdgeInsets.symmetric(vertical: 38.0.h);
final verticalPadding40 = EdgeInsets.symmetric(vertical: 40.0.h);
final verticalPadding42 = EdgeInsets.symmetric(vertical: 42.0.h);
final verticalPadding44 = EdgeInsets.symmetric(vertical: 44.0.h);
final verticalPadding46 = EdgeInsets.symmetric(vertical: 46.0.h);
final verticalPadding48 = EdgeInsets.symmetric(vertical: 48.0.h);
final verticalPadding50 = EdgeInsets.symmetric(vertical: 50.0.h);

const allPadding2 = EdgeInsets.all(2.0);
const allPadding4 = EdgeInsets.all(4.0);
const allPadding6 = EdgeInsets.all(6.0);
const allPadding8 = EdgeInsets.all(8.0);
const allPadding10 = EdgeInsets.all(10.0);
const allPadding12 = EdgeInsets.all(12.0);
const allPadding14 = EdgeInsets.all(14.0);
const allPadding16 = EdgeInsets.all(16.0);
const allPadding18 = EdgeInsets.all(18.0);
const allPadding20 = EdgeInsets.all(20.0);
const allPadding22 = EdgeInsets.all(22.0);
const allPadding24 = EdgeInsets.all(24.0);
const allPadding26 = EdgeInsets.all(26.0);
const allPadding28 = EdgeInsets.all(28.0);
const allPadding30 = EdgeInsets.all(30.0);
const allPadding32 = EdgeInsets.all(32.0);
const allPadding34 = EdgeInsets.all(34.0);
const allPadding36 = EdgeInsets.all(36.0);
const allPadding38 = EdgeInsets.all(38.0);
const allPadding40 = EdgeInsets.all(40.0);
const allPadding42 = EdgeInsets.all(42.0);
const allPadding44 = EdgeInsets.all(44.0);
const allPadding46 = EdgeInsets.all(46.0);
const allPadding48 = EdgeInsets.all(48.0);
const allPadding50 = EdgeInsets.all(50.0);

const topPadding2 = EdgeInsets.only(top: 2.0);
const topPadding4 = EdgeInsets.only(top: 4.0);
const topPadding6 = EdgeInsets.only(top: 6.0);
const topPadding8 = EdgeInsets.only(top: 8.0);
const topPadding10 = EdgeInsets.only(top: 10.0);
const topPadding12 = EdgeInsets.only(top: 12.0);
const topPadding14 = EdgeInsets.only(top: 14.0);
const topPadding16 = EdgeInsets.only(top: 16.0);
const topPadding18 = EdgeInsets.only(top: 18.0);
const topPadding20 = EdgeInsets.only(top: 20.0);
const topPadding22 = EdgeInsets.only(top: 22.0);
const topPadding24 = EdgeInsets.only(top: 24.0);
const topPadding26 = EdgeInsets.only(top: 26.0);
const topPadding28 = EdgeInsets.only(top: 28.0);
const topPadding30 = EdgeInsets.only(top: 30.0);
const topPadding32 = EdgeInsets.only(top: 32.0);
const topPadding34 = EdgeInsets.only(top: 34.0);
const topPadding36 = EdgeInsets.only(top: 36.0);
const topPadding38 = EdgeInsets.only(top: 38.0);
const topPadding40 = EdgeInsets.only(top: 40.0);
const topPadding42 = EdgeInsets.only(top: 42.0);
const topPadding44 = EdgeInsets.only(top: 44.0);
const topPadding46 = EdgeInsets.only(top: 46.0);
const topPadding48 = EdgeInsets.only(top: 48.0);
const topPadding50 = EdgeInsets.only(top: 50.0);

const bottomPadding2 = EdgeInsets.only(bottom: 2.0);
const bottomPadding4 = EdgeInsets.only(bottom: 4.0);
const bottomPadding6 = EdgeInsets.only(bottom: 6.0);
const bottomPadding8 = EdgeInsets.only(bottom: 8.0);
const bottomPadding10 = EdgeInsets.only(bottom: 10.0);
const bottomPadding12 = EdgeInsets.only(bottom: 12.0);
const bottomPadding14 = EdgeInsets.only(bottom: 14.0);
const bottomPadding16 = EdgeInsets.only(bottom: 16.0);
const bottomPadding18 = EdgeInsets.only(bottom: 18.0);
const bottomPadding20 = EdgeInsets.only(bottom: 20.0);
const bottomPadding22 = EdgeInsets.only(bottom: 22.0);
const bottomPadding24 = EdgeInsets.only(bottom: 24.0);
const bottomPadding26 = EdgeInsets.only(bottom: 26.0);
const bottomPadding28 = EdgeInsets.only(bottom: 28.0);
const bottomPadding30 = EdgeInsets.only(bottom: 30.0);
const bottomPadding32 = EdgeInsets.only(bottom: 32.0);
const bottomPadding34 = EdgeInsets.only(bottom: 34.0);
const bottomPadding36 = EdgeInsets.only(bottom: 36.0);
const bottomPadding38 = EdgeInsets.only(bottom: 38.0);
const bottomPadding40 = EdgeInsets.only(bottom: 40.0);
const bottomPadding42 = EdgeInsets.only(bottom: 42.0);
const bottomPadding44 = EdgeInsets.only(bottom: 44.0);
const bottomPadding46 = EdgeInsets.only(bottom: 46.0);
const bottomPadding48 = EdgeInsets.only(bottom: 48.0);
const bottomPadding50 = EdgeInsets.only(bottom: 50.0);

const leftPadding2 = EdgeInsets.only(left: 2.0);
const leftPadding4 = EdgeInsets.only(left: 4.0);
const leftPadding6 = EdgeInsets.only(left: 6.0);
const leftPadding8 = EdgeInsets.only(left: 8.0);
const leftPadding10 = EdgeInsets.only(left: 10.0);
const leftPadding12 = EdgeInsets.only(left: 12.0);
const leftPadding14 = EdgeInsets.only(left: 14.0);
const leftPadding16 = EdgeInsets.only(left: 16.0);
const leftPadding18 = EdgeInsets.only(left: 18.0);
const leftPadding20 = EdgeInsets.only(left: 20.0);
const leftPadding22 = EdgeInsets.only(left: 22.0);
const leftPadding24 = EdgeInsets.only(left: 24.0);
const leftPadding26 = EdgeInsets.only(left: 26.0);
const leftPadding28 = EdgeInsets.only(left: 28.0);
const leftPadding30 = EdgeInsets.only(left: 30.0);
const leftPadding32 = EdgeInsets.only(left: 32.0);
const leftPadding34 = EdgeInsets.only(left: 34.0);
const leftPadding36 = EdgeInsets.only(left: 36.0);
const leftPadding38 = EdgeInsets.only(left: 38.0);
const leftPadding40 = EdgeInsets.only(left: 40.0);
const leftPadding42 = EdgeInsets.only(left: 42.0);
const leftPadding44 = EdgeInsets.only(left: 44.0);
const leftPadding46 = EdgeInsets.only(left: 46.0);
const leftPadding48 = EdgeInsets.only(left: 48.0);
const leftPadding50 = EdgeInsets.only(left: 50.0);

const rightPadding2 = EdgeInsets.only(right: 2.0);
const rightPadding4 = EdgeInsets.only(right: 4.0);
const rightPadding6 = EdgeInsets.only(right: 6.0);
const rightPadding8 = EdgeInsets.only(right: 8.0);
const rightPadding10 = EdgeInsets.only(right: 10.0);
const rightPadding12 = EdgeInsets.only(right: 12.0);
const rightPadding14 = EdgeInsets.only(right: 14.0);
const rightPadding16 = EdgeInsets.only(right: 16.0);
const rightPadding18 = EdgeInsets.only(right: 18.0);
const rightPadding20 = EdgeInsets.only(right: 20.0);
const rightPadding22 = EdgeInsets.only(right: 22.0);
const rightPadding24 = EdgeInsets.only(right: 24.0);
const rightPadding26 = EdgeInsets.only(right: 26.0);
const rightPadding28 = EdgeInsets.only(right: 28.0);
const rightPadding30 = EdgeInsets.only(right: 30.0);
const rightPadding32 = EdgeInsets.only(right: 32.0);
const rightPadding34 = EdgeInsets.only(right: 34.0);
const rightPadding36 = EdgeInsets.only(right: 36.0);
const rightPadding38 = EdgeInsets.only(right: 38.0);
const rightPadding40 = EdgeInsets.only(right: 40.0);
const rightPadding42 = EdgeInsets.only(right: 42.0);
const rightPadding44 = EdgeInsets.only(right: 44.0);
const rightPadding46 = EdgeInsets.only(right: 46.0);
const rightPadding48 = EdgeInsets.only(right: 48.0);
const rightPadding50 = EdgeInsets.only(right: 50.0);

const startPadding2 = EdgeInsetsDirectional.only(start: 2.0);
const startPadding4 = EdgeInsetsDirectional.only(start: 4.0);
const startPadding6 = EdgeInsetsDirectional.only(start: 6.0);
const startPadding8 = EdgeInsetsDirectional.only(start: 8.0);
const startPadding10 = EdgeInsetsDirectional.only(start: 10.0);
const startPadding12 = EdgeInsetsDirectional.only(start: 12.0);
const startPadding14 = EdgeInsetsDirectional.only(start: 14.0);
const startPadding16 = EdgeInsetsDirectional.only(start: 16.0);
const startPadding18 = EdgeInsetsDirectional.only(start: 18.0);
const startPadding20 = EdgeInsetsDirectional.only(start: 20.0);
const startPadding22 = EdgeInsetsDirectional.only(start: 22.0);
const startPadding24 = EdgeInsetsDirectional.only(start: 24.0);
const startPadding26 = EdgeInsetsDirectional.only(start: 26.0);
const startPadding28 = EdgeInsetsDirectional.only(start: 28.0);
const startPadding30 = EdgeInsetsDirectional.only(start: 30.0);
const startPadding32 = EdgeInsetsDirectional.only(start: 32.0);
const startPadding34 = EdgeInsetsDirectional.only(start: 34.0);
const startPadding36 = EdgeInsetsDirectional.only(start: 36.0);
const startPadding38 = EdgeInsetsDirectional.only(start: 38.0);
const startPadding40 = EdgeInsetsDirectional.only(start: 40.0);
const startPadding42 = EdgeInsetsDirectional.only(start: 42.0);
const startPadding44 = EdgeInsetsDirectional.only(start: 44.0);
const startPadding46 = EdgeInsetsDirectional.only(start: 46.0);
const startPadding48 = EdgeInsetsDirectional.only(start: 48.0);
const startPadding50 = EdgeInsetsDirectional.only(start: 50.0);

const endPadding2 = EdgeInsetsDirectional.only(end: 2.0);
const endPadding4 = EdgeInsetsDirectional.only(end: 4.0);
const endPadding6 = EdgeInsetsDirectional.only(end: 6.0);
const endPadding8 = EdgeInsetsDirectional.only(end: 8.0);
const endPadding10 = EdgeInsetsDirectional.only(end: 10.0);
const endPadding12 = EdgeInsetsDirectional.only(end: 12.0);
const endPadding14 = EdgeInsetsDirectional.only(end: 14.0);
const endPadding16 = EdgeInsetsDirectional.only(end: 16.0);
const endPadding18 = EdgeInsetsDirectional.only(end: 18.0);
const endPadding20 = EdgeInsetsDirectional.only(end: 20.0);
const endPadding22 = EdgeInsetsDirectional.only(end: 22.0);
const endPadding24 = EdgeInsetsDirectional.only(end: 24.0);
const endPadding26 = EdgeInsetsDirectional.only(end: 26.0);
const endPadding28 = EdgeInsetsDirectional.only(end: 28.0);
const endPadding30 = EdgeInsetsDirectional.only(end: 30.0);
const endPadding32 = EdgeInsetsDirectional.only(end: 32.0);
const endPadding34 = EdgeInsetsDirectional.only(end: 34.0);
const endPadding36 = EdgeInsetsDirectional.only(end: 36.0);
const endPadding38 = EdgeInsetsDirectional.only(end: 38.0);
const endPadding40 = EdgeInsetsDirectional.only(end: 40.0);
const endPadding42 = EdgeInsetsDirectional.only(end: 42.0);
const endPadding44 = EdgeInsetsDirectional.only(end: 44.0);
const endPadding46 = EdgeInsetsDirectional.only(end: 46.0);
const endPadding48 = EdgeInsetsDirectional.only(end: 48.0);
const endPadding50 = EdgeInsetsDirectional.only(end: 50.0);

// Radius values for rounded corners
const verticalTopRadius2 = BorderRadius.vertical(top: Radius.circular(2.0));
const verticalTopRadius4 = BorderRadius.vertical(top: Radius.circular(4.0));
const verticalTopRadius6 = BorderRadius.vertical(top: Radius.circular(6.0));
const verticalTopRadius8 = BorderRadius.vertical(top: Radius.circular(8.0));
const verticalTopRadius10 = BorderRadius.vertical(top: Radius.circular(10.0));
const verticalTopRadius12 = BorderRadius.vertical(top: Radius.circular(12.0));
const verticalTopRadius14 = BorderRadius.vertical(top: Radius.circular(14.0));
const verticalTopRadius16 = BorderRadius.vertical(top: Radius.circular(16.0));
const verticalTopRadius18 = BorderRadius.vertical(top: Radius.circular(18.0));
const verticalTopRadius20 = BorderRadius.vertical(top: Radius.circular(20.0));
const verticalTopRadius22 = BorderRadius.vertical(top: Radius.circular(22.0));
const verticalTopRadius24 = BorderRadius.vertical(top: Radius.circular(24.0));
const verticalTopRadius26 = BorderRadius.vertical(top: Radius.circular(26.0));
const verticalTopRadius28 = BorderRadius.vertical(top: Radius.circular(28.0));
const verticalTopRadius30 = BorderRadius.vertical(top: Radius.circular(30.0));
const verticalTopRadius32 = BorderRadius.vertical(top: Radius.circular(32.0));
const verticalTopRadius34 = BorderRadius.vertical(top: Radius.circular(34.0));
const verticalTopRadius36 = BorderRadius.vertical(top: Radius.circular(36.0));
const verticalTopRadius38 = BorderRadius.vertical(top: Radius.circular(38.0));
const verticalTopRadius40 = BorderRadius.vertical(top: Radius.circular(40.0));
const verticalTopRadius42 = BorderRadius.vertical(top: Radius.circular(42.0));
const verticalTopRadius44 = BorderRadius.vertical(top: Radius.circular(44.0));
const verticalTopRadius46 = BorderRadius.vertical(top: Radius.circular(46.0));
const verticalTopRadius48 = BorderRadius.vertical(top: Radius.circular(48.0));
const verticalTopRadius50 = BorderRadius.vertical(top: Radius.circular(50.0));

const verticalBottomRadius2 =
    BorderRadius.vertical(bottom: Radius.circular(2.0));
const verticalBottomRadius4 =
    BorderRadius.vertical(bottom: Radius.circular(4.0));
const verticalBottomRadius6 =
    BorderRadius.vertical(bottom: Radius.circular(6.0));
const verticalBottomRadius8 =
    BorderRadius.vertical(bottom: Radius.circular(8.0));
const verticalBottomRadius10 =
    BorderRadius.vertical(bottom: Radius.circular(10.0));
const verticalBottomRadius12 =
    BorderRadius.vertical(bottom: Radius.circular(12.0));
const verticalBottomRadius14 =
    BorderRadius.vertical(bottom: Radius.circular(14.0));
const verticalBottomRadius16 =
    BorderRadius.vertical(bottom: Radius.circular(16.0));
const verticalBottomRadius18 =
    BorderRadius.vertical(bottom: Radius.circular(18.0));
const verticalBottomRadius20 =
    BorderRadius.vertical(bottom: Radius.circular(20.0));
const verticalBottomRadius22 =
    BorderRadius.vertical(bottom: Radius.circular(22.0));
const verticalBottomRadius24 =
    BorderRadius.vertical(bottom: Radius.circular(24.0));
const verticalBottomRadius26 =
    BorderRadius.vertical(bottom: Radius.circular(26.0));
const verticalBottomRadius28 =
    BorderRadius.vertical(bottom: Radius.circular(28.0));
const verticalBottomRadius30 =
    BorderRadius.vertical(bottom: Radius.circular(30.0));
const verticalBottomRadius32 =
    BorderRadius.vertical(bottom: Radius.circular(32.0));
const verticalBottomRadius34 =
    BorderRadius.vertical(bottom: Radius.circular(34.0));
const verticalBottomRadius36 =
    BorderRadius.vertical(bottom: Radius.circular(36.0));
const verticalBottomRadius38 =
    BorderRadius.vertical(bottom: Radius.circular(38.0));
const verticalBottomRadius40 =
    BorderRadius.vertical(bottom: Radius.circular(40.0));
const verticalBottomRadius42 =
    BorderRadius.vertical(bottom: Radius.circular(42.0));
const verticalBottomRadius44 =
    BorderRadius.vertical(bottom: Radius.circular(44.0));
const verticalBottomRadius46 =
    BorderRadius.vertical(bottom: Radius.circular(46.0));
const verticalBottomRadius48 =
    BorderRadius.vertical(bottom: Radius.circular(48.0));
const verticalBottomRadius50 =
    BorderRadius.vertical(bottom: Radius.circular(50.0));

const horizontalLeftRadius2 =
    BorderRadius.horizontal(left: Radius.circular(2.0));
const horizontalLeftRadius4 =
    BorderRadius.horizontal(left: Radius.circular(4.0));
const horizontalLeftRadius6 =
    BorderRadius.horizontal(left: Radius.circular(6.0));
const horizontalLeftRadius8 =
    BorderRadius.horizontal(left: Radius.circular(8.0));
const horizontalLeftRadius10 =
    BorderRadius.horizontal(left: Radius.circular(10.0));
const horizontalLeftRadius12 =
    BorderRadius.horizontal(left: Radius.circular(12.0));
const horizontalLeftRadius14 =
    BorderRadius.horizontal(left: Radius.circular(14.0));
const horizontalLeftRadius16 =
    BorderRadius.horizontal(left: Radius.circular(16.0));
const horizontalLeftRadius18 =
    BorderRadius.horizontal(left: Radius.circular(18.0));
const horizontalLeftRadius20 =
    BorderRadius.horizontal(left: Radius.circular(20.0));
const horizontalLeftRadius22 =
    BorderRadius.horizontal(left: Radius.circular(22.0));
const horizontalLeftRadius24 =
    BorderRadius.horizontal(left: Radius.circular(24.0));
const horizontalLeftRadius26 =
    BorderRadius.horizontal(left: Radius.circular(26.0));
const horizontalLeftRadius28 =
    BorderRadius.horizontal(left: Radius.circular(28.0));
const horizontalLeftRadius30 =
    BorderRadius.horizontal(left: Radius.circular(30.0));
const horizontalLeftRadius32 =
    BorderRadius.horizontal(left: Radius.circular(32.0));
const horizontalLeftRadius34 =
    BorderRadius.horizontal(left: Radius.circular(34.0));
const horizontalLeftRadius36 =
    BorderRadius.horizontal(left: Radius.circular(36.0));
const horizontalLeftRadius38 =
    BorderRadius.horizontal(left: Radius.circular(38.0));
const horizontalLeftRadius40 =
    BorderRadius.horizontal(left: Radius.circular(40.0));
const horizontalLeftRadius42 =
    BorderRadius.horizontal(left: Radius.circular(42.0));
const horizontalLeftRadius44 =
    BorderRadius.horizontal(left: Radius.circular(44.0));
const horizontalLeftRadius46 =
    BorderRadius.horizontal(left: Radius.circular(46.0));
const horizontalLeftRadius48 =
    BorderRadius.horizontal(left: Radius.circular(48.0));
const horizontalLeftRadius50 =
    BorderRadius.horizontal(left: Radius.circular(50.0));

const horizontalRightRadius2 =
    BorderRadius.horizontal(right: Radius.circular(2.0));
const horizontalRightRadius4 =
    BorderRadius.horizontal(right: Radius.circular(4.0));
const horizontalRightRadius6 =
    BorderRadius.horizontal(right: Radius.circular(6.0));
const horizontalRightRadius8 =
    BorderRadius.horizontal(right: Radius.circular(8.0));
const horizontalRightRadius10 =
    BorderRadius.horizontal(right: Radius.circular(10.0));
const horizontalRightRadius12 =
    BorderRadius.horizontal(right: Radius.circular(12.0));
const horizontalRightRadius14 =
    BorderRadius.horizontal(right: Radius.circular(14.0));
const horizontalRightRadius16 =
    BorderRadius.horizontal(right: Radius.circular(16.0));
const horizontalRightRadius18 =
    BorderRadius.horizontal(right: Radius.circular(18.0));
const horizontalRightRadius20 =
    BorderRadius.horizontal(right: Radius.circular(20.0));
const horizontalRightRadius22 =
    BorderRadius.horizontal(right: Radius.circular(22.0));
const horizontalRightRadius24 =
    BorderRadius.horizontal(right: Radius.circular(24.0));
const horizontalRightRadius26 =
    BorderRadius.horizontal(right: Radius.circular(26.0));
const horizontalRightRadius28 =
    BorderRadius.horizontal(right: Radius.circular(28.0));
const horizontalRightRadius30 =
    BorderRadius.horizontal(right: Radius.circular(30.0));
const horizontalRightRadius32 =
    BorderRadius.horizontal(right: Radius.circular(32.0));
const horizontalRightRadius34 =
    BorderRadius.horizontal(right: Radius.circular(34.0));
const horizontalRightRadius36 =
    BorderRadius.horizontal(right: Radius.circular(36.0));
const horizontalRightRadius38 =
    BorderRadius.horizontal(right: Radius.circular(38.0));
const horizontalRightRadius40 =
    BorderRadius.horizontal(right: Radius.circular(40.0));
const horizontalRightRadius42 =
    BorderRadius.horizontal(right: Radius.circular(42.0));
const horizontalRightRadius44 =
    BorderRadius.horizontal(right: Radius.circular(44.0));
const horizontalRightRadius46 =
    BorderRadius.horizontal(right: Radius.circular(46.0));
const horizontalRightRadius48 =
    BorderRadius.horizontal(right: Radius.circular(48.0));
const horizontalRightRadius50 =
    BorderRadius.horizontal(right: Radius.circular(50.0));

const allRadius2 = BorderRadius.all(Radius.circular(2.0));
const allRadius4 = BorderRadius.all(Radius.circular(4.0));
const allRadius6 = BorderRadius.all(Radius.circular(6.0));
const allRadius8 = BorderRadius.all(Radius.circular(8.0));
const allRadius10 = BorderRadius.all(Radius.circular(10.0));
const allRadius12 = BorderRadius.all(Radius.circular(12.0));
const allRadius14 = BorderRadius.all(Radius.circular(14.0));
const allRadius16 = BorderRadius.all(Radius.circular(16.0));
const allRadius18 = BorderRadius.all(Radius.circular(18.0));
const allRadius20 = BorderRadius.all(Radius.circular(20.0));
const allRadius22 = BorderRadius.all(Radius.circular(22.0));
const allRadius24 = BorderRadius.all(Radius.circular(24.0));
const allRadius26 = BorderRadius.all(Radius.circular(26.0));
const allRadius28 = BorderRadius.all(Radius.circular(28.0));
const allRadius30 = BorderRadius.all(Radius.circular(30.0));
const allRadius32 = BorderRadius.all(Radius.circular(32.0));
const allRadius34 = BorderRadius.all(Radius.circular(34.0));
const allRadius36 = BorderRadius.all(Radius.circular(36.0));
const allRadius38 = BorderRadius.all(Radius.circular(38.0));
const allRadius40 = BorderRadius.all(Radius.circular(40.0));
const allRadius42 = BorderRadius.all(Radius.circular(42.0));
const allRadius44 = BorderRadius.all(Radius.circular(44.0));
const allRadius46 = BorderRadius.all(Radius.circular(46.0));
const allRadius48 = BorderRadius.all(Radius.circular(48.0));
const allRadius50 = BorderRadius.all(Radius.circular(50.0));

/// Extension on SizedBox to allow merging of margins using `+` and `-` operators.
extension MergeMargins on SizedBox {
  /// Adds the width and height of two [SizedBox] widgets.
  ///
  /// The resulting [SizedBox] will have the combined width and height
  /// of both [SizedBox] widgets, with the second [SizedBox] retaining its child.
  ///
  /// Example:
  /// ```dart
  /// SizedBox box1 = SizedBox(width: 10.0, height: 10.0.w);
  /// SizedBox box2 = SizedBox(width: 5.0, height: 5.0.w);
  /// SizedBox result = box1 + box2;
  /// // result will have width = 15.0, height = 15.0
  /// ```
  SizedBox operator +(SizedBox other) {
    return SizedBox(
      width: (width ?? 0.0) + (other.width ?? 0.0),
      height: (height ?? 0.0) + (other.height ?? 0.0),
      child: other.child,
    );
  }

  /// Subtracts the width and height of the second [SizedBox] from the first.
  ///
  /// The resulting [SizedBox] will have the subtracted width and height
  /// of the two [SizedBox] widgets, with the second [SizedBox] retaining its child.
  ///
  /// Example:
  /// ```dart
  /// SizedBox box1 = SizedBox(width: 10.0, height: 10.0.w);
  /// SizedBox box2 = SizedBox(width: 5.0, height: 5.0.w);  finalizedBox box2 = SizedBox(width: 5.0, height: 5.0.w);
  /// SizedBox result = box1 - box2;
  /// // result will have width = 5.0, height = 5.0
  /// ```
  SizedBox operator -(SizedBox other) {
    return SizedBox(
      width: (width ?? 0.0) - (other.width ?? 0.0),
      height: (height ?? 0.0) - (other.height ?? 0.0),
      child: other.child,
    );
  }
}

/// A custom sliver cross-axis margin widget used to add space
/// in the cross-axis direction within a sliver layout.
class SliverCrossAxisMargin extends StatelessWidget {
  const SliverCrossAxisMargin({super.key, required this.extent});

  /// The extent of the margin in the cross-axis direction.
  final double extent;

  @override
  Widget build(BuildContext context) {
    return SliverConstrainedCrossAxis(maxExtent: extent, sliver: emptySliver);
  }
}
