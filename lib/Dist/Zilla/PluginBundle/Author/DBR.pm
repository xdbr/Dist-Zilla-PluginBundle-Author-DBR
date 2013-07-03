package Dist::Zilla::PluginBundle::Author::DBR; # Make CPAN happy

#  PODNAME: Dist::Zilla::PluginBundle::Author::DBR
# ABSTRACT: DBRs Dist::Zilla PluginBundle

use true;
use MooseX::Declare;

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
                AutoPrereqs
                CheckChangesHasContent
                CheckExtraTests
                CheckPrereqsIndexed
                CheckVersionIncrement
                ConfirmRelease
                EOLTests
                InstallGuide
                MetaJSON
                MetaProvides::Class
                MetaTests
                ModuleBuild
                NextRelease
                NoTabsTests
                PodWeaver
                ReadmeFromPod
                ReportVersions
                RunExtraTests
                SchwartzRatio
                ShareDir::Tarball
                SpellingCommonMistakesTests
                Test::ChangesHasContent
                Test::CheckDeps
                Test::CheckManifest
                Test::MinimumVersion
                Test::ReportPrereqs
                Test::UseAllModules
                TestRelease
            ],
            'Authority' => {
                authority => 'cpan:DBR'
            },
            '@Git'      => {
                changelog        => 'Changes'      ,       # this is the default
                allow_dirty      => 'dist.ini'     ,       # see Git::Check...
                allow_dirty      => 'Changes'      ,       # ... and Git::Commit
                commit_msg       => 'v%v%n%n%c'    ,       # see Git::Commit
                tag_format       => '%v'           ,       # see Git::Tag
                tag_message      => '%v'           ,       # see Git::Tag
                push_to          => 'origin'       ,       # see Git::Push
            },
            'Test::Portability' => {
                test_vms_length  => '0',
                test_ansi_chars  => '0',
                test_one_dot     => '0',
            },
            'PruneCruft' => {
                except => '\.gitignore'
            },
            'ExecDir'    => {
                dir => 'bin'
            },
            'InstallRelease' => {
                install_command  => 'cpanm \.'
            }

            # '',
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
