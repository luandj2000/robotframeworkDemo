# If we need to seperate a keyword from argument, or two arguments from one another,
# you need to put at least 2 spaces between them
# it can be more but no less

# if there's only a single space between two works, it's going to be seen as beloning to
# the same keyword or the same argument

# for example (using asteriks insteead of space for clarity):

    input*Text**Locator**Text*to*Type
    inpinput*Text*Locator**Text*to*Type --these will give an error if your keyword is input Text
    Input*Text**Locator*Text*to*Type --these will give an error if your keyword is input Text