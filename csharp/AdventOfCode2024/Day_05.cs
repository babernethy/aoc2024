
namespace AdventOfCode2024;

public class Day_05 : BaseDay
{
    string file;
    List<(int, int)> rules = new();
    Dictionary<int, List<int>> pagesImBefore = new();
    List<List<int>> updates = new();
    public Day_05()
    {
        // var file = new ParsedFile(InputFilePath);
        file = File.ReadAllText(InputFilePath);
        file = @"47|53
97|13
97|61
97|47
75|29
61|13
75|53
29|13
97|29
53|29
61|53
97|53
61|29
47|13
75|47
97|75
47|61
75|61
47|29
75|13
53|13

75,47,61,53,29
97,61,53,29,13
75,29,13
75,97,47,61,53
61,13,29
97,13,75,29,47";

        var parts = file.Split("\n\n");
        var lines1 = parts[0].Split("\n");
        var lines2 = parts[1].Split("\n");

        foreach (var line in lines1)
        {
            var parts1 = line.Split("|");
            rules.Add((int.Parse(parts1[0]), int.Parse(parts1[1])));
        }

        foreach (var line in lines2)
        {
            var parts2 = line.Split(",");
            var list = new List<int>();
            foreach (var part in parts2)
            {
                list.Add(int.Parse(part));
            }
            updates.Add(list);
        }

        foreach (var rule in rules)
        {
            if (!pagesImBefore.ContainsKey(rule.Item2))
            {
                pagesImBefore[rule.Item2] = new List<int>();
            }
            pagesImBefore[rule.Item2].Add(rule.Item1);
        }

    }

    public List<int> GetPagesInUpdateIamBefore(int page, List<int> update)
    {
        var index = update.IndexOf(page);
        var pagesAfter = update.GetRange(index + 1, update.Count - index - 1);
        return pagesAfter;
    }

    public List<int> GetPagesInUpdateIamAfter(int page, List<int> update)
    {
        var index = update.IndexOf(page);
        var pagesBefore = update.GetRange(0, index);
        return pagesBefore;
    }

    public override ValueTask<string> Solve_1()
    {
        List<List<int>> correctUpdates = new();

        foreach (var update in updates)
        {
            bool correct = true;
            foreach (var page in update)
            {

                var pagesImAfter = GetPagesInUpdateIamAfter(page, update);
                foreach (var afterPage in pagesImAfter)
                {
                    if (pagesImBefore.ContainsKey(afterPage) && pagesImBefore[afterPage].Contains(page))
                    {
                        Console.WriteLine($"Page {afterPage} is after {page} in update {update}");
                        correct = false;
                        break;
                    }
                    //var pagesAfter = GetPagesInUpdateIamBefore(page, update);
                }
            }
            if (correct)
            {
                correctUpdates.Add(update);
            }
        }

        return new("not implemented");
    }



    public override ValueTask<string> Solve_2()
    {

        return new("not implemented");
    }





}
