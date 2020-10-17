import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_youtube/stores/pokeapi_store.dart';
import 'package:pokedex_youtube/stores/pokeapiv2_store.dart';

class AbaHabilidade extends StatelessWidget {
  final PokeApiV2Store _pokeApiV2 = GetIt.instance<PokeApiV2Store>();
  final PokeApiStore _pokeApiStore = GetIt.instance<PokeApiStore>();


  Widget getAbilitiesPokemon() {
    List<Widget> lista = [];
    _pokeApiV2.pokeApiV2.abilities.forEach((nome) {
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
                  nome.ability.name,
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

  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Habilidades',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Observer(builder: (context) {
              return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          getAbilitiesPokemon()
                        ],
                      )
                    ],
                )
              );
            }),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

}
