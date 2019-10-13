(import bottle)
(import chathy.route)
(import settings)
(import [os [environ]])

(defmain [&rest args]
  (setv port (int (.get environ "port" 3000)))
  (setv reloader (bool (.get environ "reloader" True)))
  (setv debug (bool (.get environ "debug" True)))
  (bottle.run :host "0.0.0.0" :port port :reloader reloader :debug debug))
