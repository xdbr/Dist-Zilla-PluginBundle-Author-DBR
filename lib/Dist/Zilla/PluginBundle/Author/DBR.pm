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
                -remove => [qw/MakeMaker PkgVersion PodVersion Readme ExtraTests/],
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
            'Test::Portability',
            'Test::CheckDeps',
            'Test::Legal',
            'ReportPhase',
            'ReportVersions',
            'Test::Perl::Critic',
            'Test::MinimumVersion',
            'CheckPrereqsIndexed',
            'CheckVersionIncrement',
            'SpellingCommonMistakesTests',
            'Test::UseAllModules',
            'ChangeStats::Git',
            'MetaProvides::Class',
            'Test::CheckManifest',
            'SchwartzRatio',
            'MetaTests',
            [ 'InstallRelease' => {'install_command' => 'cpanm --verbose .'} ],
            # 'CheckChangeLog',
            # 'CheckChangesHasContent',
            # 'CheckExtraTests',
            # 'RunExtraTests',
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
    [Test::Legal]
    [ReportPhase]
    [ReportVersions]
    [Test::Perl::Critic]
    [ReadmeFromPod]
    [Test::MinimumVersion]
    [CheckPrereqsIndexed]
    [CheckVersionIncrement]
    [SpellingCommonMistakesTests]
    [MetaProvides::Class]
    [Test::CheckManifest]
    [SchwartzRatio]
    [Test::UseAllModules]
    [MetaTests]
    [InstallRelease]
    install_command = cpanm .


=cut
