
use strict;
use warnings;

use 5.010;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "CyberSource backend for Business::OnlinePayment",
  "AUTHOR" => "Jad Wauthier <Jadrien dot Wauthier at GMail dot com>, Caleb Cushing <xenoterracide\@gmail.com>, Peter Bowen <peter\@bowenfamily.org>",
  "BUILD_REQUIRES" => {
    "File::Find" => 0,
    "File::Temp" => 0,
    "Test::More" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Business-OnlinePayment-CyberSource",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Business::OnlinePayment::CyberSource",
  "PREREQ_PM" => {
    "Business::CyberSource" => "0.006000",
    "Business::CyberSource::Client" => 0,
    "Business::OnlinePayment" => 0,
    "Class::Load" => "0.20",
    "Data::Dump" => 0,
    "DateTime" => 0,
    "Exception::Base" => 0,
    "Moose" => 0,
    "Moose::Role" => 0,
    "MooseX::Aliases" => 0,
    "MooseX::NonMoose" => 0,
    "MooseX::StrictConstructor" => 0,
    "MooseX::Types::Common::String" => 0,
    "MooseX::Types::CyberSource" => 0,
    "MooseX::Types::Moose" => 0,
    "Try::Tiny" => 0,
    "namespace::autoclean" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "3.000006",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



