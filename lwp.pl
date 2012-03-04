#!/usr/bin/perl
use v5.10;
use HTTP::Request;
use LWP::UserAgent;
use HTTP::Cookies;

my $user = $ARGV[0];
my $pass = $ARGV[1];
my $file = "$ENV{HOME}/Dropbox/Public/instapaper.epub";

my $ua = LWP::UserAgent->new(cookie_jar =>
    HTTP::Cookies->new(file => "/tmp/cookies.txt", autosave => 1));

my $req = HTTP::Request->new( POST => 'https://www.instapaper.com/user/login',
    [ 'Content-Type' => 'application/x-www-form-urlencoded' ],
    'username=' . $user . '&password=' . $pass);

# Log In
my $res = $ua->request($req);

$res->content =~ m/Logging in/g ?
    say 'Logged in' : ( say 'Couldn\'t Log In' and exit );

say 'Getting epub...';
my $epub = $ua->request(
    HTTP::Request->new(GET => 'https://www.instapaper.com/epub')
);

open my $fh, '>', $file;
print $fh $epub->content;

# Remove cookies
unlink('/tmp/cookies.txt');
