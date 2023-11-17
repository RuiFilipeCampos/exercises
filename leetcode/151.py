class Solution:
    def reverseWords(self, s: str) -> str:
        s = s.strip()
        list_of_words = s.split(" ")
        list_of_words = list_of_words[::-1]
        list_of_words = [word.replace(" ", "") for word in list_of_words]
        return " ".join(word for word in list_of_words if word)
        