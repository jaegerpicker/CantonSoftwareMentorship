(defproject chat_server "0.1.0-SNAPSHOT"
  :description "Async websocket server example"
  :url "https://github.com/jaegerpicker/CantonSoftwareMentorship.git"
  :license {:name "Eclipse Public License"
            :url "http://www.eclipse.org/legal/epl-v10.html"}
  :dependencies [[org.clojure/clojure "1.5.1"]
  				 [org.clojure/core.async "0.1.0-SNAPSHOT"]
  				 [ring/ring-json "0.2.0"]
                 [http-kit "2.0.0"]
                 [ring/ring-devel "1.1.8"]
                 [compojure "1.1.5"]
                 [ring-cors "0.1.0"]])
