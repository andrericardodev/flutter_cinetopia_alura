import 'package:flutter/material.dart';
import 'package:flutter_cinetopia_alura/app/viewmodels/releases_viewmodel.dart';
import 'package:flutter_cinetopia_alura/ui/components/movie_card.dart';
import 'package:flutter_cinetopia_alura/ui/screens/movie_details.dart';

class Releases extends StatelessWidget {
  Releases({super.key});

  final ReleasesViewmodel viewmodel = ReleasesViewmodel();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: viewmodel.getUpcomingMovies(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Image.asset(
                  "assets/images/upcoming.png",
                  width: 80,
                  height: 80,
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 40),
                  child: Text(
                    "Próximos Lançamentos",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              SliverList.builder(
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MovieDetails(
                                      movie: viewmodel.moviesList[index],
                                    )));
                      },
                      child: MovieCard(movie: viewmodel.moviesList[index])),
                ),
                itemCount: viewmodel.moviesList.length,
              ),
            ],
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
