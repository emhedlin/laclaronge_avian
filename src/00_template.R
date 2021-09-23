

# This script is to outline some opinionated ways I like to set up the source code section of a project.
# You'll notice that the name of the script starts with '00'. Instead of building ALL the code necessary
# to run an analysis in one behemoth file, I like to section the code out for specific tasks. For example, 
# in a given project, we may have the following enumerated scripts:
#   00_functions.R
#   01_load_clean_data.R
#   02_model.R
#   03_visualize.R

# Similar to the above, each individual script often follows a predictable structure. 
#   1. load libraries
#   2. load data
#   3. clean data
#   4. visualize
#      etc.

# We can actually section our scripts with a special kind of commenting.



# Section 1 ---------------------------------------------------------------


# you can see that there is a small arrow next to the above comment. This is because the entire section is now collapsible.
# furthermore, in the top right corner of this panel, you'll see a button labeled 'Source'. To the right of that button, you'll
# see another button with what looks like horizontal lines. If you click that, a navigation pane showing you all the sections in the script
# will appear, and you'll be able to easily navigate to a section of interest.


# Section 2 ---------------------------------------------------------------

# The hotkey for making a section is Shift+alt+r, but you can also manually create a section header. Any comment that starts with a # and
# ends with four dashes will automatically be treated as a section title. For example,


# This is a section ----


# but this is not ~~~~



