// using System.IO;

// ﻿namespace AdventOfCode2024;

// public class Day_02 : BaseDay
// {

//     private ParsedFile? _file;

//     private Dictionary<String, int> RPSScores;
//     private Dictionary<String, int> RPSChoiceValues;
//     private Dictionary<String, String> RPSWinLoseMatrix;

//     public Day_02()
//     {
//         RPSChoiceValues = new() {
//           { "X", 1 }, {"Y",2 }, {"Z",3 } };
       
//         RPSScores = new() { 
//           { "A X", 3 }, { "A Y", 6 }, {"A Z", 0 }, {"B X", 0 },
//           {"B Y", 3 }, {"B Z", 6 }, {"C X", 6 }, {"C Y", 0 },
//           {"C Z", 3 }
//         };

//         RPSWinLoseMatrix = new() {
//           {"A X", "Z" }, {"A Y", "X" }, {"A Z", "Y" }, {"B X", "X" },
//           {"B Y", "Y" }, {"B Z", "Z" }, {"C X", "Y" }, {"C Y", "Z" },
//           {"C Z", "X" }
//         };
// }

//     int scoreMatch(String matchString)
//     {
//         var matchScore = RPSScores[matchString];
//         var choiceScore = RPSChoiceValues[matchString.Split(' ')[1]];
//         return matchScore + choiceScore;
//     }

//     int winLoseMatch(String matchString)
//     {
//         var parts = matchString.Split(' ');
//         var outMatchString = $"{parts[0]} {RPSWinLoseMatrix[matchString]}";
//         return scoreMatch(outMatchString);
//     }


//     public override ValueTask<string> Solve_1()
//     {

//         var p1 = new Dictionary<string, int>
//         {
//             {"A X", 1 + 3}, {"A Y", 2 + 6}, {"A Z", 3 + 0},
//             {"B X", 1 + 0}, {"B Y", 2 + 3}, {"B Z", 3 + 6},
//             {"C X", 1 + 6}, {"C Y", 2 + 0}, {"C Z", 3 + 3},
//         };

//         var matchScore = File.ReadAllText(InputFilePath)
//            .Split("\n")
//            .Aggregate(0, (score, match) => score + scoreMatch(match));


//         var matchScoreCheat = File.ReadAllText(InputFilePath)
//            .Split("\n")
//            .Aggregate(0, (score, match) => score + p1[match]);

//         return new($"score {matchScore} - {matchScoreCheat}");
//     }

//     public override ValueTask<string> Solve_2()
//     {

//         var p2 = new Dictionary<string, int>
//         {
//             {"A X", 3 + 0}, {"A Y", 1 + 3}, {"A Z", 2 + 6},
//             {"B X", 1 + 0}, {"B Y", 2 + 3}, {"B Z", 3 + 6},
//             {"C X", 2 + 0}, {"C Y", 3 + 3}, {"C Z", 1 + 6},
//         };

//         var matchScore = File.ReadAllText(InputFilePath)
//            .Split("\n")
//            .Aggregate(0, (score, match) => score + winLoseMatch(match));

//         var matchScoreCheat = File.ReadAllText(InputFilePath)
//            .Split("\n")
//            .Aggregate(0, (score, match) => score + p2[match]);

//         return new($"score {matchScore} - {matchScoreCheat}");

//     }
// ﻿
  
// }