; QGCP model=7 n=5 opts={'-m': '7', '-x': ''}
; position-variable model (alldiff)
(declare-const y_0_0 Int)
(assert (and (>= y_0_0 0) (<= y_0_0 4)))
(declare-const y_0_1 Int)
(assert (and (>= y_0_1 0) (<= y_0_1 4)))
(declare-const y_0_2 Int)
(assert (and (>= y_0_2 0) (<= y_0_2 4)))
(declare-const y_0_3 Int)
(assert (and (>= y_0_3 0) (<= y_0_3 4)))
(declare-const y_0_4 Int)
(assert (and (>= y_0_4 0) (<= y_0_4 4)))
(declare-const y_1_0 Int)
(assert (and (>= y_1_0 0) (<= y_1_0 4)))
(declare-const y_1_1 Int)
(assert (and (>= y_1_1 0) (<= y_1_1 4)))
(declare-const y_1_2 Int)
(assert (and (>= y_1_2 0) (<= y_1_2 4)))
(declare-const y_1_3 Int)
(assert (and (>= y_1_3 0) (<= y_1_3 4)))
(declare-const y_1_4 Int)
(assert (and (>= y_1_4 0) (<= y_1_4 4)))
(declare-const y_2_0 Int)
(assert (and (>= y_2_0 0) (<= y_2_0 4)))
(declare-const y_2_1 Int)
(assert (and (>= y_2_1 0) (<= y_2_1 4)))
(declare-const y_2_2 Int)
(assert (and (>= y_2_2 0) (<= y_2_2 4)))
(declare-const y_2_3 Int)
(assert (and (>= y_2_3 0) (<= y_2_3 4)))
(declare-const y_2_4 Int)
(assert (and (>= y_2_4 0) (<= y_2_4 4)))
(declare-const y_3_0 Int)
(assert (and (>= y_3_0 0) (<= y_3_0 4)))
(declare-const y_3_1 Int)
(assert (and (>= y_3_1 0) (<= y_3_1 4)))
(declare-const y_3_2 Int)
(assert (and (>= y_3_2 0) (<= y_3_2 4)))
(declare-const y_3_3 Int)
(assert (and (>= y_3_3 0) (<= y_3_3 4)))
(declare-const y_3_4 Int)
(assert (and (>= y_3_4 0) (<= y_3_4 4)))
(declare-const y_4_0 Int)
(assert (and (>= y_4_0 0) (<= y_4_0 4)))
(declare-const y_4_1 Int)
(assert (and (>= y_4_1 0) (<= y_4_1 4)))
(declare-const y_4_2 Int)
(assert (and (>= y_4_2 0) (<= y_4_2 4)))
(declare-const y_4_3 Int)
(assert (and (>= y_4_3 0) (<= y_4_3 4)))
(declare-const y_4_4 Int)
(assert (and (>= y_4_4 0) (<= y_4_4 4)))
(assert (distinct y_0_0 y_0_1 y_0_2 y_0_3 y_0_4))
(assert (distinct y_1_0 y_1_1 y_1_2 y_1_3 y_1_4))
(assert (distinct y_2_0 y_2_1 y_2_2 y_2_3 y_2_4))
(assert (distinct y_3_0 y_3_1 y_3_2 y_3_3 y_3_4))
(assert (distinct y_4_0 y_4_1 y_4_2 y_4_3 y_4_4))
(assert (distinct y_0_0 y_1_0 y_2_0 y_3_0 y_4_0))
(assert (distinct y_0_1 y_1_1 y_2_1 y_3_1 y_4_1))
(assert (distinct y_0_2 y_1_2 y_2_2 y_3_2 y_4_2))
(assert (distinct y_0_3 y_1_3 y_2_3 y_3_3 y_4_3))
(assert (distinct y_0_4 y_1_4 y_2_4 y_3_4 y_4_4))
(assert (distinct (+ y_0_0 0) (+ y_1_0 1) (+ y_2_0 2) (+ y_3_0 3) (+ y_4_0 4)))
(assert (distinct (+ y_0_1 0) (+ y_1_1 1) (+ y_2_1 2) (+ y_3_1 3) (+ y_4_1 4)))
(assert (distinct (+ y_0_2 0) (+ y_1_2 1) (+ y_2_2 2) (+ y_3_2 3) (+ y_4_2 4)))
(assert (distinct (+ y_0_3 0) (+ y_1_3 1) (+ y_2_3 2) (+ y_3_3 3) (+ y_4_3 4)))
(assert (distinct (+ y_0_4 0) (+ y_1_4 1) (+ y_2_4 2) (+ y_3_4 3) (+ y_4_4 4)))
(assert (distinct (- y_0_0 0) (- y_1_0 1) (- y_2_0 2) (- y_3_0 3) (- y_4_0 4)))
(assert (distinct (- y_0_1 0) (- y_1_1 1) (- y_2_1 2) (- y_3_1 3) (- y_4_1 4)))
(assert (distinct (- y_0_2 0) (- y_1_2 1) (- y_2_2 2) (- y_3_2 3) (- y_4_2 4)))
(assert (distinct (- y_0_3 0) (- y_1_3 1) (- y_2_3 2) (- y_3_3 3) (- y_4_3 4)))
(assert (distinct (- y_0_4 0) (- y_1_4 1) (- y_2_4 2) (- y_3_4 3) (- y_4_4 4)))
(assert (= y_0_0 0))
(assert (= y_0_1 1))
(assert (= y_0_2 2))
(assert (= y_0_3 3))
(assert (= y_0_4 4))
(check-sat)
(get-model)
(exit)