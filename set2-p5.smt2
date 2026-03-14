(declare-const p Bool)
(declare-const q Bool)
(declare-const r Bool)

(assert (or q (not r)))          
(assert (or (not p) r))          
(assert (or (not q) r p))         
(assert (or p q (not q)))         
(assert (or (not r) q))          

(check-sat)
(reset-assertions)
(define-fun phi () Bool
  (and (or q (not r))
       (or (not p) r)
       (or (not q) r p)
       (or p q (not q))
       (or (not r) q)))

(define-fun psi () Bool
  (and (or q (not r))
       (or (not p) r)
       (or q (not p))
       (or r (not q))))

(assert not (= phi psi))
(check-sat)