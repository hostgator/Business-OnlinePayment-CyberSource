
use strict;
use warnings;

use 5.006;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'CyberSource backend for Business::OnlinePayment',
  'AUTHOR' => 'Peter Bowen <peter@bowenfamily.org>, Caleb Cushing <xenoterracide@gmail.com>',
  'BUILD_REQUIRES' => {
    'English' => '0',
    'Env' => '0',
    'File::Find' => '0',
    'File::Temp' => '0',
    'Test::More' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.30'
  },
  'DISTNAME' => 'Business-OnlinePayment-CyberSource',
  'EXE_FILES' => [],
  'LICENSE' => 'artistic_2',
  'NAME' => 'Business::OnlinePayment::CyberSource',
  'PREREQ_PM' => {
    'AutoLoader' => '0',
    'Business::OnlinePayment' => '0',
    'Carp' => '0',
    'CyberSource::SOAPI' => '0',
    'Exporter' => '0',
    'parent' => '0'
  },
  'VERSION' => '2.02',
  'test' => {
    'TESTS' => 't/*.t'
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



