--------------------------- MODULE async_message ---------------------------
EXTENDS Naturals
CONSTANT Data
VARIABLES chan

TypeInvariant == chan \in [val: Data, ack: {0,1}, ready:{0,1}]

Init == 
  /\ TypeInvariant
  /\ chan.ack = chan.ready

Send(d) == 
  /\ chan.ready = chan.ack
  /\ chan' = [chan EXCEPT !.val = d, !.ready = 1-chan.ready]

Receive == 
  /\ chan.ready /= chan.ack
  /\ chan' = [chan EXCEPT !.ack = 1-chan.ack]
  
Next == (\exists d \in Data : Send(d)) \/ Receive

Spec == Init /\ [][Next]_chan

-----------------------------------------------------------------------------
THEOREM Spec => []TypeInvariant

=============================================================================
\* Modification History
\* Last modified Sun Nov 17 16:23:30 PST 2019 by jeremy
\* Created Sat Nov 16 20:57:08 PST 2019 by jeremy
