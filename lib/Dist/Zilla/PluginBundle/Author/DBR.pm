package Dist::Zilla::PluginBundle::Author::DBR; # Make CPAN happy

#  PODNAME: Dist::Zilla::PluginBundle::Author::DBR
# ABSTRACT: DBRs Dist::Zilla PluginBundle

use MooseX::Declare;

class Dist::Zilla::PluginBundle::Author::DBR
 with Dist::Zilla::Role::PluginBundle::Easy
{

    use Dist::Zilla::PluginBundle::Filter;

    method configure {

        $self->add_bundle(
            Filter => {
                -bundle => '@Classic',
                -remove => [qw/MakeMaker PkgVersion PodVersion Readme/],
            }
        );

        $self->add_plugins(
            'ConfirmRelease',
            'EOLTests',
            'MetaJSON',
            'ModuleBuild',
            'NoTabsTests',
            'ReadmeFromPod',
            'TestRelease',
            'AutoPrereqs',
            'Test::ReportPrereqs',
            'Test::Portability',
            'Test::CheckDeps',
        );
    }
}

__END__

=pod

=head1 SYNOPSIS

This PluginBundle is roughly equivalent to the following C<dist.ini>:

  # dist.ini
  [@Classic]
  [Authority]
      authority = cpan:DBR

  [AutoPrereqs]
  [PkgVersion]
  [TestRelease]
  [ConfirmRelease]
  [PodWeaver]

  [Test::Compile]
  [Test::ReportPrereqs]
  [Test::Portability]
  [Test::Kwalitee]
  [Test::CheckDeps]
  [PodCoverageTests]
  [PodSyntaxTests]
  [NoTabsTests]
  [EOLTests]

=cut
