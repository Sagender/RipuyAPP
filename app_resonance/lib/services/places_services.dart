import '../models/galeria_model.dart';
import '../models/models.dart';
import 'dart:convert';

import 'package:flutter/material.dart';

import "package:http/http.dart" as http;

import '../models/recomendation_model.dart';

class PlaceService extends ChangeNotifier {
  final String _baseUrl = "appresonance-ac9e0-default-rtdb.firebaseio.com";

  final List<Place> place = [];
  final List<DoIt> doIt = [];
  final List<EatIt> eatIt = [];
  final List<Tarumba> tarumba = [];
  final List<Recomendation> recomendation = [];
  final List<Galeria> galeria = [];

  bool isLoading = true;

  PlaceService() {
    loadPlace();
    loadDoIt();
    loadEatIt();
    loadTarumba();
    loadRecomendation();
    loadGaleria();
  }

  Future loadPlace() async {
    this.isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, "Lugares.json");
    final resp = await http.get(url);

    final Map<String, dynamic> placeMap = json.decode(resp.body);

    placeMap.forEach((key, value) {
      final tempPlace = Place.fromMap(value);
      tempPlace.id = key;
      this.place.add(tempPlace);
    });
    this.isLoading = false;
    notifyListeners();
    return this.place;
  }

//Implemntación Doit

  Future loadDoIt() async {
    this.isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, "doIt.json");
    final resp = await http.get(url);

    final Map<String, dynamic> doItMap = json.decode(resp.body);

    doItMap.forEach((key, value) {
      final tempDoIt = DoIt.fromMap(value);
      tempDoIt.id = key;
      this.doIt.add(tempDoIt);
    });
    this.isLoading = false;
    notifyListeners();
    return this.doIt;
  }

// implementación Donde comer
  Future loadEatIt() async {
    this.isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, "comer.json");
    final resp = await http.get(url);

    final Map<String, dynamic> eatItMap = json.decode(resp.body);

    eatItMap.forEach((key, value) {
      final tempEatIt = EatIt.fromMap(value);
      tempEatIt.id = key;
      this.eatIt.add(tempEatIt);
    });
    this.isLoading = false;
    notifyListeners();
    return this.eatIt;
  }

  // implementación Tarumba

  Future loadTarumba() async {
    this.isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, "Tarumba.json");
    final resp = await http.get(url);

    final Map<String, dynamic> tarumbaMap = json.decode(resp.body);

    tarumbaMap.forEach((key, value) {
      final tempTarumba = Tarumba.fromMap(value);
      tempTarumba.id = key;
      this.tarumba.add(tempTarumba);
    });
    this.isLoading = false;
    notifyListeners();
    return this.tarumba;
  }

  Future loadRecomendation() async {
    this.isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, "recomendation.json");
    final resp = await http.get(url);

    final Map<String, dynamic> recomendationMap = json.decode(resp.body);

    recomendationMap.forEach((key, value) {
      final tempRecomendation = Recomendation.fromMap(value);
      tempRecomendation.id = key;
      this.recomendation.add(tempRecomendation);
    });
    this.isLoading = false;
    notifyListeners();
    return this.recomendation;
  }

  //Implementación para Galería

  Future loadGaleria() async {
    this.isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, "galeria.json");
    final resp = await http.get(url);

    final Map<String, dynamic> galeriaMap = json.decode(resp.body);

    galeriaMap.forEach((key, value) {
      final tempGaleria = Galeria.fromMap(value);
      tempGaleria.id = key;
      this.galeria.add(tempGaleria);
    });
    this.isLoading = false;
    notifyListeners();
    return this.galeria;
  }
}