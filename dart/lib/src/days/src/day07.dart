import 'package:aoc2022/src/days/base_day.dart';
import 'package:flutter/foundation.dart';

class ElfFileSystem {
  final String name;
  int? size = 0;
  Map<String, ElfFileSystem>? children;
  ElfFileSystem? parent;

  ElfFileSystem(
    this.name, {
    required bool isADrectory,
    this.parent,
    this.size,
  }) {
    if (isADrectory) {
      children = {};
    }
  }

  bool isDirectory() => children != null;
  int getSize() => isDirectory() ? _childrenDirSizes() : size!;
  @override
  String toString() => '$name (${children?.length})';
  int _childrenDirSizes() {
    var size = 0;
    if (isDirectory()) {
      for (final child in children!.values) {
        size += child.getSize();
      }
    }
    return size;
  }

  int partOne() {
    var size = 0;
    if (isDirectory()) {
      for (final child in children!.values) {
        if (child.isDirectory()) {
          final checkSize = child.getSize();
          if (checkSize <= 100000) {
            size += checkSize;
          }
          size += child.partOne();
        }
      }
    }
    return size;
  }

  int partTwo(int targetSizeMinimum) {
    var size = 70000000;
    if (isDirectory()) {
      for (final child in children!.values) {
        if (child.isDirectory()) {
          final checkSize = child.getSize();
          if (checkSize > targetSizeMinimum && checkSize < size) {
            size = checkSize;
          }
          final checkChildren = child.partTwo(targetSizeMinimum);
          if (checkChildren > targetSizeMinimum && checkChildren < size) {
            size = checkChildren;
          }
        }
      }
    }
    return size;
  }
}

class Day07Logic extends BaseDayLogic {
  String input;
  late ElfFileSystem outermost;
  late ElfFileSystem pointer;

  Day07Logic(super.dayNumber, super.title)
      : input = """
\$ cd /
\$ ls
dir a
14848514 b.txt
8504156 c.dat
dir d
\$ cd a
\$ ls
dir e
29116 f
2557 g
62596 h.lst
\$ cd e
\$ ls
584 i
\$ cd ..
\$ cd ..
\$ cd d
\$ ls
4060174 j
8033020 d.log
5626152 d.ext
7214296 k""";

  Future<void> initialize() async {
    input = await loadDayFileString();
    outermost = ElfFileSystem('root', isADrectory: true);
    pointer = outermost;

    final lines = input.split('\n'); //already made outermost
    for (final line in lines) {
      // debugPrint('$line - $pointer}');
      try {
        if (line.contains('/')) {
          continue;
        } else if (line.contains('\$ ls')) {
          continue;
        } else if (line.startsWith('\$ cd')) {
          final cdInfo = line.split(' ');
          if (cdInfo[2] == '..') {
            pointer = pointer.parent!;
          } else {
            final dirName = cdInfo[2];
            // debugPrint(
            //   'will cd to $dirName - ${pointer.children!.containsKey(dirName)}',
            // );
            pointer = pointer.children![dirName]!;
          }
        } else if (line.startsWith('dir')) {
          final dirInfo = line.split(' ');
          final newDirectory =
              ElfFileSystem(dirInfo[1], parent: pointer, isADrectory: true);
          pointer.children!.addAll({dirInfo[1]: newDirectory});
        } else {
          final fileInfo = line.split(' ');
          final newFile = ElfFileSystem(
            fileInfo[1],
            isADrectory: false,
            parent: pointer,
            size: int.parse(fileInfo[0]),
          );
          pointer.children!.addAll({fileInfo[1]: newFile});
        }
      } catch (e) {
        //  debugPrint('$e');
      }
    }
  }

  @override
  Future<PartResult> partOne() async {
    await initialize();
    var result = 0;

    // outermost.children!.forEach((key, value) {
    //   debugPrint('$key - ${value.getSize()}');
    // });

    result = outermost.partOne();

    return PartResult(result: result.toString());
  }

  @override
  Future<PartResult> partTwo() async {
    await initialize();
    var result = 0;
    final neededSpace = 30000000 - (70000000 - outermost.getSize());
    result = outermost.partTwo(neededSpace);

    return PartResult(result: result.toString());
  }
}
