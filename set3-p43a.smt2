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



; (assert 
;   (not (forall ((v1 Real) (v2 Real) (v3 Real) (v4 Real)
;            (u1 Real) (u2 Real) (u3 Real) (u4 Real))
;     (exists ((r Real) (s Real))
;       (and 
;         (exists ((y Real) (z Real)) (and (= (+ r (* y y)) 1) (= r (* z z))))
;         (exists ((y Real) (z Real)) (and (= (+ s (* y y)) 1) (= s (* z z))))
;         (forall ((rprime Real) (sprime Real))
;           (and 
;             (=> (exists ((y Real) (z Real)) (and (= (+ rprime (* y y)) 1) (= rprime (* z z))))
;                 (exists ((x Real))
;                   (= (+ (* x x) (expect rprime s v1 v2 v3 v4))
;                      (expect r s v1 v2 v3 v4))))
;             (=> (exists ((y Real) (z Real)) (and (= (+ sprime (* y y)) 1) (= sprime (* z z))))
;                 (exists ((w Real))
;                   (= (+ (* w w) (expect r sprime u1 u2 u3 u4))
;                      (expect r s u1 u2 u3 u4)))))))))))

(assert (not 
  (forall ((v1 Real) (v2 Real) (v3 Real) (v4 Real)
           (u1 Real) (u2 Real) (u3 Real) (u4 Real))
    (exists ((r Real) (s Real))
      (and 
        (<= 0 r) (<= r 1)
        (<= 0 s) (<= s 1)
        (forall ((rprime Real))
          (=> (and (<= 0 rprime) (<= rprime 1))
              (<= (expect rprime s v1 v2 v3 v4)
                  (expect r      s v1 v2 v3 v4))))
        (forall ((sprime Real))
          (=> (and (<= 0 sprime) (<= sprime 1))
              (<= (expect r sprime u1 u2 u3 u4)
                  (expect r s u1 u2 u3 u4)))))))))

(check-sat)

