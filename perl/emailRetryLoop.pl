use English;
use MIME::Lite;

my $sendMailRetries = 0;
my $maxSendRetries = 10;

my $email = MIME::Lite->new(...);

warn('Warning: send mail failed! ' . $EVAL_ERROR . "\n")
    while (@(eval {$email->send('smtp', 'mailhost.example.com')}) and
           $maxSendRetries > $sendMailRetries++);