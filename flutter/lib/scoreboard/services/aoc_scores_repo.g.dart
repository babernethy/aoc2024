// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aoc_scores_repo.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _AOCClient implements AOCClient {
  _AOCClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??=
        'https://us-central1-fb-cors-proxy-5b095.cloudfunctions.net/cors?url=https://adventofcode.com/2023/leaderboard/private/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<AocScores> getCurrentAOCScores() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<AocScores>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/view/957459.json',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = AocScores.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getAocScoresRepoHash() => r'10e4613af4fb0a58bac885d7a6da118bb13c1055';

/// See also [getAocScoresRepo].
@ProviderFor(getAocScoresRepo)
final getAocScoresRepoProvider = AutoDisposeProvider<AocScoresRepo>.internal(
  getAocScoresRepo,
  name: r'getAocScoresRepoProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getAocScoresRepoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetAocScoresRepoRef = AutoDisposeProviderRef<AocScoresRepo>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
