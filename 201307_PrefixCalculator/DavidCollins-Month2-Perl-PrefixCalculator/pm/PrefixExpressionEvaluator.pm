#!/usr/bin/env perl
package PrefixExpressionEvaluator;

use warnings;
use strict;

sub new {
    my ($class, $expression) = @_;

    return bless {}, $class;
}

sub evaluate {
    my ($self, $expression) = @_;
    my @expression = split('\s', $expression);

    my @stack = $self->evaluateHelper(\@expression);

    while (scalar(@stack) > 3) {
        @stack = $self->evaluateHelper(\@stack);
    }

    my $second = pop(@stack);
    my $first = pop(@stack);
    my $operator = pop(@stack);
    return $self->operatorAction($operator, $first, $second);
}

sub evaluateHelper {
    my ($self, $expression) = @_;
    my @expressionStack = ();
    my $operand_count = 0;
    foreach my $piece (@$expression) {
        if ($self->isValidOperator($piece)) {
            push(@expressionStack, $piece);
            $operand_count = 0;
            next;
        }

        if (++$operand_count == 2 && scalar(@expressionStack) > 2) {
            my $first = pop(@expressionStack);
            my $operator = pop(@expressionStack);
            my $result = $self->operatorAction($operator, $first, $piece);
            push(@expressionStack, $result);
            $operand_count = 0;
        } else {
            push(@expressionStack, $piece);
        }
    }

    # after looping through, all that should be left is the last expression to evaluate
    return @expressionStack;
}

sub isValidOperator {
    my ($self, $operator) = @_;
    return $operator =~ m/\+|\-|\*|\//g;
}

sub operatorAction {
    my ($self, $operator, $operandOne, $operandTwo) = @_;
 
    my %actions = (
        '+' => sub { return $_[0] + $_[1] },
        '-' => sub { return $_[0] - $_[1] },
        '*' => sub { return $_[0] * $_[1] },
        '/' => sub { return $_[0] / $_[1] },
    );

    return $actions{$operator}->($operandOne, $operandTwo);
}

1;

