import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comicvine/src/presentation/widgets/CustomAppBar.dart';
import 'package:comicvine/src/data/bloc/details_bloc.dart';
import 'package:comicvine/src/presentation/widgets/details/IssueHeaderDetail.dart';

enum DetailType { issue, episode, movie }

class DetailsScreen extends StatefulWidget {
  final String api_detail_url;

  const DetailsScreen({Key? key, required this.api_detail_url}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late DetailsBloc _detailsBloc;

  @override
  void initState() {
    super.initState();
    _detailsBloc = DetailsBloc();
    _detailsBloc.add(FetchDetailsEvent(widget.api_detail_url));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _detailsBloc,
      child: BlocBuilder<DetailsBloc, DetailsState>(
        builder: (context, state) {
          if (state is DetailsLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is DetailsSuccessState) {
            // print(state.response['results']);
            if (state.response['results'] != null && state.response['results']['name'] != null && state.response['results']['name'] is String) {
              var results = state.response['results'];
              return Scaffold(
                // 'name' is shared between issues, series and movies
                appBar: CustomAppBar(title: results['name']),
                // appBar: CustomAppBar(title: 'Détails'),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      IssueHeaderDetail(results: results)
                    ],
                  ),
                )
              );
            } else {
              return Scaffold(
                appBar: CustomAppBar(title: 'Détails'),
                body: const Center(
                  child: Text('Un probèleme est survenu lors de la récupération des données. Veuillez réessayer.'),
                ),
              );
            }
          } else if (state is DetailsErrorState) {
            return Text('Error: ${state.exception}');
          } else {
            return Text('Unexpected state: $state');
          }
        },
      ),
    );
  }
}