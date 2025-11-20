package rep_checker;
use strict;
use warnings;
use JSON;
use LWP::UserAgent;

sub check {
    my ($indicator) = @_;
    # Placeholder reputation check
    # If ABUSEIPDB_API_KEY env var set, we could call AbuseIPDB.
    my $key = $ENV{'ABUSEIPDB_KEY'} || '';
    if ($key) {
        my $ua = LWP::UserAgent->new(timeout => 10);
        my $url = "https://api.abuseipdb.com/api/v2/check?ipAddress=$indicator&maxAgeInDays=90";
        my $req = HTTP::Request->new(GET => $url);
        $req->header('Key' => $key);
        my $res = $ua->request($req);
        if ($res->is_success) {
            return "[REPUTATION] " . substr($res->decoded_content,0,800) . "\n";
        } else {
            return "[REPUTATION] API error: " . $res->status_line . "\n";
        }
    } else {
        # fallback sample output
        return "[REPUTATION] Sample: clean (no API key configured)\n";
    }
}

1;
