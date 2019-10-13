(import settings)

(defmacro render [name &rest args]
  `(bottle.template ~name :static-file-host ~settings.+STATIC_FILE_HOST+ ~@args))

(defmacro defroute [method path _fn &rest args]
  (setv uniq-name (HySymbol (+ "h_" (gensym))))
  `(with-decorator (bottle.route ~path :method ~method)
    (defn ~uniq-name [~@args]
      (setv __fn ~_fn)
      (setv __args ~args)
      (eval `(__fn ~@__args)))))
