
namespace AdventOfCode2024;

public class Day_01 : BaseDay
{
    string file;
    List<int> col1 = new();
    List<int> col2 = new();
    public Day_01()
    {
        // var file = new ParsedFile(InputFilePath);
        file = File.ReadAllText(InputFilePath);
//         file = @"3   4
// 4   3
// 2   5
// 1   3
// 3   9
// 3   3";

        int col1Value = 0;
        int col2Value = 0;
        var lines = file.Split("\n");

        foreach (var line in lines)
        {
            if (String.IsNullOrEmpty(line))
            {
                Console.WriteLine($"Empty line {line}");
            }
            else
            {
                Console.WriteLine(line);
                var parts = line.Split("   ");
                if (int.TryParse(parts[0].Trim(), out col1Value))
                {
                    col1.Add(col1Value);
                }
                if (int.TryParse(parts[1].Trim(), out col2Value))
                {
                    col2.Add(col2Value);
                }
            }
        }
        col1.Sort();
        col2.Sort();
    }

    public override ValueTask<string> Solve_1()
    {
        int totalDistance = 0;
        for (int i = 0; i < col1.Count; i++)
        {
            Console.WriteLine($"{col1[i]} {col2[i]}");
            totalDistance += Math.Abs(col1[i] - col2[i]);
        }
        return new(totalDistance.ToString());
    }





    public override ValueTask<string> Solve_2()
    {
        int simscore = 0;
        for (int i = 0; i < col1.Count; i++)
        {
            var count = CountOccurences(col2, col1[i]);
            Console.WriteLine($"{col1[i]} {count}");
            simscore += col1[i] * count;
        }
        return new(simscore.ToString());
    }


        //function returns an integer for the number of times an integer is found in a list
    public int CountOccurences(List<int> list, int value)
    {
        int count = 0;
        foreach (var item in list)
        {
            if (item == value)
            {
                count++;
            }
        }
        return count;
    }
}
