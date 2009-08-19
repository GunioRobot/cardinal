# Copyright (C) 2001-2008, Parrot Foundation.
# $Id$

=head1 TITLE

Queue - Cardinal Queue class

=head1 DESCRIPTION

=head2 Functions

=over

=item onload()

Perform initializations and create the Queue class

=cut

.namespace ['Queue']

.sub 'onload' :anon :init :load
    .local pmc qproto
    qproto = newclass 'Queue'

    $P0 = get_class 'CardinalObject'
    addparent qproto, $P0

    $P0 = get_root_namespace ['parrot';'TQueue']
    $P0 = get_class $P0
    addparent qproto, $P0
.end

.sub 'get_bool' :vtable
    .return (1)
.end

.sub 'get_string' :vtable
   $S0 = 'Queue'
   .return ($S0)
.end

.sub 'length' :method
        $I0 = self
        .return ($I0)
.end

.sub 'size' :method
        $I0 = self
        .return ($I0)
.end

.sub 'empty?' :method
       $I0 = self.'size'()
       if $I0 == 0 goto yes
       goto no
       yes:
           $P0 = get_hll_global 'true'
           .return ($P0)
       no:
           $P0 = get_hll_global 'false'
           .return ($P0)
.end

.sub 'push' :method
        .param pmc obj
        push self, obj
.end

.sub 'infix:<<' :method
        .param pmc obj
        self.'push'(obj)
.end

.sub 'enq' :method
        self.'push'(obj)
.end

.sub 'shift' :method
        .param pmc blockt       :optional
        .param int has_blockt   :opt_flag
        .local pmc obj
        if has_blockt goto shiftem
        blockt = get_hll_global 'false'
        shiftem:
            shift obj, self
            .return (obj)
.end

.sub 'deq' :method
        .param pmc blockt
        $P0 = self.'shift'(blockt)
        .return ($P0)
.end

.sub 'pop' :method
        .param pmc blockt
        $P0 = self.'shift'(blockt)
        .return ($P0)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
