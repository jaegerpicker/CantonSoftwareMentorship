(ns minesweeper.core (:require [clojure.java.io :as io]) )

(def *matrix* (ref []))

(def parseMatrix (fn [mstring]
                   ))

(def solve (fn [line]
             (println line)))

(with-open [rdr (io/reader
                  "/Users/shawn/Documents/CantonSoftwareMentorship/ShawnCampbell-Month3-Clojure-Minesweeper/minesweeper/src/minesweeper/input.txt")]
  (doseq [line (line-seq rdr)] (solve line)))