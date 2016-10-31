# SORT OF WORKS!!!

* open cygwin terminal
* `XWin :0 -listen tcp -multiwindow`
* in powershell
     * `docker run --rm --net=host -e DISPLAY=192.168.1.173:0 jess/atom`

# ALSO SORT OF WORKS, MAYBE EVEN FASTER!!!

* in cygwin terminal
* `XWin :0 -listen tcp -multiwindow -wgl -ac`
