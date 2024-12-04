
using System.Drawing.Drawing2D;

namespace AdventOfCode2024;

public class Day_02 : BaseDay
{
    string file;
    List<List<int>> reports = new();
    string[] lines;
    public Day_02()
    {
        // var file = new ParsedFile(InputFilePath);
        file = @"7 6 4 2 1
1 2 7 8 9
9 7 6 2 1
1 3 2 4 5
8 6 4 4 1
1 3 6 7 9";
        file = File.ReadAllText(InputFilePath);

        lines = file.Split("\n");

        foreach (var line in lines)
        {
            if (String.IsNullOrEmpty(line))
            {
                Console.WriteLine($"Empty line {line}");
            }
            else
            {
                // Console.WriteLine(line);
                var parts = line.Split(" ");
                var report = new List<int>();
                foreach (var part in parts)
                {
                    if (int.TryParse(part.Trim(), out var value))
                    {
                        report.Add(value);
                    }
                }
                // report.Reverse();
                reports.Add(report);
            }
        }
    }

    public override ValueTask<string> Solve_1()
    {
        int safeReports = 0;
        for (int j = 0; j < reports.Count; j++)
        {
            var r = reports[j];
            if (CheckIsSafe(j, r, 1))
            {
                safeReports++;
            }
        }

        return new(safeReports.ToString());

    }


    bool CheckIsSafe(int j, List<int> r, int iteration)
    {
        if (iteration > 1)
        {
            Console.WriteLine($"[{iteration}] Iteration Unsafe");
            return false;
        }
        var lastDiff = r[0] - r[1];
        if (Math.Abs(lastDiff) == 0 || Math.Abs(lastDiff) > 3)
        {
            if (iteration == 0)
            {
                // var newList = new List<int>(r);
                // newList.RemoveAt(0);
                // Console.WriteLine($"[{iteration}] Not safe (1) {r[0]} {r[1]}  {lastDiff} - {string.Join(" ", r)} - try one removed");
                var newList = new List<int>(r);
                newList.RemoveAt(0);

                var iNewResult = CheckIsSafe(j, newList, iteration + 1);

                bool iPlusNewResult = false;
                var newList2 = new List<int>();

                newList2 = new List<int>(r);
                newList2.RemoveAt(1);

                iPlusNewResult = CheckIsSafe(j, newList2, iteration + 1);

                if (!iNewResult && !iPlusNewResult)
                {
                    Console.WriteLine($"[{iteration}] Really Not safe - {string.Join(" ", newList)} - {string.Join(" ", newList2)} - {lines[j]}\n-----------------");
                    return false;
                }

                Console.WriteLine($"!!! Safe with one removed - {iNewResult} {string.Join(" ", newList)} - {iPlusNewResult} {string.Join(" ", newList2)}");
                return true;

                // return CheckIsSafe(j, newList, iteration + 1);

            }
            else
            {
                return false;
            }

        }
        else
        {
            for (int i = 1; i < r.Count - 1; i++)
            {
                var currValue = r[i];
                var nextValue = r[i + 1];
                var diff = currValue - nextValue;
                if (Math.Abs(diff) == 0 || Math.Abs(diff) > 3 || !IsSameDirection(diff, lastDiff))
                {
                    Console.WriteLine($"[{iteration}] Not safe {currValue} {nextValue} - {diff} {lastDiff} - {string.Join(" ", r)} - {lines[j]}");

                    var newList = new List<int>(r);
                    newList.RemoveAt(i);

                    var iNewResult = CheckIsSafe(j, newList, iteration + 1);

                    bool iPlusNewResult = false;
                    var newList2 = new List<int>();
                    if (i + 1 <= r.Count)
                    {
                        newList2 = new List<int>(r);
                        newList2.RemoveAt(i + 1);

                        iPlusNewResult = CheckIsSafe(j, newList2, iteration + 1);
                    }

                    if (!iNewResult && !iPlusNewResult)
                    {
                        Console.WriteLine($"[{iteration}] Really Not safe - {string.Join(" ", newList)} - {string.Join(" ", newList2)} - {lines[j]}\n-----------------");
                        return false;
                    }

                    Console.WriteLine($"!!! Safe with one removed - {iNewResult} {string.Join(" ", newList)} - {iPlusNewResult} {string.Join(" ", newList2)}");
                    return true;

                    // return iNewResult || iPlusNewResult;
                }
                // lastValue = currValue;
            }
        }
        Console.WriteLine("!!! Safe report");
        return true;
    }


    public override ValueTask<string> Solve_2()
    {
        Console.WriteLine("\n\nSolve 2 ----------------------------");
        int safeReports = 0;
        for (int j = 0; j < reports.Count; j++)
        {
            var r = reports[j];
            // Console.WriteLine($"{safeReports} +=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=\nreport: {string.Join(" ", r)}");
            // if (CheckIsSafe(j, r, 0))
            // {
            //     safeReports++;
            // }
            if (IsSafeWithTolerance(r))
            {
                safeReports++;
            }
        }

        return new(safeReports.ToString());

    }

    //function returns true if the input of two integers are either both positive or both negative
    public bool IsSameDirection(int a, int b)
    {
        return (a > 0 && b > 0) || (a < 0 && b < 0);
    }

    private static bool IsSafe(List<int> levels)
    {
        for (var i = 1; i < levels.Count; i++)
        {
            if (IsOutOfRange(levels, i)) return false;
        }

        return IsOrdered(levels);
    }

    private static bool IsSafeWithTolerance(List<int> levels)
    {
        return levels
            .Where((_, i) => IsSafe(SkipIndex(levels, i).ToList()))
            .Any();
    }

    private static IEnumerable<int> SkipIndex(List<int> levels, int i) => levels.Where((_, j) => j != i);
    private static bool IsOutOfRange(List<int> levels, int i) => Math.Abs(levels[i - 1] - levels[i]) is < 1 or > 3;
    private static bool IsOrdered(List<int> levels) => levels.SequenceEqual(levels.OrderBy(x => x)) || levels.SequenceEqual(levels.OrderByDescending(x => x));


    //function returns an integer for the number of times an integer is found in a lis
}
