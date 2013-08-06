import sys


def do_math(op, val1, val2):
    #print op
    #print val1
    #print val2
    if op == '*':
        return val1 * val2
    if op == '/':
        return val1 / val2
    if op == '-':
        return val1 - val2
    if op == '+':
        return val1 + val2


def ignore_exception(IgnoreException=Exception, DefaultVal=None):
    """ Decorator for ignoring exception from a function
    e.g.   @ignore_exception(DivideByZero)
    e.g.2. ignore_exception(DivideByZero)(Divide)(2/0)
    """
    def dec(function):
        def _dec(*args, **kwargs):
            try:
                return function(*args, **kwargs)
            except IgnoreException:
                return DefaultVal
        return _dec
    return dec

test_cases = open(sys.argv[1], 'r')
for test in test_cases:
    if test != "":
        math_info = str.split(test)
        num_list = []
        op_list = []
        val = 0
        sint = ignore_exception(IgnoreException=ValueError)(int)
        for m in math_info:
            if m != ' ':
                if sint(m):
                    num_list.append(int(m))
                else:
                    op_list.append(m)
        if num_list.count > 3:
            val1 = 0
            val2 = 0
            work_nums = num_list
            #print num_list
            #print op_list
            for n in range(0, len(work_nums)):
                if len(op_list) > 0:
                    o = op_list.pop()
                #print o
                if len(work_nums) > 0:
                    if val1 == 0:
                        val1 = work_nums.pop(0)
                        val2 = work_nums.pop(0)
                        #print val1, val2
                        val = do_math(o, val1, val2)
                    else:
                        val1 = work_nums.pop(0)
                        #print val1
                        val = do_math(o, val, val1)
            print val


test_cases.close()
