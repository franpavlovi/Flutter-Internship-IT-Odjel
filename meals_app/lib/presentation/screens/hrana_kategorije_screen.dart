import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/domain/bloc/filtrirana_hrana_bloc.dart';

class HranaKategorijeScreen extends StatelessWidget {
  const HranaKategorijeScreen({
    super.key,
    required this.nazivKategorije,
  });

  final String nazivKategorije;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nazivKategorije),
      ),
      body: BlocBuilder<FiltriranaHranaBloc, FiltriranaHranaState>(
        builder: (context, state) {
          if (state is FiltriranaHranaInitial || state is FiltriranaHranaLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is FiltriranaHranaLoaded) {
            return ListView.builder(
              itemCount: state.filtriranaJela!.length,
              itemBuilder: (ctx, index) {
                return Text(state.filtriranaJela![index].naziv);
              },
            );
          }

          return Container();
        },
      ),
    );
  }
}
