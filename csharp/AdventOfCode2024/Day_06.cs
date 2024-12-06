
using System.ComponentModel;
using System.Net;
using System.Text;
using Microsoft.VisualBasic;

namespace AdventOfCode2024;

public class Day_06 : BaseDay
{
    string file;
    char[,] matrix;
    char[,] part1Matrix;
    List<(int x, int y)> multiDirectionNodes = new();
    int numRows;
    int numCols;
    (int x, int y) guardLocation = (0, 0);
    Dictionary<(int x, int y), List<(int x, int y)>> visited = new();
    List<(int xOffset, int yOffset)> directions = new List<(int, int)>
    {
      (-1, 0),  (0, 1), (1, 0),  (0, -1),   // Up, Right, Down, Left

    };
    (int xOffset, int yOffset) guardDirection = (-1, 0);
    int positions = 1;
    bool shouldContinue = true;
    public Day_06()
    {
        file = @"....#.....
.........#
..........
..#.......
.......#..
..........
.#..^.....
........#.
#.........
......#...";

        file = File.ReadAllText(InputFilePath);

        var rows = file.Split('\n');
        numRows = rows.Length;
        numCols = rows[0].Length;

        resetMatrix();

    }

    public void resetMatrix()
    {
        var rows = file.Split('\n');

        matrix = new char[numRows, numCols];

        for (int i = 0; i < numRows; i++)
        {
            for (int j = 0; j < numCols; j++)
            {
                if (rows[i][j] == '^')
                {
                    guardLocation = (i, j);
                    matrix[i, j] = '*';
                }
                else
                {
                    matrix[i, j] = rows[i][j];
                }
            }
        }
        guardDirection = (-1, 0);
        visited = new Dictionary<(int x, int y), List<(int x, int y)>>();
    }

    public override ValueTask<string> Solve_1()
    {
        shouldContinue = true;
        while (shouldContinue)
        {
            var nextLocation = (guardLocation.x + guardDirection.xOffset, guardLocation.y + guardDirection.yOffset);
            if (matrix[nextLocation.Item1, nextLocation.Item2] == '#')
            {
                var nextDirection = directions.IndexOf(guardDirection) + 1;
                if (nextDirection == directions.Count)
                {
                    nextDirection = 0;
                }
                guardDirection = directions[nextDirection];
                matrix[guardLocation.x, guardLocation.y] = '+';
            }
            else
            {
                if (matrix[nextLocation.Item1, nextLocation.Item2] == '.')
                {
                    positions++;
                }
                if (guardDirection.Item1 != 0)
                {
                    if (matrix[guardLocation.x, guardLocation.y] != '.')
                    {
                        matrix[guardLocation.x, guardLocation.y] = '+';
                    }
                    else
                    {
                        matrix[guardLocation.x, guardLocation.y] = '|';
                    }
                }
                else
                {
                    if (matrix[guardLocation.x, guardLocation.y] != '.')
                    {
                        matrix[guardLocation.x, guardLocation.y] = '+';
                    }
                    else
                    {
                        matrix[guardLocation.x, guardLocation.y] = '-';
                    }
                }
                // matrix[guardLocation.x, guardLocation.y] = 'X';
                guardLocation = nextLocation;
                //matrix[guardLocation.x, guardLocation.y] = '*';
                //Console.WriteLine(MatrixToString());
            }
            shouldContinue = guardLocation.x > 0 && guardLocation.x < numRows - 1 && guardLocation.y > 0 && guardLocation.y < numCols - 1;
        }
        return new(positions.ToString());
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

    public string PartOneMatrixToString()
    {
        var sb = new StringBuilder();
        for (int i = 0; i < numRows; i++)
        {
            for (int j = 0; j < numCols; j++)
            {
                sb.Append(part1Matrix[i, j]);
            }
            sb.AppendLine();
        }
        return sb.ToString();
    }

    public override ValueTask<string> Solve_2()
    {
        part1Matrix = matrix;

        //find all the '+' in the matrix
        // multiDirectionNodes = new();
        // for (int i = 0; i < numRows; i++)
        // {
        //     for (int j = 0; j < numCols; j++)
        //     {
        //         if (matrix[i, j] == '+')
        //         {
        //             if (!multiDirectionNodes.Contains((i, j)))
        //             {
        //                 multiDirectionNodes.Add((i, j));
        //             }
        //             if (!multiDirectionNodes.Contains((i - 1, j)))
        //             {
        //                 multiDirectionNodes.Add((i - 1, j));
        //             }
        //             if (!multiDirectionNodes.Contains((i + 1, j)))
        //             {
        //                 multiDirectionNodes.Add((i + 1, j));
        //             }
        //             if (!multiDirectionNodes.Contains((i, j - 1)))
        //             {
        //                 multiDirectionNodes.Add((i, j - 1));
        //             }
        //             if (!multiDirectionNodes.Contains((i, j + 1)))
        //             {
        //                 multiDirectionNodes.Add((i, j + 1));
        //             }

        //         }
        //     }
        // }

        multiDirectionNodes = new();
        //add nodes for complete matrix
        for (int i = 0; i < numRows; i++)
        {
            for (int j = 0; j < numCols; j++)
            {
                multiDirectionNodes.Add((i, j));
            }
        }



        var loopCount = 0;

        foreach (var node in multiDirectionNodes)
        {
            resetMatrix();
            //matrix[6, 3] = 'O';
            matrix[node.x, node.y] = 'O';
            //Console.WriteLine($"\n-----------\nStarting at {node.x} {node.y}");
            // Console.WriteLine(PartOneMatrixToString());
            // Console.WriteLine(MatrixToString());
            shouldContinue = true;
            while (shouldContinue)
            {
                //check if we have visited this location before
                if (visited.ContainsKey(guardLocation))
                {
                    if (visited[guardLocation].Contains(guardDirection))
                    {
                        Console.WriteLine($"\n-----------\nLoop detected with obstruction at {node.x} {node.y}");
                        Console.WriteLine(PartOneMatrixToString());
                        Console.WriteLine(MatrixToString());
                        shouldContinue = false; // we're looping
                        loopCount++;
                        break;
                    }
                    else
                    {
                        visited[guardLocation].Add(guardDirection);
                    }
                }
                else
                {
                    visited[guardLocation] = new List<(int x, int y)> { guardDirection };
                }

                var nextLocation = (guardLocation.x + guardDirection.xOffset, guardLocation.y + guardDirection.yOffset);
                if (matrix[nextLocation.Item1, nextLocation.Item2] == '#' || matrix[nextLocation.Item1, nextLocation.Item2] == 'O')
                {
                    var nextDirection = directions.IndexOf(guardDirection) + 1;
                    if (nextDirection == directions.Count)
                    {
                        nextDirection = 0;
                    }
                    guardDirection = directions[nextDirection];
                    matrix[guardLocation.x, guardLocation.y] = '+';
                }
                else
                {
                    if (matrix[nextLocation.Item1, nextLocation.Item2] == '.')
                    {
                        positions++;
                    }
                    if (guardDirection.Item1 != 0)
                    {
                        if (matrix[guardLocation.x, guardLocation.y] != '.')
                        {
                            matrix[guardLocation.x, guardLocation.y] = '+';
                        }
                        else
                        {
                            matrix[guardLocation.x, guardLocation.y] = '|';
                        }
                    }
                    else
                    {
                        if (matrix[guardLocation.x, guardLocation.y] != '.')
                        {
                            matrix[guardLocation.x, guardLocation.y] = '+';
                        }
                        else
                        {
                            matrix[guardLocation.x, guardLocation.y] = '-';
                        }
                    }
                    // matrix[guardLocation.x, guardLocation.y] = 'X';
                    guardLocation = nextLocation;
                    //matrix[guardLocation.x, guardLocation.y] = '*';
                    //Console.WriteLine(MatrixToString());
                }
                shouldContinue = guardLocation.x > 0 && guardLocation.x < numRows - 1 && guardLocation.y > 0 && guardLocation.y < numCols - 1;
            }
        }
        return new(multiDirectionNodes.ToString());
    }
}
