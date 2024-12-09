
using System.Text.RegularExpressions;

namespace AdventOfCode2024;

public class Day_03 : BaseDay
{
    string file;
    List<string> mulMatches = new();
    List<string> mulMatches2 = new();
    public Day_03()
    {
        file = File.ReadAllText(InputFilePath);
        // file = "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))";

        string pattern = @"mul\((\d+),(\d+)\)";
        Regex regex = new Regex(pattern);
        var matches = regex.Matches(file);

       // Console.WriteLine("Found matches:");
        foreach (Match match in matches)
        {
        //    Console.WriteLine(match.Value);
            mulMatches.Add(getMulValues(match.Value));
        }

        string pattern2 = @"mul\((\d+),(\d+)\)|do\(\)|don't\(\)";
        Regex regex2 = new Regex(pattern2);
        var matches2 = regex2.Matches(file);

      //  Console.WriteLine("Found matches:");
        var doMatches = true;
        foreach (Match match in matches2)
        {
           // Console.WriteLine(match.Value);
            if (match.Value.Contains("do("))
            {
                doMatches = true;
            }
            else if (match.Value.Contains("don't("))
            {
                doMatches = false;
            }
        
            if (doMatches && match.Value.Contains("mul"))
            {
                mulMatches2.Add(getMulValues(match.Value));
            }
        }

    }

    public string getMulValues(string match)
    {
        return match[4..^1];
    }

    public override ValueTask<string> Solve_1()
    {
        int result = 0;
        foreach (var item in mulMatches)
        {
            var values = item.Split(',');
            result += int.Parse(values[0]) * int.Parse(values[1]);
        }
        return new(result.ToString());
    }

    public override ValueTask<string> Solve_2()
    {
        int result = 0;
        foreach (var item in mulMatches2)
        {
            var values = item.Split(',');
            result += int.Parse(values[0]) * int.Parse(values[1]);
        }
        return new(result.ToString());
    }
}
