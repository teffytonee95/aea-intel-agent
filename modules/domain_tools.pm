package domain_tools;
use strict;
use warnings;

sub metadata {
    my ($domain) = @_;
    # basic HTTP HEAD attempt to get server header (no external modules required)
    my $ua = eval { require LWP::UserAgent; LWP::UserAgent->new(timeout=>8) };
    if ($ua) {
        my $u = LWP::UserAgent->new(timeout => 8);
        eval {
            my $res = $u->head('http://' . $domain);
            if ($res->is_success) {
                my $server = $res->header('Server') || 'unknown';
                my $title = 'N/A';
                return "[DOMAIN] server=$server\n";
            } else {
                return "[DOMAIN] HTTP HEAD failed: " . $res->status_line . "\n";
            }
        } or return "[DOMAIN] HTTP check failed (exception)\n";
    } else {
        return "[DOMAIN] LWP::UserAgent not installed\n";
    }
}

1;
