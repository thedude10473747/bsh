#!/bin/bash

# https://linuxcommand.org -> writing shell scripts -> here scripts

# note: while the file extension and shebang indicate this is a shell script
#       and can be run as one, this is meant only for information purposes;
#       there should be no attempt to run this file as a script. 


# a well formed html document includes the information shown below:
    
    <html>
    <head>
        <title>
        the title of the page
        </title>
    </head>

    <body>
        the content of the page
    </body>
    </html>

  # alternate indentation/spacing:
    
    <html>
      <head>
        <title>
          the title of the page
        </title>
      </head>

      <body>
        the content of the page
      </body>
    </html>


# with even just a very limited knowledge of shell scripting and html, we could
# write a script to generate the html info shown above (although this first
# example is quite inefficient)

    #!/bin/bash
    # sysinfo-page.sh - a script to produce an html file

    echo "<html>"
    echo "<head>"
    echo "  <title>"
    echo "    the title of the page"
    echo "  </title>"
    echo "</head>"
    echo ""
    echo "<body>"
    echo "  the body of the page"
    echo "</body>"
    echo "</html>"

  # alternate indentation/spacing:

    #!/bin/bash
    # sysinfo-page.sh - a script to produce an html file

    echo "<html>"
    echo "  <head>"
    echo "    <title>"
    echo "      the title of the page"
    echo "    </title>"
    echo "  </head>"
    echo ""
    echo "  <body>"
    echo "    the body of the page"
    echo "  </body>"
    echo "</html>"

# this particular script could be used in the terminal as follows:
        
        $ chmod +x sysinfo-page.sh
        $ ./sysinfo-page.sh > sysinfo-page.html

# the first improvement to the original script will be to change the use of
# 'echo' and the quotations so that both are only entered once, obviously a
# tremendous improvement in efficiency (of course, the quotations must be
# closed out, but we will use only one total set, open and close)

    #!/bin/bash
    # sysinfo-page.sh - a script to produce an html file

    echo "<html>
     <head>
       <title>
       the title of the page
       </title>
     </head>

     <body>
       the body of the page
     </body>
     </html>"

  # alternate indentation/spacing:

    #!/bin/bash
    # sysinfo-page.sh - a script to produce an html file

    echo "<html>
            <head>
              <title>
                the title of the page
              </title>
            </head>

            <body>
              the body of the page
            </body>
          </html>"

# the use of quotations allows for embedding carriage returns in the text 
# allowing the echo command's argument to span multiple lines; however, many
# types of markup used with html also include quotations, so in order to 
# use embedded quotations each one will need to be escaped with a backslash.

# in order to avoid the additional typing that would go along with escaping
# every quotation, the shell provides a better method called a 'here script',
# shown below:

    #!/bin/bash
    # sysinfo-page.sh - a script to produce an html file.

    cat << _EOF_
    <html>
    <head>
      <title>
      the title of the page
      </title>
    </head>

    <body>
      the contents of the page
    </body>
    </html>
    _EOF_

# the here script or here document uses io redirection to include content that
# will be given to the standard input of a command; in the case of the previous
# script, the standard input of the cat command is given a stream of text from
# the script

# the general syntax for constructing a here script is shown below

    command << token
    content to be used as command's standard input
    token

# token can be anything that does not conflict with a bash reserved word; the
# token that ends the script must also exactly match the token that starts it,
# or the remainder of the script will be interpreted as more standard input to
# the command.

# an additional trick that can be used with a here script is to change the '<<'
# to '<<-', as seen below. 

    #!/bin/bash
    # sysinfo-script.sh - a script to produce an html file.

    cat <<- _EOF_
        <html>
        <head>
            <title>
            the title of the page
            </title>
        </head>

        <body>
            the content of the page
        </body>
        </html>
    _EOF_

# this causes bash to ignore leading tabs but not spaces, thereby
# allowing us to improve the readability of the script by indenting the content
# portion; however, because many text editors can be and often are configured to
# use sequences of spaces instead of tab characters, problems can still arise.

# next we simply edit the script to include text that will explicitly state
# there will be system information produced once it is run.

    #!/bin/bash
    # sysinfo-script.sh - a script to produce an html file.

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

# the actual system information will be added in during the next section, which
# is contained in a different file among the bsh directory.
