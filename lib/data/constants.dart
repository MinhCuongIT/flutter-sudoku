import 'package:flutter/material.dart';

enum Type { number, color, image }
enum Difficulty { easy, medium, hard, ultra }
enum Options { type, difficulty }

class Constants {
  static const color = '#color';
  static const difficulty = '#difficulty';
  static const easy = '#easy';
  static const hard = '#hard';
  static const icon = '#icon';
  static const id = '#id';
  static const index = '#index';
  static const image = '#image';
  static const match = '#match';
  static const mask = '#mask';
  static const medium = '#medium';
  static const number = '#number';
  static const temp = '#temp';
  static const type = '#type';
  static const ultra = '#ultra';
  static const colors = [
    {
      icon: Icons.circle,
      color: Colors.grey,
    },
    {
      icon: Icons.circle,
      color: Colors.blueAccent,
    },
    {
      icon: Icons.circle,
      color: Colors.cyanAccent,
    },
    {
      icon: Icons.circle,
      color: Colors.redAccent,
    },
    {
      icon: Icons.circle,
      color: Color(0xffffea00),
    },
    {
      icon: Icons.circle,
      color: Colors.orangeAccent,
    },
    {
      icon: Icons.circle,
      color: Colors.greenAccent,
    },
    {
      icon: Icons.circle,
      color: Color(0xfff8bbd0),
    },
    {
      icon: Icons.circle,
      color: Colors.purpleAccent,
    },
  ];
  static const difficulties = [
    {
      difficulty: easy,
      icon: Icon(
        Icons.star_border,
        color: Colors.greenAccent,
        size: 26,
      ),
    },
    {
      difficulty: medium,
      icon: Icon(
        Icons.star_half,
        color: Colors.orangeAccent,
        size: 26,
      ),
    },
    {
      difficulty: hard,
      icon: Icon(
        Icons.star,
        color: Colors.red,
        size: 26,
      ),
    },
    {
      difficulty: ultra,
      icon: Icon(
        Icons.stars,
        color: Colors.black,
        size: 26,
      ),
    },
  ];
  static const images = [
    {
      icon: Icons.airplanemode_active,
      color: Colors.grey,
    },
    {
      icon: Icons.cloud,
      color: Colors.blue,
    },
    {
      icon: Icons.ac_unit,
      color: Colors.cyan,
    },
    {
      icon: Icons.favorite,
      color: Colors.red,
    },
    {
      icon: Icons.music_note,
      color: Color(0xffffd600),
    },
    {
      icon: Icons.beach_access,
      color: Colors.orange,
    },
    {
      icon: Icons.android,
      color: Colors.lightGreen,
    },
    {
      icon: Icons.drive_eta,
      color: Colors.pinkAccent,
    },
    {
      icon: Icons.access_alarm,
      color: Colors.purple,
    },
  ];
  static const types = [
    {
      type: number,
      icon: Icon(
        Icons.looks_3,
        color: Colors.red,
        size: 26,
      ),
    },
    {
      type: color,
      icon: Icon(
        Icons.circle,
        color: Colors.blue,
        size: 26,
      ),
    },
    {
      type: image,
      icon: Icon(
        Icons.beach_access,
        color: Colors.orange,
        size: 26,
      ),
    },
  ];
}
