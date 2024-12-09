
using System.Reflection.Metadata.Ecma335;
using System.Text;

namespace AdventOfCode2024;

public class Day_08 : BaseDay
{
    string file;
    Dictionary<char, List<(int x, int y)>> antennas = new();
    char[,] matrix;
    int numRows;
    int numCols;
    public Day_08()
    {

        file = @"............
........0...
.....0......
.......0....
....0.......
......A.....
............
............
........A...
.........A..
............
............";
        file = File.ReadAllText(InputFilePath);

        var rows = file.Split('\n');
        numRows = rows.Length;
        numCols = rows[0].Length;

        matrix = new char[numRows, numCols];

        for (int i = 0; i < numRows; i++)
        {
            for (int j = 0; j < numCols; j++)
            {
                matrix[i, j] = rows[i][j];
                if (matrix[i, j] != '.')
                {
                    if (!antennas.ContainsKey(matrix[i, j]))
                    {
                        antennas.Add(matrix[i, j], new());
                    }
                    antennas[matrix[i, j]].Add((i, j));
                }
            }
        }
    }

    public override ValueTask<string> Solve_1()
    {
        var countAntinodes = 0;
        Dictionary<(int x, int y), char> logAntinodes = new();
        foreach (var antenna in antennas)
        {
            var pairs = GenerateNodePairs(antenna.Value);
            foreach (var pair in pairs)
            {
                var antinodes = CalculateAntinodes(pair[0], pair[1]);
                foreach (var antinode in antinodes)
                {
                    if (antinode.Item1 >= 0 && antinode.Item1 < numRows && antinode.Item2 >= 0 && antinode.Item2 < numCols)
                    {
                        if (!logAntinodes.ContainsKey(antinode))
                        {
                            logAntinodes.Add(antinode, 'x');
                            countAntinodes++;
                        }
                        matrix[antinode.Item1, antinode.Item2] = '#';
                    }
                }
            }
        }
       // Console.WriteLine(MatrixToString());

        return new(countAntinodes.ToString());
    }

    public static List<List<(int x, int y)>> GenerateNodePairs(List<(int x, int y)> nodes)
    {
        var nodePairs = new List<List<(int x, int y)>>();

        for (int i = 0; i < nodes.Count; i++)
        {
            for (int j = i + 1; j < nodes.Count; j++)
            {
                nodePairs.Add(new List<(int x, int y)> { nodes[i], nodes[j] });
            }
        }

        return nodePairs;
    }

    public static List<(int, int)> CalculateAntinodes((int x, int y) node1, (int x, int y) node2)
    {
        double vectorX = node2.x - node1.x;
        double vectorY = node2.y - node1.y;

        int roundedAntinode1X = (int)Math.Round(node1.x - vectorX);
        int roundedAntinode1Y = (int)Math.Round(node1.y - vectorY);
        int roundedAntinode2X = (int)Math.Round(node2.x + vectorX);
        int roundedAntinode2Y = (int)Math.Round(node2.y + vectorY);

        return new List<(int, int)>
        {
            (roundedAntinode1X, roundedAntinode1Y),
            (roundedAntinode2X, roundedAntinode2Y)
        };
    }

    public static List<(int, int)> CalculateTAntinodes((int x, int y) node1, (int x, int y) node2, int numRows, int numCols)
    {
        double vectorX = node2.x - node1.x;
        double vectorY = node2.y - node1.y;

        List<(int, int)> antinodes = new();

        bool shouldContinue = true;
        var iteration = 1;

        while (shouldContinue)
        {
            var roundedAntinode1X = (int)Math.Round(node1.x - vectorX * iteration);
            var roundedAntinode1Y = (int)Math.Round(node1.y - vectorY * iteration);
            antinodes.Add((roundedAntinode1X, roundedAntinode1Y));
            shouldContinue = roundedAntinode1X >= 0 && roundedAntinode1Y >= 0 &&
            roundedAntinode1X < numRows && roundedAntinode1Y < numCols;
            iteration++;
        }

        shouldContinue = true;
        iteration = 1;

        while (shouldContinue)
        {
            int roundedAntinode1X = (int)Math.Round(node2.x + vectorX * iteration);
            int roundedAntinode1Y = (int)Math.Round(node2.y + vectorY * iteration);
            antinodes.Add((roundedAntinode1X, roundedAntinode1Y));
            shouldContinue = roundedAntinode1X >= 0 && roundedAntinode1Y >= 0 &&
            roundedAntinode1X < numRows && roundedAntinode1Y < numCols;
            iteration++;
        }

        return antinodes;
    }

    public string MatrixToString()
    {
        var sb = new StringBuilder();
        for (int i = 0; i < numRows; i++)
        {
            for (int j = 0; j < numCols; j++)
            {
                sb.Append(matrix[i, j]);
            }
            sb.AppendLine();
        }
        return sb.ToString();
    }

    public override ValueTask<string> Solve_2()
    {
        var countAntinodes = antennas.Count;
        Dictionary<(int x, int y), char> logAntinodes = new();
        foreach (var antenna in antennas)
        {
            var pairs = GenerateNodePairs(antenna.Value);
            foreach (var pair in pairs)
            {
                var antinodes = CalculateTAntinodes(pair[0], pair[1], numRows, numCols);
                foreach (var antinode in antinodes)
                {
                    if (antinode.Item1 >= 0 && antinode.Item1 < numRows && antinode.Item2 >= 0 && antinode.Item2 < numCols)
                    {
                        if (!logAntinodes.ContainsKey(antinode))
                        {
                            logAntinodes.Add(antinode, 'x');
                            countAntinodes++;
                        }
                        matrix[antinode.Item1, antinode.Item2] = '#';
                    }
                }
            }
        }
       // Console.WriteLine(MatrixToString());

        //count all char values in matrix that are not '.'
        var matrixCount = 0;
        for (int i = 0; i < numRows; i++)
        {
            for (int j = 0; j < numCols; j++)
            {
                if (matrix[i, j] != '.')
                {
                    matrixCount++;
                }
            }
        }

        //        return new(countAntinodes.ToString());
        return new(matrixCount.ToString());
    }
}
