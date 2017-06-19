package RT::Transaction;

use strict;
use warnings;
no warnings qw(redefine);

=head2 QuoteHeader

Returns text prepended to content when transaction is quoted
(see C<Quote> argument in L</Content>). By default returns
localized "On <date> <user name> wrote:\n".

=cut

sub QuoteHeader {
    my $self = shift;
    # we need some logic to determine who should be quoted as sender
    # ->Name may contain the internal username like "blabla8"
    # which is unsuitable/dangerous to be communicated to the outside
    my $quotename = $self->CreatorObj->Name; # default
    $quotename = $self->CreatorObj->EmailAddress;
    return $self->loc("On [_1], [_2] wrote:", $self->CreatedAsString, $quotename);
}

1;
