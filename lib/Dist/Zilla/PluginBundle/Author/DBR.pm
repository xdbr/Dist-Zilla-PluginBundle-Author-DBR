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
                -remove => [qw/PodVersion ExtraTests/],
                # -remove => [qw/MakeMaker PkgVersion PodVersion Readme ExtraTests/],
            },
            # 'Apocalyptic',
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
            'Test::CheckDeps',
            'ReportPhase',
            'ReportVersions',
            'Test::MinimumVersion',
            'CheckPrereqsIndexed',
            'CheckVersionIncrement',
            'SpellingCommonMistakesTests',
            'Test::UseAllModules',
            'MetaProvides::Class',
            'SchwartzRatio',
            'MetaTests',
            'CheckExtraTests',
            'RunExtraTests',
            'InstallGuide',
            'PodWeaver',
            'InstallRelease',
            [ 'PruneCruft'        => { 'except'           => '\.gitignore'        } ],
            [ 'ExecDir'           => { 'dir'              => 'bin'                } ],

            # 'Test::Legal',
            # 'ExtraTests',
            # 'Test::Perl::Critic',
            # 'CheckChangeLog',
            # 'CheckChangesHasContent',
            # 'ChangeStats::Git',
            # 'Test::CheckManifest',
            # [ 'Test::Portability' => { 'test_vms_length'  => 0,
            #                            'test_ansi_chars'  => 0,
            #                            'test_one_dot'     => 0                    } ],
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

    [PruneCruft]
      except = '.gitignore'

    [ExecDir]
      dir= bin

=cut
