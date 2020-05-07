;Return the number of levels of a tree of type (1)
;(A 2 B 0 C 2 D 0 E 0)(1)

; level = current level in the traversal
; n = integer helping going from a branch to another
; mx = the  max level of the tree
; flag = 0/1 for knowing when we traverse from a branch to another

; count_levels(L: list, level: integer, n: integer, mx: integer, flag: integer)=
;      { mx, L = []
;      { count_levels(l2..ln, level, n, mx, flag), l1 != number
;      { count_levels(l2..ln, level + 1,  n - 1 + l1, max(level + 1, mx) flag), l1 != 0
;      { count_levels(l2..ln, 2, n, mx, 1),  l1 = 0, n - 1 + l1 = 1 and flag = 0
;      { count_levels(l2..ln, level, n, mx, flag), otherwise


(defun traversal(l lv n max flag)
  (cond
    ((null l) max)
    ((not(numberp (car l))) (traversal (cdr l) lv n max flag))
    ((/= (car l) 0) (traversal (cdr l) (+ 1 lvl) (+ (car l) (- n 1)) (max lv max) flag) )
    ((and (equal (car l) 0) (= ((+ (car l) (- n 1))) 1) (equal flag 0))
 		(traversal (cdr l) 2 (+ (car l) (- n 1)) max 1) )
    (t (traversal (cdr l) lv (+ (car l) n)  max flag))
  )
)


(print (traversal '(A 2 B 0 C 2 D 0 E 0) 1 1 0 0))
(print (traversal '(a 2 b 2 c 0 d 2 e 0 f 0 g 2 h 0 i 0 ) 1 1 0 0))
(print (traversal '(a 2 b 2 c 0 d 2 e 0 f 1 x 0 g 2 h 0 i 0 ) 1 1 0 0))
