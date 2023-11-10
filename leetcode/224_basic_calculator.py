from dataclasses import dataclass

class Solution:
    def calculate(self, s: str) -> int:
        tokens = tokenize(s)
        return calculate(tokens)


Int32 = int
UInt32 = int
UInt64 = int

ValidExpression = str
Token = Literal["+(", "-(", ")"] | Int32

INTEGER_SYMBOLS = { str(i) for i in range(10) }
SIGN_SYMBOLS = {"+", "-"}

def tokenize(expression: ValidExpression) -> List[Token]:
    expression = expression.replace(' ', '')

    tokens = []

    def collect_integer(index: UInt64) -> UInt64:
        while index < len(expression) and expression[index] in INTEGER_SYMBOLS:
            index += 1
        return index

    while expression != "":
        if expression[0:2] == "-(":
            tokens.append("-(")
            size = 2
        elif expression[0:2] == "+(":
            tokens.append("+(")
            size = 2
        elif expression[0] == "(":
            tokens.append("+(")
            size = 1
        elif expression[0] == ")":
            tokens.append(")")
            size = 1
        elif expression[0] in SIGN_SYMBOLS or expression[0] in INTEGER_SYMBOLS:
            start_index = int(expression[0] in SIGN_SYMBOLS)
            size = collect_integer(start_index)
            token = int(expression[:size])
            tokens.append(token)
        else:
            raise RuntimeError(f"{expression=} {(expression[0] in INTEGER_SYMBOLS)=}")

        expression = expression[size:]

    return tokens


@dataclass
class StackFrame:
    sign: Literal[+1, -1] = +1
    value: UInt32 = 0

def calculate(tokens: List[Token]) -> Int32:

    stack: List[StackFrame] = [StackFrame()]

    for token in tokens:
        if token == "+(":
            stack.append(StackFrame())
        elif token == "-(":
            stack.append(StackFrame(sign=-1))
        elif token == ")":
            stack_frame = stack.pop()
            stack[-1].value += stack_frame.sign * stack_frame.value
        else:
            stack[-1].value += token

    return stack[-1].value
            

