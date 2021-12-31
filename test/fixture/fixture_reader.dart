import 'dart:io';

Future<String> fixture(String name)async=>File("test/fixture/$name").readAsString();
