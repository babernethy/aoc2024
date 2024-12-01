// using System.Text;

// namespace AdventOfCode2024;

// public class Day_03 : BaseDay
// {

//     private readonly string _input;

//     public Day_03()
//     {
//         _input = File.ReadAllText(InputFilePath);
//     }

//     int priority(char unit)
//     {
//         if (64 + 1 <= unit && unit <= 64 + 26)
//         {
//             return 26 + unit - 64;
//         }
//         else if (96 + 1 <= unit && unit <= 96 + 26)
//         {
//             return unit - 96;
//         }
//         else
//         {
//             return 0;
//         }
//     }


//     public override ValueTask<string> Solve_1()
//     {
//         var data = _input.Split('\n')
//             .Select(l =>
//             {
//                 return new List<byte[]> {
//                    Encoding.ASCII.GetBytes(l.Substring(0, (l.Length / 2))),
//                    Encoding.ASCII.GetBytes(l.Substring((l.Length / 2), (l.Length / 2)))
//             };
//             }).Select(s => s.Aggregate((a, b) => a.Intersect(b).ToArray())
//             .Select(a => Convert.ToChar(a))
//             .Select(v => priority(v))
            
//         ).Aggregate(0, (val, item) => val + item.ToList()[0]);

//         return new(data.ToString());
//     }

//     public override ValueTask<string> Solve_2()
//     {


//         var data = _input.Split('\n')
//             .SkipWhile(item => true)
//             .Take(3).Select(t => Encoding.ASCII.GetBytes(t))
//             .Skip(3);
// //    .Select(l =>
// //    {
// //        return new List<byte[]> {
// //                   Encoding.ASCII.GetBytes(l.Substring(0, (l.Length / 2))),
// //                   Encoding.ASCII.GetBytes(l.Substring((l.Length / 2), (l.Length / 2)))
// //    };
// //    }).Select(s => s.Aggregate((a, b) => a.Intersect(b).ToArray())
// //    .Select(a => Convert.ToChar(a))
// //    .Select(v => priority(v))

// //).Aggregate(0, (val, item) => val + item.ToList()[0]);

//         return new("not implemented");
//     }


// }