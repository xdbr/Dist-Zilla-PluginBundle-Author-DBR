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
                AutoMetaResources
                AutoPrereqs
                CheckChangesHasContent
                CheckExtraTests
                CheckPrereqsIndexed
                CheckVersionIncrement
                ConfirmRelease
                EOLTests
                HasVersionTests
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
                Test::CPAN::Changes
                TestRelease

            ],
            'Authority' => {
                authority => 'cpan:DBR'
            },
            # 'AutoMetaResources' => {
            #     'bugtracker.github' => 1,
            #     'repository.github' => [{ user => 'xdbr' }],
            #     'homepage' => 'https://metacpan.org/module/%{dist}',
            # },
            'GithubMeta' => {
                issues => 1,
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
        );
    }
}

__END__

=pod

=head1 SYNOPSIS

This PluginBundle is roughly equivalent to the following C<dist.ini>:

    # dist.ini
    [@Filter]
    -bundle          = @Classic
    -remove          = ExtraTests
    -remove          = PodVersion

    [Authority]
    authority        = cpan:DBR

    [AutoMetaResources]
    homepage            = https://metacpan.org/module/%{dist}
    repository.type     = git
    repository.url      = git://github.com/xdbr/%{dist}.git
    repository.web      = http://github.com/xdbr/%{dist}
    bugtracker.web      = http://github.com/xdbr/%{dist}/issues

    GithubMeta

    [@Git]
    changelog        = Changes             ; this is the default
    allow_dirty      = dist.ini            ; see Git::Check...
    allow_dirty      = Changes             ; ... and Git::Commit
    commit_msg       = v%v%n%n%c           ; see Git::Commit
    tag_format       = %v                  ; see Git::Tag
    tag_message      = %v                  ; see Git::Tag
    push_to          = origin              ; see Git::Push

    [Test::Portability]
    test_vms_length  = 0
    test_ansi_chars  = 0
    test_one_dot     = 0

    [PruneCruft]
    except           = '.gitignore'

    [ExecDir]
    dir              = bin

    [InstallRelease]
    install_command  = cpanm .

    [AutoPrereqs]
    [CheckChangesHasContent]
    [CheckExtraTests]
    [CheckPrereqsIndexed]
    [CheckVersionIncrement]
    [ConfirmRelease]
    [EOLTests]
    [HasVersionTests]
    [InstallGuide]
    [MetaJSON]
    [MetaProvides::Class]
    [MetaTests]
    [ModuleBuild]
    [NextRelease]
    [NoTabsTests]
    [PodWeaver]
    [ReadmeFromPod]
    [ReportVersions]
    [RunExtraTests]
    [SchwartzRatio]
    [ShareDir::Tarball]
    [SpellingCommonMistakesTests]
    [Test::ChangesHasContent]
    [Test::CheckDeps]
    [Test::CheckManifest]
    [Test::MinimumVersion]
    [Test::ReportPrereqs]
    [Test::UseAllModules]
    [TestRelease]


    [Prereqs]
    Dist::Zilla                                       = 0
    Dist::Zilla::Plugin::Authority                    = 0
    Dist::Zilla::Plugin::AutoMetaResources            = 0
    Dist::Zilla::Plugin::AutoPrereqs                  = 0
    Dist::Zilla::Plugin::CheckChangeLog               = 0
    Dist::Zilla::Plugin::CheckChangesHasContent       = 0
    Dist::Zilla::Plugin::CheckExtraTests              = 0
    Dist::Zilla::Plugin::CheckPrereqsIndexed          = 0
    Dist::Zilla::Plugin::CheckVersionIncrement        = 0
    Dist::Zilla::Plugin::ConfirmRelease               = 0
    Dist::Zilla::Plugin::EOLTests                     = 0
    Dist::Zilla::Plugin::HasVersionTests              = 0
    Dist::Zilla::Plugin::InstallGuide                 = 0
    Dist::Zilla::Plugin::InstallRelease               = 0
    Dist::Zilla::Plugin::MetaJSON                     = 0
    Dist::Zilla::Plugin::MetaProvides::Class          = 0
    Dist::Zilla::Plugin::MetaProvides::Package        = 0
    Dist::Zilla::Plugin::MetaTests                    = 0
    Dist::Zilla::Plugin::MinimumPerl                  = 0
    Dist::Zilla::Plugin::ModuleBuild                  = 0
    Dist::Zilla::Plugin::NextRelease                  = 0
    Dist::Zilla::Plugin::NoTabsTests                  = 0
    Dist::Zilla::Plugin::PkgVersion                   = 0
    Dist::Zilla::Plugin::PodCoverageTests             = 0
    Dist::Zilla::Plugin::PodSyntaxTests               = 0
    Dist::Zilla::Plugin::PodWeaver                    = 0
    Dist::Zilla::Plugin::ReadmeFromPod                = 0
    Dist::Zilla::Plugin::ReportPhase                  = 0
    Dist::Zilla::Plugin::ReportVersions               = 0
    Dist::Zilla::Plugin::Run::Release                 = 0
    Dist::Zilla::Plugin::RunExtraTests                = 0
    Dist::Zilla::Plugin::SchwartzRatio                = 0
    Dist::Zilla::Plugin::ShareDir::Tarball            = 0
    Dist::Zilla::Plugin::SpellingCommonMistakesTests  = 0
    Dist::Zilla::Plugin::TaskWeaver                   = 0
    Dist::Zilla::Plugin::Test::ChangesHasContent      = 0
    Dist::Zilla::Plugin::Test::CheckDeps              = 0
    Dist::Zilla::Plugin::Test::CheckManifest          = 0
    Dist::Zilla::Plugin::Test::Compile                = 0
    Dist::Zilla::Plugin::Test::Legal                  = 0
    Dist::Zilla::Plugin::Test::MinimumVersion         = 0
    Dist::Zilla::Plugin::Test::Perl::Critic           = 0
    Dist::Zilla::Plugin::Test::Portability            = 0
    Dist::Zilla::Plugin::Test::ReportPrereqs          = 0
    Dist::Zilla::Plugin::Test::UseAllModules          = 0
    Dist::Zilla::Plugin::TestRelease                  = 0
    Dist::Zilla::PluginBundle::Git                    = 0
    Dist::Zilla::Role::PluginBundle::Merged           = 0
    Pod::Weaver::Plugin::WikiDoc                      = 0
    Test::CPAN::Meta                                  = 0
    Test::UseAllModules                               = 0


=cut
