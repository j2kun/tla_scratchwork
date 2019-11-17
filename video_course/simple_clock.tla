---------------------------- MODULE simple_clock ----------------------------
EXTENDS Naturals

VARIABLES hr

initial_hour == hr \in (1..12)
increment_hour == hr' = IF hr /= 12 THEN hr + 1 ELSE 1

hour_clock_spec == initial_hour /\ [][increment_hour]_hr
-----------------------------------------------------------------------------

THEOREM hour_clock_spec => []initial_hour

=============================================================================
\* Modification History
\* Last modified Sat Nov 16 20:27:42 PST 2019 by jeremy
\* Created Sat Nov 16 20:12:41 PST 2019 by jeremy
