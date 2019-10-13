
(import bottle)
(import [chathy.handler.webpage.top :as webpage-top])
(import [chathy.handler.webpage.common :as webpage-common])
(require [chathy.utils.bottle [defroute]])
;; router file

;(print (macroexpand-1 '(defroute "GET" "/" webpage.top)))
;(print (macroexpand-1 '(defroute "GET" "/_/<path:path>" webpage-common.static_resources)))
(defroute "GET" "/" webpage-top.top)
(defroute "GET" "/_/<filepath:path>" webpage-common.static_resources filepath)
