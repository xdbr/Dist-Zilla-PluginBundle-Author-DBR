package Dist::Zilla::PluginBundle::DBR; # Make CPAN happy

# ABSTRACT: DBRs Dist::Zilla PluginBundle

use MooseX::Declare;

class Dist::Zilla::PluginBundle::DBR with Dist::Zilla::Role::PluginBundle::Easy {
    use Dist::Zilla::PluginBundle::Filter;

    sub configure {
        my $self = shift;

        $self->add_bundle(Filter => {
            -bundle => '@Classic',
            -remove => [qw/MakeMaker PkgVersion PodVersion Readme/],
        });

        $self->add_plugins(
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