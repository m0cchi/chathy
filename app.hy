(import bottle)
(import chathy.route)
(import settings)
(import [os [environ]])

(defmain [&rest args]
  (setv port (int (.get environ "PORT" 3000)))
  (setv reloader (bool (.get environ "RELOADER" True)))
  (setv debug (bool (.get environ "DEBUG" True)))
  (bottle.run :host "0.0.0.0" :port port :reloader reloader :debug debug))
