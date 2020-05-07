; 2
; a) Write a function to return the product of two vectors. 
; dot_product(l1, l2) = a1 * b1 + dot_product(a2..an, n2..bn)

(defun dot_product (a b)
    (cond 
        ((not(equal (list-length a) (list-length b))) 0)
        ((null (car a)) 0)
        (t (+ (* (car a) (car b)) (dot_product (cdr a) (cdr b))))
    )
)

(print (dot_product '(1 2 3) '(4 5 6)))
; => 1 * 4 + 2 * 5 + 3 * 6 = 32

; b) Write a function to return the depth of a list. Example: the depth of a linear list is 1.
; depth_list(list, depth) = { depth, list = []
;                           { my_max(depth_list(l1, depth + 1), depth_list(l2..ln, depth)), l1 = list
;                           { depth_list(l2..ln, depth), otherwise

(defun my_max (a b)
    (if (> a b) a b)
)

(defun depth_list (list depth)
    (cond
        ((null list) depth)
        ((listp (car list)) (my_max (depth_list (car list) (+ depth 1)) (depth_list (cdr list) depth)))
        (T (depth_list (cdr list) depth))
    )
)

(print (depth_list '(1 2 (3 (4 5 6 (7)))) 1))
; => 4

; c) Write a function to sort a linear list without keeping the double values.
; insert(list, e) = { list, l1 = e
;                   { e + list, e < l1
;                   { l1 + insert(l2..ln, e), otherwise
; sort_list(list) = { [], list = []
;                   { insert(sort_list(l2..ln), l1)

(defun insert (list e)
    (cond
        ((null list) (list e))
        ((equal (car list) e) list)
        ((< e (car list)) (cons e list))
        (T (cons (car list) (insert (cdr list) e)))
    )
)

(defun sort_list (list)
    (cond
        ((null list) nil)
        (T (insert (sort_list (cdr list)) (car list)))
    )
)

(print (sort_list '(1 4 2 2 6 6 7 6 5)))
; => (1 2 4 5 6 7)

; d) Write a function to return the intersection of two sets.
; remove_first(list, e) = { [], list = []
;                         { l2..ln, e = l1
;                         { remove_first(l2..ln, e), otherwise
;intersect(list1, list2) = { [], list1 = [] or list2 = []
;                          { l11 + intersect(l12..l1n, remove_first(l22..l2n, l11)), contains(list2, l11)
;                          { intersect(l12..l1n, list2), otherwise

(defun remove_first (list e)
    (cond 
        ((null list) nil)
        ((equal (car list) e) (cdr list))
        (T (cons (car list) (remove_first (cdr list) e)))
    )
)

(defun contains (list e)
    (cond
        ((null list) nil)
        ((equal (car list) e) T)
        (T (contains (cdr list) e))
     )
)

(defun intersect (list1 list2)
    (cond
        ((or (null list1) (null list2)) nil)
        ((contains list2 (car list1)) (cons (car list1) (intersect (cdr list1) (remove_first (cdr list2) (car list1)))))
        (T (intersect (cdr list1) list2))
    )
)

(print (intersect '(1 2 3 4 5) '(4 5 6 7 8)))
; => (4 5)
        
