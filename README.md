# NAME

String::Nudge - Indents all lines in a multi-line string

<div>
    <p>
    <img src="https://img.shields.io/badge/perl-5.10+-blue.svg" alt="Requires Perl 5.10+" />
    <img src="https://img.shields.io/badge/coverage-100.0%25-brightgreen.svg" alt="coverage 100.0%" />
    <a href="https://github.com/Csson/p5-String-Nudge/actions?query=workflow%3Amakefile-test"><img src="https://img.shields.io/github/workflow/status/Csson/p5-String-Nudge/makefile-test" alt="Build status at Github" /></a>
    </p>
</div>

# VERSION

Version 1.0002, released 2021-07-29.

# SYNOPSIS

    use String::Nudge;

    sub out {
        print nudge q{
            A long
            text.
        };
    }

    # is exactly the same as
    sub out {
        print q{
                A long
                text.
    };
    }

# DESCRIPTION

String::Nudge provides `nudge`, a simple function that indents all lines in a multi line string.

## METHODS

### nudge $string

    # '    hello'
    my $string = nudge 'hello';

### nudge $number\_of\_spaces, $string

    # '        hello'
    my $string = nudge 8, 'hello';

If `$number_of_spaces` is not given (or isn't an integer >= 0) its default value is `4`.

Every line in `$string` is indented by `$number_of_spaces`. Lines only consisting of white space is trimmed (but not removed).

## MORE EXAMPLES

### Usage with [qi](https://metacpan.org/pod/Syntax::Feature::Qi)

[Syntax::Feature::Qi](https://metacpan.org/pod/Syntax::Feature::Qi) adds `qi` and `qqi` that removes the same amount of leading whitespace as the first (significant) line has from all lines in a string:

    # these three packages are equivalent:
    package Example::Nudge {

        use String::Nudge;
        use syntax 'qi';

        sub out {
            print nudge qi{
                sub funcname {
                    print 'stuff';
                }
            };
        }
    }
    package Example::Q {

        sub out {
            print q{
        sub funcname {
            print 'stuff';
        }
    };
        }
    }
    package Example::HereDoc {

        sub out {

            (my $text = <<"        END") =~ s{^ {8}}{}gm;
                sub funcname {
                    print 'stuff';
                }
            END

            print $text;
        }
    }

### Usage with [qs](https://metacpan.org/pod/Syntax::Feature::Qs)

[Syntax::Feature::Qs](https://metacpan.org/pod/Syntax::Feature::Qs) adds `qs` and `qqs` that removes all leading whitespace from all lines in a string:

    # these three packages are equivalent:
    package Example::Nudge {

        use String::Nudge;
        use syntax 'qs';

        sub out {
            print nudge qs{
                This is
                a multi line

                string.
            };
        }
    }
    package Example::Q {

        sub out {
            print q{
        This is
        a multi line

        string.
    };
        }
    }
    package Example::HereDoc {

        sub out {

            (my $text = <<"        END") =~ s{^ {8}}{}gm;
                This is
                a multi line

                string.
            END

            print $text;
        }
    }

# SEE ALSO

- [Indent::String](https://metacpan.org/pod/Indent::String)
- [String::Indent](https://metacpan.org/pod/String::Indent)
- [qi](https://metacpan.org/pod/Syntax::Feature::Qi)
- [qs](https://metacpan.org/pod/Syntax::Feature::Qs)

# SOURCE

[https://github.com/Csson/p5-String-Nudge](https://github.com/Csson/p5-String-Nudge)

# HOMEPAGE

[https://metacpan.org/release/String-Nudge](https://metacpan.org/release/String-Nudge)

# AUTHOR

Erik Carlsson <info@code301.com>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2021 by Erik Carlsson.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
