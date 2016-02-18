use 5.10.0;
use strict;
use warnings;

package String::Nudge;

# ABSTRACT: Indents all lines in a multi-line string
# AUTHORITY
our $VERSION = '0.1002';

use Exporter 'import';
our @EXPORT = qw/nudge/;

sub nudge ($;$) {
    my $first = shift;
    my $second = shift;

    my $indent = 4;
    my $string;

    if(defined $second) {
        if(int $first eq $first && int $first >= 0) {
            $indent = int $first;
            $string = $second;
        }
        else {
            warnings::warn(numeric => q{first argument to nudge not an integer >= 0.});
            $string = $second;
        }
    }
    else {
        $string = $first;

    }
    my $nudgement = ' ' x $indent;

    $string =~ s{^(?=\V)}{$nudgement}gms;
    $string =~ s{^\h*$}{}gms;
    return $string;
}


1;

__END__

=encoding utf-8

=head1 SYNOPSIS

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


=head1 DESCRIPTION

String::Nudge provides C<nudge>, a simple function that indents all lines in a multi line string.

=head2 METHODS

=head3 nudge $string

    # '    hello'
    my $string = nudge 'hello';

=head3 nudge $number_of_spaces, $string

    # '        hello'
    my $string = nudge 8, 'hello';

If C<$number_of_spaces> is not given (or isn't an integer >= 0) its default value is C<4>.

Every line in C<$string> is indented by C<$number_of_spaces>. Lines only consisting of white space is trimmed (but not removed).

=head2 MORE EXAMPLES

=head3 Usage with L<qi|Syntax::Feature::Qi>

L<Syntax::Feature::Qi> adds C<qi> and C<qqi> that removes the same amount of leading whitespace as the first (significant) line has from all lines in a string:

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

=head3 Usage with L<qs|Syntax::Feature::Qs>

L<Syntax::Feature::Qs> adds C<qs> and C<qqs> that removes all leading whitespace from all lines in a string:

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

=head1 SEE ALSO

=for :list
* L<Indent::String>
* L<String::Indent>
* L<qi|Syntax::Feature::Qi>
* L<qs|Syntax::Feature::Qs>

=cut
