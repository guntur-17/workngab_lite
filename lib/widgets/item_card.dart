import 'package:flutter/material.dart';

class itemList extends StatefulWidget {
  const itemList({Key? key}) : super(key: key);

  @override
  _itemListState createState() => _itemListState();
}

class _itemListState extends State<itemList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: List.generate(
            10,
            (int i) => ListTileItem(
                  title: 'item $i',
                )),
      ),
    );
  }
}

class ListTileItem extends StatefulWidget {
  const ListTileItem({required this.title, Key? key}) : super(key: key);
  final String title;

  @override
  _ListTileItemState createState() => _ListTileItemState();
}

class _ListTileItemState extends State<ListTileItem> {
  int _itemCount = 0;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.title),
      onTap: () {},
      trailing: _buildTrailingWidget(),
    );
  }

  Widget _buildTrailingWidget() {
    return FittedBox(
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: () =>
                setState(() => _itemCount != 0 ? _itemCount-- : _itemCount),
          ),
          Text(_itemCount.toString()),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () =>
                setState(() => _itemCount != 0 ? _itemCount++ : _itemCount),
          ),
        ],
      ),
    );
  }
}
