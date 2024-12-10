
using System.ComponentModel;
using System.Drawing.Drawing2D;

namespace AdventOfCode2024;

public class Day_10 : BaseDay
{
    string file;
    int[,] matrix;
    int numRows;
    int numCols;
    List<(int rowOffset, int colOffset)> directions = new List<(int rowOffset, int colOffset)> {
            (-1, 0), (1, 0),    // Up, Down
            (0, -1), (0, 1),    // Left, Right
        };

    public Day_10()
    {
        // var file = new ParsedFile(InputFilePath);
        //         file = @"89010123
        // 78121874
        // 87430965
        // 96549874
        // 45678903
        // 32019012
        // 01329801
        // 10456732";

        //         file = @"..90..9
        // ...1.98
        // ...2..7
        // 6543456
        // 765.987
        // 876....
        // 987....";

        file = @"10..9..
2...8..
3...7..
4567654
...8..3
...9..2
.....01";
        //  file = File.ReadAllText(InputFilePath);

        var rows = file.Split('\n');
        numRows = rows.Length;
        numCols = rows[0].Length;

        matrix = new int[numRows, numCols];

        for (int i = 0; i < numRows; i++)
        {
            for (int j = 0; j < numCols; j++)
            {
                var element = rows[i][j];
                if (element == '.')
                {
                    matrix[i, j] = -1;
                }
                else
                {
                    matrix[i, j] = int.Parse(element.ToString());
                }
            }
        }
    }

    public static List<(int x, int y)> FindAllTrailheads(int[,] matrix)
    {
        var zeroLocations = new List<(int x, int y)>();

        for (int i = 0; i < matrix.GetLength(0); i++) // Rows
        {
            for (int j = 0; j < matrix.GetLength(1); j++) // Columns
            {
                if (matrix[i, j] == 0)
                {
                    zeroLocations.Add((i, j));
                }
            }
        }

        return zeroLocations;
    }


    public int TrailScore((int x, int y) trailhead)
    {


        var score = 0;
        // var current = trailhead;

        // while (true) {
        //     var currentScore = matrix[current.x, current.y];
        //     score += currentScore;

        //     var next = directions.Select(direction => (current.x + direction.rowOffset, current.y + direction.colOffset))
        //         .Where(next => next.x >= 0 && next.x < numRows && next.y >= 0 && next.y < numCols)
        //         .Where(next => matrix[next.x, next.y] > 0)
        //         .FirstOrDefault();

        //     if (next == default) {
        //         break;
        //     }

        //     current = next;
        // }

        return score;
    }

    public List<(int x, int y)> FollowTrailAndCountEndpoints((int x, int y) currentLocation, int nextLevel,
        List<(int x, int y)> endpoints)
    {
        var current = currentLocation;



        if (nextLevel == 9)
        {
            if (endpoints.Contains(current))
            {
                return endpoints;
            }
            else
            {
                endpoints.Add(current);
                return endpoints;
            }
        }
        else
        {
            var nextNodes = directions.Select(direction => (current.x + direction.rowOffset, current.y + direction.colOffset))
                .Where(next => next.Item1 >= 0 && next.Item1 < numRows
                    && next.Item2 >= 0 && next.Item2 < numCols)
                .Where(next => matrix[next.Item1, next.Item2] == nextLevel)
                .ToList();
            if (nextNodes.Count >1)
            {
                Console.WriteLine($"Branch: {currentLocation.x}, {currentLocation.y} - First: {nextNodes[0].Item1}, {nextNodes[0].Item2} - Level: {nextLevel}");
                //return endpoints;
            }
            foreach (var next in nextNodes)
            {
                Console.WriteLine($"Current: {currentLocation.x}, {currentLocation.y} - Next: {next.Item1}, {next.Item2} - Level: {nextLevel}");
                var partialEndpoints = FollowTrailAndCountEndpoints(next, nextLevel + 1, endpoints);
            }
            return endpoints;
        }
    }


    public override ValueTask<string> Solve_1()
    {
        List<(int rowOffset, int colOffset)> directions = new List<(int, int)>
        {
            (-1, 0), (1, 0),    // Up, Down
            (0, -1), (0, 1),    // Left, Right
        };

        var totalScore = 0;

        var trailheads = FindAllTrailheads(matrix);

        foreach (var t in trailheads)
        {
            var endpoints = new List<(int x, int y)>();
            var uniqueEndpoints = FollowTrailAndCountEndpoints(trailheads[0], 1, endpoints);
            totalScore += uniqueEndpoints.Count;
        }

        return new(totalScore.ToString());
    }


    public override ValueTask<string> Solve_2()
    {
        return new("not implemented");
    }

}