
using System.ComponentModel.DataAnnotations;
using System.Reflection.Metadata.Ecma335;
using System.Text;

namespace AdventOfCode2024;

public class Day_09 : BaseDay
{
    string file;

    List<int?> fileList = new();
    Dictionary<int, int> freeSpace = new();
    Dictionary<int, (int id, int length)> fileSpace = new();
    int fileLength = 0;

    public Day_09()
    {
        file = "12345";
        // file = "2333133121414131402";
        // file = File.ReadAllText(InputFilePath);

        //replace the filename at the end of InputFilePath with a new filename

    }

    private void InitFileList()
    {
        fileList = new();
        freeSpace = new();
        fileSpace = new();
        fileLength = 0;

        string outputFilePath = Path.Combine(Path.GetDirectoryName(InputFilePath), "09_file.txt");

        File.Delete(outputFilePath);

        var index = 0;

        using (StreamReader reader = new StreamReader(InputFilePath))
        using (StreamWriter writer = new StreamWriter(outputFilePath))
        {
            int character;
            var isFile = true;
            var fileId = 0;
            var sb = new StringBuilder();
            fileList = new();

            while ((character = reader.Read()) != -1)
            {
                // int result = int.Parse(character.ToString());
                int result = character - '0';

                if (isFile)
                {
                    fileSpace.Add(index, (fileId, result));
                }
                else
                {
                    freeSpace.Add(index, result);
                }

                for (int i = 0; i < result; i++)
                {
                    if (isFile)
                    {
                        // writer.Write(fileId.ToString());
                        // sb.Append(fileId.ToString());
                        fileList.Add(fileId);
                    }
                    else
                    {
                        // writer.Write('.');
                        // sb.Append('.');
                        fileList.Add(null);
                    }
                    index++;
                }
                //  Console.WriteLine(sb.ToString());
                if (!isFile)
                {
                    fileId++;

                }
                isFile = !isFile;

            }
        }
        fileLength = index;
    }

    public override ValueTask<string> Solve_1()
    {
        InitFileList();
        bool atEnd = false;
        while (!atEnd)
        {
            for (int i = fileList.Count - 1; i > 0; i--)
            {
                if (fileList[i] == null)
                {
                    continue;
                }
                var current = fileList[i]!;
                var firstEmptyIndex = fileList.FindIndex((element) => element == null);
                if (firstEmptyIndex > i)
                {
                    atEnd = true;
                }
                else
                {
                    fileList[i] = null;
                    fileList[firstEmptyIndex] = current;
                }
            }
        }
        long checksum = 0;
        for (int i = 0; i < fileList.Count; i++)
        {
            if (fileList[i] != null)
            {
                checksum += i * fileList[i]!.Value;
            }
        }

        return new(checksum.ToString());
    }

    (int pointer, int id, int length) FirstFileFromTheEndOfFileStreamSmallerThanSize(int length)
    {
        var result = fileSpace
            .Where(kvp => kvp.Value.length == length)
            .OrderByDescending(kvp => kvp.Key)
            .FirstOrDefault();
        return (result.Key, result.Value.id, result.Value.length);
    }

    (int pointer, int id, int length)? FirstFileFromTheEndOfFileStreamBeforeOffset(int offset, int maxSize)
    {
        var results = fileSpace
            .Where(kvp => kvp.Key < offset && kvp.Value.length <= maxSize)
            .OrderByDescending(kvp => kvp.Key);

      //  Console.WriteLine($"FileSpace Results: {results.Count()}");
        if (results.Count() == 0)
        {
            return null;
        }
        var result = results.FirstOrDefault();
     //   Console.WriteLine($"FileSpace Result: {result.Key} {result.Value}");
        return (result.Key, result.Value.id, result.Value.length);
    }

    (int pointer, int length)? FirstFreeSpaceFromTheEndOfFileStreamThatCanFitSize(int length, int maxOffset)
    {
        var results = freeSpace
            .Where(kvp => kvp.Value >= length && kvp.Key < maxOffset)
            .OrderBy(kvp => kvp.Key);

        //Console.WriteLine($"FreeSpace Results: {results.Count()}");

        if (results.Count() == 0)
        {
            return null;
        }

        var result = results
            .OrderBy(kvp => kvp.Key)
            .FirstOrDefault();

        //Console.WriteLine($"FreeSpace Result: {result.Key} {result.Value}");

        return (result.Key, result.Value);
    }

    public void MoveFileToFreeSpace(int filePointer, int freeSpacePointer)
    {
      //  FileListToString();
        var targetFile = fileSpace[filePointer];
        var openFreeSpace = freeSpace[freeSpacePointer];

        for (int i = 0; i < targetFile.length; i++)
        {
            fileList[freeSpacePointer + i] = targetFile.id;
        }
        fileSpace.Remove(filePointer);
        fileSpace.Add(freeSpacePointer, (targetFile.id, targetFile.length));
        freeSpace.Remove(freeSpacePointer);
        if (openFreeSpace - targetFile.length > 0)
        {
            freeSpace.Add(freeSpacePointer + targetFile.length, openFreeSpace - targetFile.length);
        }
        for (int i = 0; i < targetFile.length; i++)
        {
            fileList[filePointer + i] = null;
        }
        for (int i = 0; i < targetFile.length; i++)
        {
            fileList[freeSpacePointer + i] = targetFile.id;
        }
       // FileListToString();
    }

    public void FileListToString()
    {
        var sb = new StringBuilder();
        foreach (var block in fileList)
        {
            if (block != null)
            {
                sb.Append(block);
            }
            else
            {
                sb.Append('.');
            }
        }
        Console.WriteLine(sb.ToString());
    }

    public override ValueTask<string> Solve_2()
    {
        InitFileList();
        var startBiggestLength = fileSpace.Values.Max(value => value.length);
        var searchFilePointer = fileLength;

        var shouldContinue = true;

        while (shouldContinue)
        {
            var startTargetFileNextFromEnd = FirstFileFromTheEndOfFileStreamBeforeOffset(searchFilePointer, startBiggestLength);
            var startTargetFreeSpace2 = FirstFreeSpaceFromTheEndOfFileStreamThatCanFitSize(startTargetFileNextFromEnd!.Value.length, startTargetFileNextFromEnd!.Value.pointer);
            if (startTargetFreeSpace2 == null)
            {
                startBiggestLength--;
                if (startBiggestLength == 0)
                {
                    shouldContinue = false;
                }
            }
            else
            {
                MoveFileToFreeSpace(startTargetFileNextFromEnd!.Value.pointer, startTargetFreeSpace2!.Value.pointer);
            }

        }

        long checksum = 0;
        for (int i = 0; i < fileList.Count; i++)
        {
            if (fileList[i] != null)
            {
                checksum += i * fileList[i]!.Value;
            }
        }

        return new(checksum.ToString());
    }
}
