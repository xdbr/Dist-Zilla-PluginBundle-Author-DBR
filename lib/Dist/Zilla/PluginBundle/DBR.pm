package Dist::Zilla::PluginBundle::DBR; # Make CPAN happy

#  PODNAME: Dist::Zilla::PluginBundle::DBR
# ABSTRACT: DBRs Dist::Zilla PluginBundle

use MooseX::Declare;

class Dist::Zilla::PluginBundle::DBR with Dist::Zilla::Role::PluginBundle::Easy {
    use Dist::Zilla::PluginBundle::Filter;

    method configure {

        $self->add_bundle(
            Filter => {
                -bundle => '@Classic',
                -remove => [qw/MakeMaker PkgVersion PodVersion Readme/],
            }
        );

        $self->add_plugins(
            'AutoPrereqs',
            'CheckChangeLog',
            'MetaJSON',
            'ModuleBuild',
            'OurPkgVersion',
            'PodWeaver',
            'ReadmeFromPod',
            'Test::Compile',
        );
    }
}

__END__

=pod

=head1 SYNOPSIS

This PluginBundle is roughly equivalent to the following C<dist.ini>:

  # dist.ini
  [@Basic]
  [Authority]
      authority = cpan:DBR

  [AutoPrereqs]
  [PkgVersion]
  [PodCoverageTests]
  [PodSyntaxTests]
  [NoTabsTests]
  [EOLTests]
  [Test::Compile]
  [TestRelease]
  [ConfirmRelease]
  [PodWeaver]

=cut
