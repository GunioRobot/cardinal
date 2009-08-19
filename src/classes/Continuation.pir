# Copyright (C) 2001-2008, Parrot Foundation.
# $Id$

=head1 TITLE

Continuation - Cardinal Continuation class

=head1 DESCRIPTION

=head2 Functions

=over

=item onload()

Perform initializations and create the Continuation class

=cut

.namespace ['CardinalContinuation']

.sub 'onload' :anon :init :load
    .local pmc contproto, objproto, pcontproto
    contproto = newclass 'CardinalContinuation'

    objproto = get_class 'CardinalObject'
    addparent contproto, objproto

    $P0 = get_root_namespace ['parrot';'Continuation']
    pcontproto = get_class $P0
    addparent contproto, pcontproto
.end

.sub 'get_string' :vtable
   $S0 = 'Continuation'
   .return ($S0)
.end

.sub 'call' :method
    #.param pmc args :optional
    #.local pmc cont
    #getattribute cont, self, '!block'
    #$P0 = block(args :flat)
    self()
    #.return ($P0)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
