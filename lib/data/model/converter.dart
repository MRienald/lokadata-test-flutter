// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';


bool typeEqual<S, T>() => S == T;

bool typeEqualn<S, T>() {
  return typeEqual<S, T>() || typeEqual<S?, T?>();
}

class Converter<T> implements JsonConverter<T, Object> {
  const Converter();

  @override
  T fromJson(Object? json) {
    json = json as Map<String, dynamic>;
    // if(typeEqual<T, Mahasiswa>()){
    //   return Mahasiswa.fromJson(json) as T;
    // }
    throw UnimplementedError('`$T` fromJson factory unimplemented.');
  }

  @override
  Map<String, dynamic> toJson(T obj) {
    throw UnimplementedError('`$T` toJson factory unimplemented.');
  }
}
