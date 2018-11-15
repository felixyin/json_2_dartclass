# JSON to Dart

[![Build Status](https://travis-ci.org/javiercbk/json_to_dart.svg?branch=master)](https://travis-ci.org/javiercbk/json_to_dart)

Given a JSON string, this library will generate all the necesary Dart classes to parse and generate JSON.

This library is designed to generate Flutter friendly model classes following the [flutter's doc recommendation](https://flutter.io/json/#serializing-json-manually-using-dartconvert).
## Caveats 
- In an array of objects, it is assumed that the first object is representative of the rest of them.
- When an empty array is given, it will create a List<Null>. Such weird behaviour should warn the user that there is no data to extract.
- Equal structures are not detected yet (Equal classes are going to be created over and over).
- Dart automatically casts doubles without decimals (like 10.0) to int. Use doubles with at least one decimal number.
- Properties named with funky names (like "!breaks", "|breaks", etc) or keyword (like "this", "break", "class", etc) will produce syntax errors.

## 修改内容
1. 输出class到每个独立dart文件，输出到项目根目录下的json_2_dartclass文件夹
2. 增加import语句

> 复制输出目录的dart文件，直接可用，无需二次修改。
> 配合服务端的swiger技术，可以极大的提高flutter app的网络开发效率。
