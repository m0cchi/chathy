
(import bottle)
(import bottle_utils.csrf)
(import [chathy.handler.api.message :as api-message])
(import [chathy.handler.webpage.top :as webpage-top])
(import [chathy.handler.webpage.common :as webpage-common])
(require [chathy.utils.bottle [defroute]])
;; router file

;(print (macroexpand-1 '(defroute "GET" "/" webpage.top)))
;(print (macroexpand-1 '(defroute "GET" "/_/<path:path>" webpage-common.static_resources)))
(print (macroexpand-1 '(defroute "POST" "/api/message" api-message.set)))
(defroute "GET" "/" webpage-top.top)
(defroute "GET" "/_/<filepath:path>" webpage-common.static_resources)
(defroute "POST" "/api/message" api-message.set)
