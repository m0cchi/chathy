
(import bottle)
(import [chathy.handler.webpage.top :as webpage-top])
(require [chathy.utils.bottle [defroute]])
;; router file

;(print (macroexpand-1 '(defroute "GET" "/" webpage.top)))
(defroute "GET" "/" webpage-top.top)

