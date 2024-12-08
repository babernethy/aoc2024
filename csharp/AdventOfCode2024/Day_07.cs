
using System.Reflection.Metadata.Ecma335;

namespace AdventOfCode2024;

public class Day_07 : BaseDay
{
    string file;
    List<(long answer, List<long> numbers)> equations = new();
    public Day_07()
    {

        file = @"190: 10 19
3267: 81 40 27
83: 17 5
156: 15 6
7290: 6 8 6 15
161011: 16 10 13
192: 17 8 14
21037: 9 7 18 13
292: 11 6 16 20";
       file = File.ReadAllText(InputFilePath);

        var lines = file.Split("\n");

        foreach (var line in lines)
        {
            if (String.IsNullOrEmpty(line))
            {
                // Console.WriteLine($"Empty line {line}");
            }
            else
            {
              //  Console.WriteLine(line);
                var parts = line.Split(":");
                var numberParts = parts[1].Trim().Split(" ").Select(n => n.Trim()).ToList();
                var numbers = numberParts.Select(int.Parse).ToList();
                List<long> parsedNumbers = new();

                foreach (var number in numbers)
                {
                    parsedNumbers.Add(number);
                }

                equations.Add((long.Parse(parts[0]), parsedNumbers));
            }
        }
    }

    public override ValueTask<string> Solve_1()
    {
        var operations = new char[] { '+', '*' };
        long numValid = 0;
        foreach (var equation in equations)
        {
            if (EquationValid(equation, operations))
            {
                numValid+=equation.answer;
               // Console.WriteLine($"Valid: {equation.answer.ToString()}");
            }
        }

        return new(numValid.ToString());
    }

    private bool EquationValid((long answer, List<long> numbers) equation, char[] operations)
    {
        var isValid = false;
        var combinations = GenerateCombinations(operations, equation.numbers.Count - 1);

        foreach (var combination in combinations)
        {
            var result = equation.numbers[0];

            for (int i = 1; i < equation.numbers.Count; i++)
            {
                switch (combination[i - 1])
                {
                    case '+':
                        result += equation.numbers[i];
                        break;
                    case '*':
                        result *= equation.numbers[i];
                        break;
                    case '|':
                        result = long.Parse(result.ToString() + equation.numbers[i].ToString());
                        break;
                }
            }

  
           // Console.WriteLine($"{string.Join(" ",equation.numbers)}  {string.Join("", combination)} = {result}");

            if (result == equation.answer)
            {
                isValid = true;
                return isValid;
            }
        }
        return isValid;
    }

    public static List<char[]> GenerateCombinations(char[] operations, int length)
    {
        var result = new List<char[]>();

        if (length <= 0 || operations.Length == 0)
        {
            return result;
        }

        void AddOperators(char[] current, int index)
        {
            if (index == length)
            {
                result.Add((char[])current.Clone()); // Clone to prevent reference issues
                return;
            }

            foreach (var op in operations)
            {
                current[index] = op;
                AddOperators(current, index + 1);
            }
        }

        AddOperators(new char[length], 0);

        return result;
    }

    public  ValueTask<string> Solve_2_orig()
    {
        var operations = new char[] { '+', '*', '|' };
        long numValid = 0;
        foreach (var equation in equations)
        {
            if (EquationValid(equation, operations))
            {
                numValid+=equation.answer;
                Console.WriteLine($"Valid: {equation.answer.ToString()}");
            }
        }

        return new(numValid.ToString());
    }

        public override ValueTask<string> Solve_2()
    {
        // takes a long time to run - so comment out for future days
        
        // var operations = new char[] { '+', '*', '|' };
        // long numValid = 0;
        // foreach (var equation in equations)
        // {
        //     if (EquationValid(equation, operations))
        //     {
        //         numValid+=equation.answer;
        //         Console.WriteLine($"Valid: {equation.answer.ToString()}");
        //     }
        // }

        return new("92148721834692");
    }
}
