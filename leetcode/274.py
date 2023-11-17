class Solution:
    def hIndex(self, citations: List[int]) -> int:
        citations.sort(reverse = True)

        h = 0
        for n_papers, n_citations in enumerate(citations):
            n_papers += 1

            if n_papers <= n_citations:
                if h < n_citations:
                    print(n_papers)
                    h = n_papers

        return h
        








        
        
