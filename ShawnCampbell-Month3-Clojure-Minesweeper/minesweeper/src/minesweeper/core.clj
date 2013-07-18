(ns minesweeper.core (:require [clojure.java.io :as io][clojure.string :as cstr :only (split)]) (:gen-class))

(def tokenedLine (fn [line]
	(cstr/split line #"")))

(defn parse-int [s]
   (Integer. (re-find  #"\d+" s )))

(def size (fn [tLine]
	[(parse-int (nth tLine 1)) (parse-int (nth tLine 3))]))

(defn row [vLine rowNum vsize]
	(vec (drop (* rowNum (nth vsize 1)) (take (* (+ rowNum 1) (nth vsize 1)) vLine)))
	;(println rowNum)
	;(println (nth vsize 1))
	;(println vLine)
	)


(defn find-neighbors [matrix w h [x y]]
	(for [tx (range (- x 1) (+ x 2))
		  ty (range (- y 1) (+ y 2))
		  :when (and (>= tx 0)
					(>= ty 0)
					(<= tx w)
					(<= ty h)
					(not= [tx ty] "*")
					(not= [x y] [tx ty])
					)]
	[tx ty]))


(def parseMatrix (fn [[x y z a b & rest :as mstring] this-size]
                   (let [this-tLine (tokenedLine mstring)
                   		tLine-Count (count rest)]
                   (vec (for [i (range (nth this-size 0))]
                   		(row rest i this-size)
                   )
                   ))))

(def solve (fn [[x y z a b & rest :as line]]
             (let [matrix (parseMatrix line (size (tokenedLine line)))
             	   this-size (size (tokenedLine line))]
             	   ;(println this-size)
             	;(println matrix)
             	(println (nth this-size 0))
             	(println (range (nth this-size 0)))
             	(for [h (range (nth this-size 0))]
             		[h]
             		;((println h) (for [w (range (nth this-size 1))]
             			;(println (nth (nth matrix h) w))
             		;	(println (find-neighbors matrix (nth this-size 1) (nth this-size 0) [w h]))))
             		)

             )
             )
)

(def -main (fn [] (with-open [rdr (io/reader
                  "/Users/shawn/Documents/CantonSoftwareMentorship/ShawnCampbell-Month3-Clojure-Minesweeper/minesweeper/src/minesweeper/input.txt")]
  (doseq [line (line-seq rdr)] (solve line)))))