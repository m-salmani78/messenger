import 'package:flutter/material.dart';
import 'package:messenger/screens/home_page/widgets/card_list_item.dart';
import 'package:messenger/screens/home_page/widgets/circle_list_item.dart';
import 'package:messenger/widgets/shimmer.dart';

class Body extends StatelessWidget {
  final bool _isLoading;

  const Body(this._isLoading);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: _isLoading
          ? const NeverScrollableScrollPhysics()
          : const BouncingScrollPhysics(),
      itemCount: _isLoading ? 3 : 8,
      itemBuilder: (context, index) {
        if (index == 0) {
          return _buildTopRowList();
        }
        return _buildListItem();
      },
    );
  }

  Widget _buildTopRowList() {
    return Container(
      height: 78,
      padding: EdgeInsets.symmetric(vertical: 4),
      child: ListView(
        physics: _isLoading ? const NeverScrollableScrollPhysics() : null,
        scrollDirection: Axis.horizontal,
        shrinkWrap: false,
        children: [
          _buildTopRowItem(),
          _buildTopRowItem(),
          _buildTopRowItem(),
          _buildTopRowItem(),
          _buildTopRowItem(),
          _buildTopRowItem(),
        ],
      ),
    );
  }

  Widget _buildTopRowItem() {
    return ShimmerLoading(
      isLoading: _isLoading,
      child: CircleListItem(),
    );
  }

  Widget _buildListItem() {
    return ShimmerLoading(
      isLoading: _isLoading,
      child: CardListItem(
        isLoading: _isLoading,
      ),
    );
  }
}
