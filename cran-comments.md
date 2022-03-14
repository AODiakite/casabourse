## R CMD check results

# Version 1.3.0
I received several messages indicating that the `daily.data()` function did not work on windows. Indeed it is due to the `RJSONIO` library that I used recently to stop the warning messages, now I use the `options(war=-1)` function to hide useless warnings. So I was forced to fix the problem as soon as possible with an update. I did the test on several windows (versions) computers before this new submission. 

0 errors | 0 warnings | 1 note

* This is a new release.
