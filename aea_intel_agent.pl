#!/usr/bin/env perl
use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/modules";
use Getopt::Long;
use JSON;
use LWP::UserAgent;
use File::Spec;
use File::HomeDir;

# AEA INTEL AGENT - main
my $BANNER = <<'EOF';
┌───────────────────────────────────────────────────────────┐
│                       AEA INTEL AGENT                     │
│                     Threat Intelligence CLI               │
└───────────────────────────────────────────────────────────┘
EOF

print $BANNER, "\n";

my ($ip, $domain, $hash, $update, $help);
GetOptions(
    'ip=s' => \$ip,
    'domain=s' => \$domain,
    'hash=s' => \$hash,
    'update' => \$update,
    'help' => \$help
) or usage();

usage() if $help;
usage() unless $ip || $domain || $hash || $update;

# load modules
require "whois.pm";
require "rep_checker.pm";
require "domain_tools.pm";
require "hashing.pm";

if ($update) {
    print "[+] Updating feeds...\n";
    update_feeds();
    exit 0;
}

if ($ip) {
    print "[+] Query: IP -> $ip\n";
    my $w = whois::lookup($ip);
    print $w, "\n" if $w;
    my $r = rep_checker::check($ip);
    print $r, "\n" if $r;
    exit 0;
}

if ($domain) {
    print "[+] Query: Domain -> $domain\n";
    my $m = domain_tools::metadata($domain);
    print $m, "\n" if $m;
    my $w = whois::lookup($domain);
    print $w, "\n" if $w;
    exit 0;
}

if ($hash) {
    print "[+] Query: Hash -> $hash\n";
    my $h = hashing::analyze($hash);
    print $h, "\n" if $h;
    exit 0;
}

sub usage {
    print "Usage:\n";
    print "  $0 --ip 1.2.3.4\n";
    print "  $0 --domain example.com\n";
    print "  $0 --hash deadbeef...\n";
    print "  $0 --update\n";
    exit 1;
}

sub update_feeds {
    my $feeds_file = File::Spec->catfile($FindBin::Bin, 'feeds', 'feeds.json');
    if (-e $feeds_file) {
        print "Feeds file found: $feeds_file\n";
        open my $fh, '<', $feeds_file or do { print "Cannot open feeds.json\n"; return; };
        local $/;
        my $content = <$fh>;
        close $fh;
        eval {
            my $data = decode_json($content);
            print "Configured feeds:\n";
            foreach my $k (keys %$data) {
                print " - $k => $data->{$k}\n";
            }
        };
        print "Done.\n";
    } else {
        print "No feeds.json found.\n";
    }
}
