package Dist::Zilla::PluginBundle::Author::DBR; # Make CPAN happy

#  PODNAME: Dist::Zilla::PluginBundle::Author::DBR
# ABSTRACT: DBRs Dist::Zilla PluginBundle

# package Dist::Zilla::PluginBundle::Foobar;
# Moose::with 'Dist::Zilla::Role::PluginBundle::Merged';
# sub configure { shift->add_merged( qw[ Plugin1 Plugin2 Plugin3 Plugin4 ] ); }


use MooseX::Declare;
use true;

class Dist::Zilla::PluginBundle::Author::DBR
 with Dist::Zilla::Role::PluginBundle::Merged
{

    method configure {
        $self->add_bundle(
            Filter => {
                -bundle => '@Classic',
                -remove => [qw/PodVersion ExtraTests/],
                # -remove => [qw/MakeMaker PkgVersion PodVersion Readme ExtraTests/],
            },
            # 'Apocalyptic',
        );
    
        $self->add_merged(
            qw[
                =Dist::Zilla::Plugin::ConfirmRelease
                =Dist::Zilla::Plugin::EOLTests
                =Dist::Zilla::Plugin::MetaJSON
                =Dist::Zilla::Plugin::ModuleBuild
                =Dist::Zilla::Plugin::NoTabsTests
                =Dist::Zilla::Plugin::ReadmeFromPod
                =Dist::Zilla::Plugin::TestRelease
                =Dist::Zilla::Plugin::AutoPrereqs
                =Dist::Zilla::Plugin::Test::ReportPrereqs
                =Dist::Zilla::Plugin::Test::CheckDeps
                =Dist::Zilla::Plugin::ReportPhase
                =Dist::Zilla::Plugin::ReportVersions
                =Dist::Zilla::Plugin::Test::MinimumVersion
                =Dist::Zilla::Plugin::CheckPrereqsIndexed
                =Dist::Zilla::Plugin::CheckVersionIncrement
                =Dist::Zilla::Plugin::SpellingCommonMistakesTests
                =Dist::Zilla::Plugin::Test::UseAllModules
                =Dist::Zilla::Plugin::MetaProvides::Class
                =Dist::Zilla::Plugin::SchwartzRatio
                =Dist::Zilla::Plugin::MetaTests
                =Dist::Zilla::Plugin::CheckExtraTests
                =Dist::Zilla::Plugin::RunExtraTests
                =Dist::Zilla::Plugin::InstallGuide
                =Dist::Zilla::Plugin::PodWeaver
                =Dist::Zilla::Plugin::MetaProvides::Package
            ],
            PruneCruft => { 'except'    => '\.gitignore'  },
            ExecDir    => { 'dir'       => 'bin'          },
            Authority  => { 'authority' => 'cpan:DBR'     }
            # 'Test::Legal',
            # 'ExtraTests',
            # 'Test::Perl::Critic',
            # 'CheckChangeLog',
            # 'CheckChangesHasContent',
            # 'ChangeStats::Git',
            # 'Test::CheckManifest',
            # 'Test::Portability' => {  'test_vms_length'  => 0,
            #                           'test_ansi_chars'  => 0,
            #                           'test_one_dot'     => 0                   },
            # 'InstallRelease'    => { 'install_command'  => 'cpanm'              },
        );
    }
}

__END__

=pod

=head1 SYNOPSIS

This PluginBundle is roughly equivalent to the following C<dist.ini>:

    # dist.ini
    [@Filter]
      -bundle = @Classic
      -remove = ExtraTests
      -remove = PodVersion

    [Authority]
        authority = cpan:DBR

    [ConfirmRelease]
    [EOLTests]
    [MetaJSON]
    [ModuleBuild]
    [NoTabsTests]
    [ReadmeFromPod]
    [TestRelease]
    [AutoPrereqs]
    [Test::ReportPrereqs]
    [Test::CheckDeps]
    [ReportPhase]
    [ReportVersions]
    [Test::MinimumVersion]
    [CheckPrereqsIndexed]
    [CheckVersionIncrement]
    [SpellingCommonMistakesTests]
    [Test::UseAllModules]
    [MetaProvides::Class]
    [SchwartzRatio]
    [MetaTests]
    [CheckExtraTests]
    [RunExtraTests]
    [InstallGuide]
    [PodWeaver]

    [InstallRelease]
      install_command  = cpanm

    [PruneCruft]
      except = '.gitignore'

    [ExecDir]
      dir= bin

=cut
