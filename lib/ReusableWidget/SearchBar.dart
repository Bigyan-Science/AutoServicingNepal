import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                fillColor: Color.fromARGB(121, 232, 230, 230),
                filled: true,
                hintText: 'Search',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.orange)),
                prefixIcon: IconButton(
                  color: Colors.black,
                  icon: const Icon(
                    Icons.search,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          InkWell(
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.notifications,
                color: Color.fromARGB(255, 255, 72, 0),
                size: 30,
              ),
            ),
            onTap: () {
              // code to handle notification bell tap
            },
          ),
        ],
      ),
    );
  }
}
