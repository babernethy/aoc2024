
namespace AdventOfCode2024;

public class Day_11 : BaseDay
{
    string file;
    List<long> items = new();
    public Day_11()
    {
        // file = File.ReadAllText(InputFilePath);
        // file = "0 1 10 99 999";
        // file = "125 17";
        file = "965842 9159 3372473 311 0 6 86213 48";

        var lines = file.Split(" ");
        foreach (var line in lines)
        {
            if (!string.IsNullOrEmpty(line) && long.TryParse(line, out var lineValue))
            {
                items.Add(lineValue);
            }
        }
    }

    public override ValueTask<string> Solve_1()
    {

    List<long> items = new();

      file = "965842 9159 3372473 311 0 6 86213 48";

        var lines = file.Split(" ");
        foreach (var line in lines)
        {
            if (!string.IsNullOrEmpty(line) && long.TryParse(line, out var lineValue))
            {
                items.Add(lineValue);
            }
        }


        //do the following code 6 times
        var iterations = 25;

        for (int i = 0; i < iterations; i++)
        {
            List<long> changedItems = new();
            foreach (var item in items)
            {
                if (item == 0)
                {
                    changedItems.Add(1);
                    continue;
                }

                var lineString = item.ToString();
                if (lineString.Length % 2 == 0)
                {
                    var half = lineString.Length / 2;
                    var firstHalf = lineString.Substring(0, half);
                    var secondHalf = lineString.Substring(half);
                    changedItems.Add(int.Parse(firstHalf));
                    changedItems.Add(int.Parse(secondHalf));
                    continue;
                }

                changedItems.Add(item * 2024);
            }

            items = changedItems;
            // Console.WriteLine(string.Join(" ", items));
        }

        return new(items.Count.ToString());
    }

    public override ValueTask<string> Solve_2()
    {

        var startingList = new List<int> { 125, 17 };
        var iterations = 75;

        var processor = new ItemProcessor();
        long totalItems = processor.CalculateTotalItems(startingList, iterations);

        Console.WriteLine($"Total items after {iterations} iterations: {totalItems}");

        return new(totalItems.ToString());
    }
}

public class ItemProcessor
{
    private readonly Dictionary<(long, int), long> memo = new();

    public long CalculateTotalItems(List<int> items, int iterations)
    {
        long initialCount = items.Count;
        return CalculateTotalItems(initialCount, iterations);
    }

    private long CalculateTotalItems(long currentItemsCount, int iterations)
    {
        if (memo.TryGetValue((currentItemsCount, iterations), out var cachedResult))
            return cachedResult;

        if (iterations <= 0)
            return currentItemsCount;

        long newItemsCount = 0;

        for (int i = 0; i < currentItemsCount; i++)
        {
            if (i == 0)
            {
                newItemsCount += 1;
            }
            else
            {
                var lineString = i.ToString();
                if (lineString.Length % 2 == 0)
                {
                    newItemsCount += 2;
                }
                else
                {
                    newItemsCount += 1;
                }
            }
        }

        long result = CalculateTotalItems(newItemsCount, iterations - 1);
        memo[(currentItemsCount, iterations)] = result; // Store the result in the memoization cache

        return result;
    }
}
