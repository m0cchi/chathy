(import hy.models)

(defn hyrizing-dict [dictv]
  (setv retval {})
  (for [k (.keys dictv)]
    (assoc retval (hy.models.HyKeyword k) (.get dictv k)))
  retval)
