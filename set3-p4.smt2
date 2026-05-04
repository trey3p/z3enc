(define-fun expect ((r Real) (s Real) (v1 Real) (v2 Real) (v3 Real) (v4 Real)) Real

    (+ (* r (* s v1))
        (+ 
            (* r (* (- 1 s) v2))
            (+ (* (- 1 r) (* s v3))
             (* (- 1 r) (* (- 1 s) v4))
        )
    )
  )
  )


(declare-const r Real)
(declare-const s Real)


; (assert (exists ((y Real) (z Real)) (and (= (+ r (* y y)) 1) (= r (* z z)))))

; (assert (exists ((y Real) (z Real)) (and (= (+ s (* y y)) 1) (= s (* z z)))))

; (assert (forall ((rprime Real) (sprime Real)) (exists ((x Real) (w Real))
;      (and 
;         (=> (exists ((y Real) (z Real)) (and (= (+ rprime (* y y)) 1) (= rprime (* z z))))
;              (= 
;             (+ (* x x) (expect rprime s 90 20 30 60))
;             (expect r s 90 20 30 60))
;         )
;         (=> 
;             (exists ((y Real) (z Real)) (and (= (+ sprime (* y y)) 1) (= sprime (* z z))))
;             (= 
;             (+ (* w w) (expect r sprime 10 80 70 40))
;             (expect r s 10 80 70 40))
;         )
;     )
; )))


(assert (and (<= 0 r) (<= r 1)))
(assert (and (<= 0 s) (<= s 1)))

(assert (forall ((rprime Real) (sprime Real))
  (and
    (=> (and (<= 0 rprime) (<= rprime 1))
        (<= (expect rprime s 90 20 30 60)
            (expect r     s 90 20 30 60)))
    (=> (and (<= 0 sprime) (<= sprime 1))
        (<= (expect r sprime 10 80 70 40)
            (expect r s     10 80 70 40))))))

(check-sat)
(get-model)
