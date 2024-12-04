
using System.Drawing.Drawing2D;

namespace AdventOfCode2024;

public class Day_04 : BaseDay
{
    string file;
    char[,] matrix;
    int numRows;
    int numCols;
    public Day_04()
    {
        // var file = new ParsedFile(InputFilePath);
        file = @"MMMSXXMASM
MSAMXMSMSA
AMXSXMAAMM
MSAMASMSMX
XMASAMXAMM
XXAMMXXAMA
SMSMSASXSS
SAXAMASAAA
MAMMMXMMMM
MXMXAXMASX";
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
            }
        }
    }

    public override ValueTask<string> Solve_1()
    {
        string target = "XMAS";

        List<(int rowOffset, int colOffset)> directions = new List<(int, int)>
        {
            (-1, 0), (1, 0),    // Up, Down
            (0, -1), (0, 1),    // Left, Right
            (-1, -1), (-1, 1),  // Top-left, Top-right
            (1, -1), (1, 1)     // Bottom-left, Bottom-right
        };

        var numFound = 0;

        for (int i = 0; i < numRows; i++)
        {
            for (int j = 0; j < numCols; j++)
            {
                if (matrix[i, j] == 'X')
                {
                    int matches = FindWords(i, j, target, directions);
                    if (matches > 0)
                    {
                        Console.WriteLine($"Found {matches} matches for 'XMAS' starting at ({i}, {j})");
                        numFound += matches;
                    }
                }




            }
        }
        return new(numFound.ToString());
    }

    bool IsValid(int r, int c) => r >= 0 && r < numRows && c >= 0 && c < numCols;
    bool FindWord(int startRow, int startCol, string target, List<(int rowOffset, int colOffset)> directions)
    {
        foreach (var (rowOffset, colOffset) in directions)
        {
            int r = startRow, c = startCol;
            bool found = true;

            for (int k = 0; k < target.Length; k++)
            {
                if (!IsValid(r, c) || matrix[r, c] != target[k])
                {
                    found = false;
                    break;
                }
                r += rowOffset;
                c += colOffset;
            }

            if (found) return true;
        }
        return false;
    }

    int FindWords(int startRow, int startCol, string target, List<(int rowOffset, int colOffset)> directions)
    {
        int matches = 0;

        foreach (var (rowOffset, colOffset) in directions)
        {
            int r = startRow, c = startCol;
            bool found = true;

            for (int k = 0; k < target.Length; k++)
            {
                if (!IsValid(r, c) || matrix[r, c] != target[k])
                {
                    found = false;
                    break;
                }
                r += rowOffset;
                c += colOffset;
            }

            if (found) matches++;
        }

        return matches;
    }

    List<(int x, int y)> FindMAS(int startRow, int startCol, List<(int rowOffset, int colOffset)> directions)
    {
        string target = "MAS";
        List<(int x, int y)> foundPositions = new List<(int x, int y)>();

        foreach (var (rowOffset, colOffset) in directions)
        {
            int r = startRow, c = startCol;
            bool found = true;

            for (int k = 0; k < target.Length; k++)
            {
                if (!IsValid(r, c) || matrix[r, c] != target[k])
                {
                    found = false;
                    break;
                }
                if (k == 1)
                {
                    foundPositions.Add((r, c));
                }
                r += rowOffset;
                c += colOffset;
            }

            if (!found)
            {
                if (foundPositions.Count > 0 && foundPositions[^1] == (r - rowOffset, c - colOffset))
                {
                    foundPositions.RemoveAt(foundPositions.Count - 1);
                }
            }
        }

        return foundPositions;
    }

    public override ValueTask<string> Solve_2()
    {
        List<(int rowOffset, int colOffset)> directions = new List<(int, int)>
        {
            // (-1, 0), (1, 0),    // Up, Down
            // (0, -1), (0, 1),    // Left, Right
            (-1, -1), (-1, 1),  // Top-left, Top-right
            (1, -1), (1, 1)     // Bottom-left, Bottom-right
        };

        var foundAs = new List<(int x, int y)>();

        for (int i = 0; i < numRows; i++)
        {
            for (int j = 0; j < numCols; j++)
            {
                if (matrix[i, j] == 'M')
                {
                    var matches = FindMAS(i, j, directions);
                    if (matches.Count > 0)
                    {
                        Console.WriteLine($"Found {matches} matches for 'XMAS' starting at ({i}, {j})");
                        foundAs.AddRange(matches);
                    }
                }
            }
        }

        var locationCounts = new Dictionary<(int x, int y), int>();
        foreach (var location in foundAs)
        {
            if (locationCounts.ContainsKey(location))
            {
                locationCounts[location]++;
            }
            else

            {
                locationCounts[location] = 1;
            }
        }

        var numFound = locationCounts.Values.Count(v => v == 2);

        return new(numFound.ToString());
    }

}