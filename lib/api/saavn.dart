import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

String baseurl = "https://saavn.dev/api/search";
Future globalSearch(query) async {
  query = query.replaceAll(' ', '+');
  var url = Uri.parse('$baseurl?query=$query');
  var response = await http.get(url);
  var data = json.decode(response.body);
  return data["data"];
}

Future searchsongs(query) async {
  query = query.replaceAll(' ', '+');
  var url = Uri.parse('$baseurl/songs?query=$query');
  var response = await http.get(url);
  var data = json.decode(response.body);
  return data["data"]["results"];
}

Future searchalbums(query) async {
  query = query.replaceAll(' ', '+');
  var url = Uri.parse('$baseurl/albums?query=$query');
  var response = await http.get(url);
  var data = json.decode(response.body);
  return data["data"]["results"];
}

Future searchplaylists(query) async {
  query = query.replaceAll(' ', '+');
  var url = Uri.parse('$baseurl/playlists?query=$query');
  var response = await http.get(url);
  var data = json.decode(response.body);
  return data["data"]["results"];
}

Future searchartists(query) async {
  query = query.replaceAll(' ', '+');
  var url = Uri.parse('$baseurl/artists?query=$query');
  var response = await http.get(url);
  var data = json.decode(response.body);
  return data["data"]["results"];
}