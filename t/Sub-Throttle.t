use Test::More tests => 6;
use Time::HiRes qw(time);

BEGIN { use_ok('Sub::Throttle', 'throttle') };

is(Sub::Throttle::_sleep_secs(1, 1), 0);
is(Sub::Throttle::_sleep_secs(1, 2), 0);
is(Sub::Throttle::_sleep_secs(0.5, 1), 1);
is(Sub::Throttle::_sleep_secs(0.25, 1), 3);

my $start = time;
throttle(0.25, sub { sleep 1 });
my $elapsed = time - $start;
ok(3 < $elapsed && $elapsed < 5);
