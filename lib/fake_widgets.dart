import 'package:flutter/material.dart';

class FakeAppBar extends StatelessWidget {
  const FakeAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.menu),
        buildText('All Books'),
        Icon(Icons.search),
      ],
    );
  }
}

class FakeTabBar extends StatelessWidget {
  const FakeTabBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: Container(
        color: Colors.grey.shade200,
        child: Padding(
          padding: EdgeInsets.all(4),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(4),
                  color: Colors.white,
                  child: Center(child: buildText('Ebooks')),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(4),
                  child: Center(child: buildText('Audiobooks')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Text buildText(String text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
  );
}
