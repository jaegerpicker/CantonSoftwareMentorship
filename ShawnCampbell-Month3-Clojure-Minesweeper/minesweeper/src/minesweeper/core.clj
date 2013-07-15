(ns minesweeper.core (:require [clojure.java.io :as io][clojure.string :as cstr :only (split)]) (:gen-class))

(def tokenedLine (fn [line]
	(cstr/split line #"")))

(defn parse-int [s]
   (Integer. (re-find  #"\d+" s )))

(def size (fn [tLine]
	[(parse-int (nth tLine 1)) (parse-int (nth tLine 3))]))

(defn row [vLine rowNum vsize]
	(drop (* rowNum (nth vsize 1)) (take (nth vsize 1) vLine)))


(def parseMatrix (fn [mstring]
                   (let [this-tLine (tokenedLine mstring)
                   		this-size (size (tokenedLine mstring))]
                   (println (row 
                   		(drop 5 (take 
                   			(- (count this-tLine) 4) 
                   			this-tLine))
                   		0
                   		this-size
                   	)
                   )
                   ;(println this-size)
                   )
                   ))

(def solve (fn [line]
             (parseMatrix line)))

(def -main (fn [] (with-open [rdr (io/reader
                  "/Users/shawn/Documents/CantonSoftwareMentorship/ShawnCampbell-Month3-Clojure-Minesweeper/minesweeper/src/minesweeper/input.txt")]
  (doseq [line (line-seq rdr)] (solve line)))))