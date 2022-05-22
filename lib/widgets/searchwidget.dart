import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16,8,16,8),
      child: TextField(decoration: InputDecoration( hintText: 'Search', hintStyle: TextStyle(color: Colors.blueGrey)
      ,filled: true,fillColor: Colors.grey.shade200,
        prefixIcon: const Icon(Icons.search, color: Colors.black,),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none
        )
, focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(16)
          )

      ),),
    );
  }
}
