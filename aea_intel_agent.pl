#!/usr/bin/perl
use strict;
use warnings;

# ===============================================================
#  AEA INTEL AGENT — Threat Intelligence CLI
#  Copyright © 2016
# ===============================================================

my $banner = <<'EOF';
┌───────────────────────────────────────────────────────────┐
│                       AEA INTEL AGENT                     │
│                     Threat Intelligence CLI               │
└───────────────────────────────────────────────────────────┘

               ,        ,
              /(        )`
              \ \___   / |
              /- _  `-/  '
             (/\/ \ \   /\
             / /   | `    \
             O O   ) /    |
             `-^--'`<     '
            (_.)  _  )   /
             `.___/`    /
               `-----' /
  <----.     __ / __   \
  <----|====O)))==) \) /====
  <----'    `--' `.__,' \
                 |        |
                  \       /
            ______( (_  / \______
          ,'  ,-----'   |        \
          `--{__________)        \/
EOF

print $banner;

print "\n[AEA INTEL AGENT] Starting lookup...\n";

my $target = $ARGV[0] or die "Usage: perl aea_intel_agent.pl <indicator>\n";

print "[LOOKUP] Target: $target\n";
print "[INFO]  This is a demo placeholder. Add module integration.\n";

exit 0;
