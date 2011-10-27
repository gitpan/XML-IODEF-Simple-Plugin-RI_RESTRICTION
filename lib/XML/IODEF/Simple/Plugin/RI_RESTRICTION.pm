package XML::IODEF::Simple::Plugin::RI_RESTRICTION;

use 5.008008;
use strict;
use warnings;

our $VERSION = '0.00_01';
$VERSION = eval $VERSION;  # see L<perlmodstyle>

# Preloaded methods go here.

my $map = {
    limited => 'need-to-know',
    restricted  => 'private',
    privileged  => 'need-to-know',
    default => 'private',
};

sub prepare {
    my $class   = shift;
    my $info    = shift;
    return unless($info->{'restriction'});
    return unless(exists($map->{lc($info->{'restriction'})}));
    return(1);
}

sub convert {
    my $class = shift;
    my $info = shift;
    my $iodef = shift;
    my $r = lc($info->{'restriction'});
    $info->{'restriction'} = $map->{$r};

    return($iodef);
}

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

XML::IODEF::Simple::Plugin::RI_RESTRICTION - Perl extension for blah blah blah

=head1 SYNOPSIS

  use XML::IODEF::Simple::Plugin::RI_RESTRICTION;
  blah blah blah

=head1 DESCRIPTION

Stub documentation for XML::IODEF::Simple::Plugin::RI_RESTRICTION, created by h2xs. It looks like the
author of the extension was negligent enough to leave the stub
unedited.

Blah blah blah.

=head2 EXPORT

None by default.



=head1 SEE ALSO

Mention other useful documentation such as the documentation of
related modules or operating system documentation (such as man pages
in UNIX), or any relevant external documentation such as RFCs or
standards.

If you have a mailing list set up for your module, mention it here.

If you have a web site set up for your module, mention it here.

=head1 AUTHOR

Wes Young, E<lt>wes@E<gt>

=head1 COPYRIGHT AND LICENSE

  Copyright 2011 The Trustees of Indiana University, indiana.edu
  Copyright 2011 REN-ISAC, ren-isac.net
  Copyright 2011 Wes Young, claimid.com/wesyoung

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.10.1 or,
at your option, any later version of Perl 5 you may have available.


=cut
