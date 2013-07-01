import sys

def do_math(op, val1, val2):
    if op == '*':
        return val1 * val2
    if op == '/':
        return val1 / val2
    if op == '-':
        return val1 - val2
    if op == '+':
        return val1 + val2

test_cases = open(sys.argv[1], 'r')
for test in test_cases:
    if test != "":
        math_info = str.split(test)
        num_list = []
        op_list = []
        val = 0
        for m in math_info:
            if m != ' ':
                if int(m):
                    num_list.append(m)
                else:
                    op_list.append(m)
        if num_list.count > 3:
            val1 = 0
            val2 = 0
            work_nums = num_list
            for n in num_list:
                o = op_list.pop()
                if val1 == 0:
                    val1 = work_nums.pop()
                    val2 = work_nums.pop()
                    val = do_math(o, val1, val2)
                else:
                    val1 = work_nums.pop()
                    val = do_math(o, val, val1)
        print val


test_cases.close()
