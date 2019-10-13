(import settings)
(import re)

(setv +ARGS-PATTERN+ (re.compile "^<(.+?):(.+?)>$"))

(defmacro render [name &rest args]
  `(bottle.template ~name :static-file-host ~settings.+STATIC_FILE_HOST+ ~@args))

(defmacro defroute [method path _fn]
  (setv args (extract-args path))
  (setv uniq-name (HySymbol (+ "h_" (gensym))))
  (setv is-csrf-protect (not (or (= method "GET")
                                 (= method "HEAD")
                                 (= method "TRACE")
                                 (= method "OPTIONS"))))

  (setv decolators `((bottle.route ~path :method ~method)))
  (if is-csrf-protect
      (.append decolators 'bottle_utils.csrf.csrf_protect))
  `(with-decorator ~@decolators
    (defn ~uniq-name [~@args]
      (setv __fn ~_fn)
      (setv __args ~args)
      (eval `(__fn ~@__args)))))

(defn extract-args [fullpath]
  (lfor path (.split fullpath "/")
        :if (.match +ARGS-PATTERN+ path)
        (HySymbol (get (.match +ARGS-PATTERN+ path) 1))))

