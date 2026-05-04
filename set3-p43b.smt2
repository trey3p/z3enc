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
(declare-const v1 Real)
(declare-const v2 Real)
(declare-const v3 Real)
(declare-const v4 Real)
(declare-const u1 Real)
(declare-const u2 Real)
(declare-const u3 Real)
(declare-const u4 Real)


(assert 
      (and 
        (exists ((y Real) (z Real)) (and (= (+ r (* y y)) 1) (= r (* z z))))
        (exists ((y Real) (z Real)) (and (= (+ s (* y y)) 1) (= s (* z z))))
        (forall ((rprime Real) (sprime Real))
          (and 
            (=> (exists ((y Real) (z Real)) (and (= (+ rprime (* y y)) 1) (= rprime (* z z))))
                (exists ((x Real))
                  (= (+ (* x x) (expect rprime s v1 v2 v3 v4))
                     (expect r s v1 v2 v3 v4))))
            (=> (exists ((y Real) (z Real)) (and (= (+ sprime (* y y)) 1) (= sprime (* z z))))
                (exists ((w Real))
                  (= (+ (* w w) (expect r sprime u1 u2 u3 u4))
                     (expect r s u1 u2 u3 u4))))))))
; (goals
; (goal
;   (exists ((x!0 Real) (x!1 Real))
;     (let ((a!1 (<= (+ (* (- 1.0) r) (* (- 1.0) (* x!0 x!0))) (- 1.0)))
;           (a!2 (<= (+ r (* (- 1.0) (* x!1 x!1))) 0.0)))
;       (and (<= (+ r (* x!0 x!0)) 1.0)
;            a!1
;            a!2
;            (<= (+ (* x!1 x!1) (* (- 1.0) r)) 0.0))))
;   (exists ((x!6 Real) (x!7 Real))
;     (let ((a!1 (<= (+ (* (- 1.0) s) (* (- 1.0) (* x!6 x!6))) (- 1.0)))
;           (a!2 (<= (+ s (* (- 1.0) (* x!7 x!7))) 0.0)))
;       (and (<= (+ s (* x!6 x!6)) 1.0)
;            a!1
;            a!2
;            (<= (+ (* x!7 x!7) (* (- 1.0) s)) 0.0))))
;   (not (exists ((x!12 Real) (x!13 Real))
;          (let ((a!1 (exists ((x!24 Real) (x!25 Real))
;                       (let ((a!1 (<= (+ (* (- 1.0) x!12)
;                                         (* (- 1.0) (* x!24 x!24)))
;                                      (- 1.0)))
;                             (a!2 (<= (+ x!12 (* (- 1.0) (* x!25 x!25))) 0.0)))
;                         (and (<= (+ x!12 (* x!24 x!24)) 1.0)
;                              a!1
;                              a!2
;                              (<= (+ (* x!25 x!25) (* (- 1.0) x!12)) 0.0)))))
;                (a!3 (exists ((x!16 Real) (x!17 Real))
;                       (let ((a!1 (<= (+ (* (- 1.0) x!13)
;                                         (* (- 1.0) (* x!16 x!16)))
;                                      (- 1.0)))
;                             (a!2 (<= (+ x!13 (* (- 1.0) (* x!17 x!17))) 0.0)))
;                         (and (<= (+ x!13 (* x!16 x!16)) 1.0)
;                              a!1
;                              a!2
;                              (<= (+ (* x!17 x!17) (* (- 1.0) x!13)) 0.0))))))
;          (let ((a!2 (=> a!1
;                         (exists ((x!22 Real))
;                           (let ((a!1 (* v4
;                                         (+ 1.0 (* (- 1.0) s))
;                                         (+ 1.0 (* (- 1.0) x!12))))
;                                 (a!2 (* (- 1.0) (* r v2 (+ 1.0 (* (- 1.0) s)))))
;                                 (a!3 (* (- 1.0) (* s v3 (+ 1.0 (* (- 1.0) r)))))
;                                 (a!4 (* v4
;                                         (+ 1.0 (* (- 1.0) r))
;                                         (+ 1.0 (* (- 1.0) s))))
;                                 (a!6 (* (- 1.0)
;                                         (* v2 x!12 (+ 1.0 (* (- 1.0) s)))))
;                                 (a!7 (* (- 1.0)
;                                         (* s v3 (+ 1.0 (* (- 1.0) x!12))))))
;                           (let ((a!5 (+ (* x!22 x!22)
;                                         (* s v1 x!12)
;                                         (* v2 x!12 (+ 1.0 (* (- 1.0) s)))
;                                         (* s v3 (+ 1.0 (* (- 1.0) x!12)))
;                                         a!1
;                                         (* (- 1.0) (* r s v1))
;                                         a!2
;                                         a!3
;                                         (* (- 1.0) a!4)))
;                                 (a!8 (+ (* r s v1)
;                                         (* r v2 (+ 1.0 (* (- 1.0) s)))
;                                         (* s v3 (+ 1.0 (* (- 1.0) r)))
;                                         a!4
;                                         (* (- 1.0) (* x!22 x!22))
;                                         (* (- 1.0) (* s v1 x!12))
;                                         a!6
;                                         a!7
;                                         (* (- 1.0) a!1))))
;                             (and (<= a!5 0.0) (<= a!8 0.0)))))))
;                (a!4 (=> a!3
;                         (exists ((x!14 Real))
;                           (let ((a!1 (* u4
;                                         (+ 1.0 (* (- 1.0) r))
;                                         (+ 1.0 (* (- 1.0) x!13))))
;                                 (a!2 (* (- 1.0) (* r u2 (+ 1.0 (* (- 1.0) s)))))
;                                 (a!3 (* (- 1.0) (* s u3 (+ 1.0 (* (- 1.0) r)))))
;                                 (a!4 (* u4
;                                         (+ 1.0 (* (- 1.0) r))
;                                         (+ 1.0 (* (- 1.0) s))))
;                                 (a!6 (* (- 1.0)
;                                         (* r u2 (+ 1.0 (* (- 1.0) x!13)))))
;                                 (a!7 (* (- 1.0)
;                                         (* u3 x!13 (+ 1.0 (* (- 1.0) r))))))
;                           (let ((a!5 (+ (* x!14 x!14)
;                                         (* r u1 x!13)
;                                         (* r u2 (+ 1.0 (* (- 1.0) x!13)))
;                                         (* u3 x!13 (+ 1.0 (* (- 1.0) r)))
;                                         a!1
;                                         (* (- 1.0) (* r s u1))
;                                         a!2
;                                         a!3
;                                         (* (- 1.0) a!4)))
;                                 (a!8 (+ (* r s u1)
;                                         (* r u2 (+ 1.0 (* (- 1.0) s)))
;                                         (* s u3 (+ 1.0 (* (- 1.0) r)))
;                                         a!4
;                                         (* (- 1.0) (* x!14 x!14))
;                                         (* (- 1.0) (* r u1 x!13))
;                                         a!6
;                                         a!7
;                                         (* (- 1.0) a!1))))
;                             (and (<= a!5 0.0) (<= a!8 0.0))))))))
;            (not (and a!2 a!4))))))
;   :precision precise :depth 1)


(apply qe)