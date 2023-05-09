// ignore_for_file: sized_box_for_whitespace, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//<===||::r::u::b::e::n::>
class UserInfoHomePage extends StatelessWidget {
  const UserInfoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black45,
        ),
        margin: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 55.0,
              height: 55.0,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://cdn.iconscout.com/icon/free/png-256/avatar-370-456322.png?f=webp&w=256'),
              ),
            ),
            SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    Text(
                      'Hi there, ',
                      style: TextStyle(fontSize: 26, color: Colors.white),
                    ),
                    Text(
                      'Username!', //{$user.userName}!
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                          color: Colors.amber[900]),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_month_outlined,
                      size: 15,
                      color: Colors.amber[900],
                    ),
                    Text(
                      DateFormat.yMEd().add_jms().format(DateTime.now()),
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
