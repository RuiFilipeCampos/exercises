class Solution:
    def fullJustify(self, words: List[str], maxWidth: int) -> List[str]:
        return full_justify(words, maxWidth)

T = TypeVar("T")

class Doc:
    """
    Playing around with https://peps.python.org/pep-0727/
    """

    def __init__(self, docstring: str) -> None:
        self.docstring = docstring

    def __matmul__(self, other: T) -> T:
        return Annotated[other, self]

    def __rmatmul__(self, other: T) -> T:
        return Annotated[other, self]


Word = str @ Doc("Character sequence consisting of non-space characters only. Lenght between 1 and 20.")
ListOfWords = List[Word] @ Doc("List of words with lenght between 1 and 300.")
MaxWidthInt = int @ Doc("Integer between 1 and 100.")
Sentence = str @ Doc("A string with max width of ´MaxWidthInt´")

class SentenceStack:
    total_number_chars: int @ Doc("Total lenght of the sentece when the words are joined.")
    words: List[Word]
    max_width: MaxWidthInt

    def __init__(self, max_width: int, word: Word) -> None:
        self.max_width = max_width
        self.total_number_chars = len(word)
        self.words = [word]

    def can_add(self, new_word: Word) -> bool:
        projected_number_of_chars = self.total_number_chars + len(new_word) + 1
        return projected_number_of_chars <= self.max_width

    def push(self, word: Word) -> None:
        """ Push to the top of the stack.""" 
        self.words.append(" " + word)
        self.total_number_chars += 1 + len(word)

    def justify(self) -> "SentenceStack":

        if len(self.words) == 1:
            n_chars_to_add = self.max_width - self.total_number_chars 
            self.words[0] = self.words[0] + n_chars_to_add*" "
            return self

        while not self.total_number_chars == self.max_width:
            for i in range(1, len(self.words)):
                self.words[i] = " " + self.words[i]
                self.total_number_chars += 1
                if self.total_number_chars == self.max_width:
                    return self
        return self

    def justify_left(self) -> "SentenceStack":
        number_of_chars = self.total_number_chars

        if number_of_chars == self.max_width:
            return self

        n_spaces_to_add = self.max_width - number_of_chars
        self.words[-1] = self.words[-1] + " " * n_spaces_to_add
        return self

    def join(self) -> Sentence:
        return "".join(self.words)


def full_justify(words: ListOfWords, max_width: MaxWidthInt) ->  List[Sentence]:

    def new_stack(word):
        return SentenceStack(max_width, word)
    
    stack = new_stack(words[0])
    stacks: List[SentenceStack] = [stack]
    
    for i in range(1, len(words)):
        word = words[i]
        if not stack.can_add(word):
            stack = new_stack(word)
            stacks.append(stack)
        else:
            stack.push(word)

    sentences = [stack.justify().join() for stack in stacks[:-1]]
    last_stack = stacks[-1]
    sentences.append(last_stack.justify_left().join())
    return sentences