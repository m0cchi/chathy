(import bottle)

(defn static_resources [path]
  (bottle.static_file path :root "./resources/statics/"))

