(import bottle)
(import [os [environ]])

(setv bottle.TEMPLATE_PATH ["./resources/templates/"])
(setv +STATIC_FILE_HOST+ (.get environ "STATIC_FILE_HOST" ""))
