using System;
using System.Threading;
using System.Threading.Tasks;

namespace Utilities.Threading
{
    public static class RepeatingAction
    {
        public static Task Interval(TimeSpan interval, Action action, CancellationToken token)
        {
            return Task.Factory.StartNew(() => {
                for (;;)
                {
                    if (token.WaitHandle.WaitOne(interval))
                    {
                        break;
                    }

                    action();
                }
            }, token, TaskCreationOptions.LongRunning, TaskScheduler.Default);
        }
    }

    class Program
    {
        public static void Main(string[] args)
        {
            var cancellationTokenSource = new CancellationTokenSource();
            var task = RepeatingAction.Interval(
                           TimeSpan.FromSeconds(3),
                           () => Console.WriteLine("Hi! {0}", DateTime.Now), cancellationTokenSource.Token);

            while (true)
            {
            }
        }
    }
}
