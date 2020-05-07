; 3. Define a function to tests the membership of a node in a n-tree represented as (root list_of_nodes_subtree1 ... list_of_nodes_subtreen)
; Eg. tree is (a (b (c)) (d) (E (f))) and the node is "b" => true

; search_node(L: list, N: atom)
;		      { 0, L = []
; search_node(L, N) = { 1, l1 = N
;	       	      { search_node(l2..ln, N), otherwise

; sum(L: list)
;	   { 0, L = []
; sum(L) = { sum(l2..ln), l1 != number
;          { l1 + sum(l2..ln), l1 = number

(DEFUN search_node(L N)
        (COND
                ((NULL L) 0)
                ((EQUAL L N) 1)
                ((ATOM L) 0)
                (t (mapcar #'(lambda(a) (search_node a N)) L))
        )
)

(defun sum(l)
        (cond
                ((null l) 0)
                ((numberp l) l)
                ((atom l) 0)
                (t(apply '+ (mapcar #'sum l)))
        )
)

(defun check_(l e)
        (cond
                ((null l) nil)
                ((> (sum (search_node l e)) 0) 'true)
                (t 'false)
        )
)

; (print (check_ '(a (b (c)) (d) (E (f))) 'b)) -> TRUE
; (print (check_ '(a (b (c)) (d) (E (f))) 'q)) -> FALSE
