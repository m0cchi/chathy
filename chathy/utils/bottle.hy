
(defmacro render [name &rest args]
  `(bottle.template "base" :content ~name ~@args))

(defmacro defroute [method path none-arg-fn]
  (setv uniq-name (HySymbol (+ "h_" (gensym))))
  `(with-decorator (bottle.route ~path :method ~method)
    (defn ~uniq-name []
      (eval (~none-arg-fn)))))
