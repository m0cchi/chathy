(import bottle)
(import [bottle_utils.csrf [generate_csrf_token]])
(require [chathy.utils.bottle [render]])

(defn top []
  (print "-----")
  (print "-----")
  (print "-----")
  (print  (generate_csrf_token))
  (render "top" :token (generate_csrf_token)))
