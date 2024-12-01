import 'dart:convert';

import 'package:aoc2023/scoreboard/models/aoc_scores.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'aoc_scores_repo.g.dart';

@riverpod
AocScoresRepo getAocScoresRepo(GetAocScoresRepoRef ref) {
  return AocScoresRepo(ref);
}

class AocScoresRepo {
  final GetAocScoresRepoRef ref;
  AocScoresRepo(this.ref);

  Future<List<Member>> getAocScoress() async {
    const bool useSampleData = true;

// when not wanting to overwhelm the server

    if (useSampleData) {
      final sampleData =
          await rootBundle.loadString('assets/data/sampleaocdata.json');
      final sample = AocScores.fromJson(json.decode(sampleData));
      final members = sample.members.values.toList();
      // members.sort((a, b) => b.localScore.compareTo(a.localScore));
      // members.sort((a, b) => b.stars.compareTo(a.stars));
      members.sort((a, b) => a.lastStarTs.compareTo(b.lastStarTs));
      return members;
    }

    final dio = Dio();
    dio.options.headers['Cookie'] =
        'session=53616c7465645f5fcfcc9bfa13410defe1aa260b18df6ce23b5f379cb69a1736ade60132455c73ad6aeca3cd83ffc6ff271b0baff9bfb26d347eef6d75eb99cf';
    final client = AOCClient(dio);

    final response = await client.getCurrentAOCScores();
    return response.members.values.toList();
  }
}

//https://adventofcode.com/2023/leaderboard/private/view/957459.json

@RestApi(baseUrl: 'https://adventofcode.com/2023/leaderboard/private/')
abstract class AOCClient {
  factory AOCClient(Dio dio, {String baseUrl}) = _AOCClient;

  @GET('/view/957459.json')
  Future<AocScores> getCurrentAOCScores();
}
