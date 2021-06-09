#!/bin/bash

# https://linuxcommand.org -> writing shell scripts -> variables

# note: while the file extension and shebang indicate this is a shell script
#       and can be run as one, this is meant only for information purposes;
#       there should be no attempt to run this file as a script. 


    #!/bin/bash
    # sysinfo-script.sh - a script to produce an html file

    cat <<- _EOF_
      <html>
      <head>
          <title>
          my system information
          </title>
      </head>

      <body>
      <h1>my system information</h1>
      </body>
      </html>
    _EOF_

# prevent redundancy in typing the same thing again and again by assigning the
# common/redundant phrase to a variable then expanding the variable where the 
# text is needed; the application to the script is shown below.

    #!/bin/bash
    # sysinfo-script.sh - a script to produce an html file

    title="my system information"

    cat <<- _EOF_
        <html>
        <head>
            <title>
            $title
            </title>
        </head>
        
        <body>
        <h1>$title</h1>
        </body>
        </html>
    _EOF_

# the variable '$title' tells the shell to perform parameter expansion,
# replacing the name of the variable with the variable contents; in general,
# each time the shell sees a word that begins with '$', then the shell will 
# attempt to find out what was assigned to the variable to substitute it in.

# note that the equal sign ('=') after the variable must come immediately
# without any whitespace in between, in order to properly assign some contents to
# the variable.

# rules for choosing variable names:
#   1 - must start with a letter.
#   2 - must not contain embedded spaces, although underscores, '_', are 
#       allowed so many users use the underscore in place of whitespace.
#   3 - punctuation marks are not allowed.

# using the '$title' variable reduced the amount of typing required, but more
# importantly it made the script easier to maintain; we know most scripts (and
# also many programs, especially within the open-source framework) are never 
# actually finished forever, but instead continue to evolve as the script is 
# modified not just by the original creator but also other programmers that are
# allowed to access it; this is why there is such an emphasis on
# maintainability; for example, in the previous script, if we wanted/needed to
# change the phrase "my system information" to "linuxbox system information",
# then originally we would have had to change both instances of the text;
# however, after assigning the text string to a variable, we would only need to
# alter the variable one time in order to make both changes; obviously, it
# becomes much easier to see the importance of this as scripts become larger
# and more complex.

# environment variables are special instances of variables that are typically
# set by startup files or configuration files; in order to view all variables
# within a particular environment, use the 'printenv' command; the script below
# has been edited to include the environment variable that holds the name of the
# host on the system.

    #!/bin/bash
    # sysinfo-script.sh - a script to produce an html file

    title="system information for"

    cat <<- _EOF_
        <html>
        <head>
            <title>
            $title $HOSTNAME
            </title>
        </head>

        <body>
        <h1>$title $HOSTNAME</h1>
        </body>
        </html>
    _EOF_

# including this environment variable ensures the script will always reference
# the name of the machine on which the script is run; also note that, by 
# convention, all environment variable names are uppercase.
