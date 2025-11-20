package hashing;
use strict;
use warnings;
use Digest::MD5 qw(md5_hex);
use MIME::Base64;

sub analyze {
    my ($hash) = @_;
    # very naive detection
    if ($hash =~ /^[a-fA-F0-9]{32}$/) {
        return "[HASH] Type: MD5 (32 hex)\n[HASH] Lookup: no API key configured (placeholder)\n";
    } elsif ($hash =~ /^[a-fA-F0-9]{40}$/) {
        return "[HASH] Type: SHA1 (40 hex)\n[HASH] Lookup: no API key configured (placeholder)\n";
    } elsif ($hash =~ /^[a-fA-F0-9]{64}$/) {
        return "[HASH] Type: SHA256 (64 hex)\n[HASH] Lookup: no API key configured (placeholder)\n";
    } else {
        return "[HASH] Unknown format\n";
    }
}

1;
