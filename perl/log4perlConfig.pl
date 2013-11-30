
use File::Basename;
use Log::Log4perl;

sub getLogFilename
{
    return $ENV{'HOME'} . '/' . basename(__FILE__) . '.log';
}

my $logConfig = q(
    log4perl.rootLogger = INFO, Logfile, Screen

    log4perl.appender.Logfile          = Log::Log4perl::Appender::File
    log4perl.appender.Logfile.filename = sub { return getLogFilename(); }
    log4perl.appender.Logfile.layout   = Log::Log4perl::Layout::PatternLayout
    log4perl.appender.Logfile.layout.ConversionPattern = %d %-5p %C - %m%n

    log4perl.appender.Screen        = Log::Log4perl::Appender::Screen
    log4perl.appender.Screen.stderr = 0
    log4perl.appender.Screen.layout = Log::Log4perl::Layout::SimpleLayout
);


Log::Log4perl::init(\$logConfig);

my $log = Log::Log4perl::get_logger(__PACKAGE__);

$log->info('Hi!');