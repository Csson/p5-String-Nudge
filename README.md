# NAME

String::Nudge - Indents all lines in a multi-line string

<div>
    <p>
    <img src="https://img.shields.io/badge/perl-5.10+-blue.svg" alt="Requires Perl 5.10+" />
    <a href="https://travis-ci.org/Csson/p5-String-Nudge"><img src="https://api.travis-ci.org/Csson/p5-String-Nudge.svg?branch=master" alt="Travis status" /></a>
    <a href="http://cpants.cpanauthors.org/dist/String-Nudge-0.1002"><img src="https://badgedepot.code301.com/badge/kwalitee/String-Nudge/0.1002" alt="Distribution kwalitee" /></a>
    <a href="http://matrix.cpantesters.org/?dist=String-Nudge%200.1002"><img src="https://badgedepot.code301.com/badge/cpantesters/String-Nudge/0.1002" alt="CPAN Testers result" /></a>
    <img src="https://img.shields.io/badge/coverage-100.0%-brightgreen.svg" alt="coverage 100.0%" />
    </p>
</div>

# VERSION

Version 0.1002, released 2016-02-18.

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

This software is copyright (c) 2016 by Erik Carlsson.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
