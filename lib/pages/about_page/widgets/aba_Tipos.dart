import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex_youtube/components/circular_progress_about.dart';
import 'package:pokedex_youtube/models/specie.dart';
import 'package:pokedex_youtube/stores/pokeapi_store.dart';



class AbaHabilidade extends StatelessWidget {
  final PokeApiStore _pokeApiStore = GetIt.instance<PokeApiStore>();


  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Tipos',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Observer(builder: (context) {
              return SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    setTipos(_pokeApiStore.pokemonAtual.type),
                  ],
                ),);
            }),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget setTipos(List<String> types) {
    List<Widget> lista = [];
    types.forEach((nome) {
      lista.add(
        Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: _pokeApiStore.corPokemon),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  nome.trim(),
                  style: TextStyle(
                      fontFamily: 'Google',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              width: 8,
            )
          ],
        ),
      );
    });
    return Row(
      children: lista,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}
