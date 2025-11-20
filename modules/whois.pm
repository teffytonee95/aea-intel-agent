package whois;
use strict;
use warnings;

sub lookup {
    my ($query) = @_;
    # prefer system whois if available
    my $whois = `which whois 2>/dev/null`;
    chomp $whois;
    if ($whois) {
        my $out = `whois $query 2>/dev/null`;
        $out = "[WHOIS] No result" unless $out;
        # Truncate long output for CLI readability
        $out = substr($out, 0, 1000) . "\n...[truncated]\n" if length($out) > 1000;
        return $out;
    } else {
        return "[WHOIS] whois command not available on this system\n";
    }
}

1;
