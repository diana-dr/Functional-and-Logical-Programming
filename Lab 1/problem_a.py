# 3. a. Check if a list is a set.
# b. Determine the number of distinct elements from a list

def noOfOccurrences(e, lst):
    # 										{ 0, lst = []
    # noOfOccurrences(e, l1, l2, ... ln) =  { 1 + noOfOccurrences(e, l2, ... ln), e = l1
    # 										{ noOfOccurrences(e, l2, ... ln), otherwise
    if not lst:
        return 0
    if lst[0] == e:
        return 1 + noOfOccurrences(e, lst[1:])
    else:
        return noOfOccurrences(e, lst[1:])

# a.
def checkIfSet(lst):
    # 								{ true, lst = []
    # checkIfSet(l1, l2, ... ln) =  { false, noOfOccurrences(l1, l1, ... ln) != 1
    # 								{ checkIfSet(l2, ... ln), otherwise
    if not lst:
        return True
    elif noOfOccurrences(lst[0], lst) != 1:
        return False
    else:
        return checkIfSet(lst[1:])

# b.
def distinctElements(nb, lst):
    # 							  { nb, lst = []
    # distinctElements(nb, lst) = { 1 + nb, noOfOccurrences(l1, l1, ... ln) = 1
    # 							  { distinctElements(nb, l2, ... ln) 
    if not lst:
        return nb
    if noOfOccurrences(lst[0], lst) == 1:
        nb += 1
    return distinctElements(nb, lst[1:])


List = [1, 2, 4, 5, 5, 4, 3, 2, 1, 6, 7, 7]
print(checkIfSet(List))
print(distinctElements(0, List))