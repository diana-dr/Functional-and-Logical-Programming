; 3. Return the number of levels of a tree of type (1).
; (A 2 B 0 C 2 D 0 E 0) -> 3

; level = current level in the traversal
; n = integer helping going from a branch to another
; mx = the  max level of the tree
; flag = 0/1 for knowing when we traverse from a branch to another

; count_levels(L: list, level: integer, n: integer, mx: integer, flag: integer)=
;      { mx, L = []
;      { count_levels(l2..ln, level, n, mx, flag), l1 != number
;      { count_levels(l2..ln, level + 1,  n - 1 + l1, max(level + 1, mx), flag), l1 != 0
;      { count_levels(l2..ln, 2, n, mx, 1),  l1 = 0, n = 2 and flag = 0
;      { count_levels(l2..ln, level, n, mx, flag), otherwise


(defun count_levels(l level n mx flag)
  (cond
    ((null l) mx)
    ((not (numberp (car l))) (count_levels (cdr l) level n mx flag))
    ((/= (car l) 0) (setq n (+ (car l) (- n 1))) (count_levels (cdr l) (+ 1 level) n (max level mx) flag))
    ((and (equal (car l) 0) (= (setq n (+ (car l) (- n 1))) 1) (equal flag 0)) (count_levels (cdr l) 2 n mx 1))
    (t (setq n (+ (car l) n)) (count_levels (cdr l) level n mx flag))
  )
)

; (print (count_levels '(a 2 b 0 c 2 d 0 e 0) 1 1 0 0)) -> 2
; (print (count_levels '(a 2 b 0 c 2 d 2 e 0 f 0 g 0) 1 1 0 0)) -> 3
; (print (count_levels '(a 2 b 2 c 2 d 2 e 0 f 0 g 0 h 1 i 0) 1 1 0 0)) -> 5
