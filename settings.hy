(import bottle)
(import [os [environ]])

(setv app (bottle.default_app))

(setv bottle.TEMPLATE_PATH ["./resources/templates/"])
(setv +STATIC_FILE_HOST+ (.get environ "STATIC_FILE_HOST" ""))

(.update (.config app)
         {
          ;; csrf
          ;; https://bottle-utils.readthedocs.io/en/latest/csrf.html#app-configuration
          "csrf.secret" (.get environ "CSRF_SECRET" "secret")
          "csrf.token_name" "XGuffTUH"
          "csrf.path" "/"
          "expires" 600
          })
