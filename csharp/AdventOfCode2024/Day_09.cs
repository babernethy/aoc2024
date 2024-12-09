
using System.ComponentModel.DataAnnotations;
using System.Reflection.Metadata.Ecma335;
using System.Text;

namespace AdventOfCode2024;

public class Day_09 : BaseDay
{
    string file;

    List<int?> fileList = new();

    public Day_09()
    {
        file = "12345";
        // file = "2333133121414131402";
        // file = File.ReadAllText(InputFilePath);

        //replace the filename at the end of InputFilePath with a new filename

        string outputFilePath = Path.Combine(Path.GetDirectoryName(InputFilePath), "09_file.txt");

        File.Delete(outputFilePath);

        using (StreamReader reader = new StreamReader(InputFilePath))
        using (StreamWriter writer = new StreamWriter(outputFilePath))
        {
            int character;
            var isFile = false;
            var fileId = 0;
            var sb = new StringBuilder();
            fileList = new();
            while ((character = reader.Read()) != -1)
            {
                // int result = int.Parse(character.ToString());
                int result = character - '0';
                for (int i = 0; i < result; i++)
                {
                    if (!isFile)
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
                }
                //  Console.WriteLine(sb.ToString());
                if (!isFile)
                {
                    fileId++;

                }
                isFile = !isFile;
            }
        }
    }

    public override ValueTask<string> Solve_1()
    {
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



    public override ValueTask<string> Solve_2()
    {


        return new("not implemented");
    }
}
