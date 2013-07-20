(ns minesweeper.core (:require [clojure.java.io :as io][clojure.string :as cstr]) (:gen-class))

(def tokenedLine (fn [line]
	(cstr/split line #"")))

(defn parse-int [s]
   (Integer. (re-find  #"\d+" s )))

(def size (fn [tLine]
	[(parse-int (nth tLine 1)) (parse-int (nth tLine 3))]))

(defn row [vLine rowNum vsize]
	(vec (drop (* rowNum (nth vsize 1)) (take (* (+ rowNum 1) (nth vsize 1)) vLine)))
	;(println (* rowNum (nth vsize 1)))
	;(println (* (+ rowNum 1) (nth vsize 1)))
	;(println (vec (drop (* rowNum (nth vsize 1)) (take (* (+ rowNum 1) (nth vsize 1)) vLine))))
	;(println vLine)
	)


(defn find-neighbors [matrix w h [x y]]
	(for [tx (range (- x 1) (+ x 2))
		  ty (range (- y 1) (+ y 2))
		  :when (and (>= tx 0)
					(>= ty 0)
					(<= tx w)
					(<= ty h)
					(not= (nth (nth matrix tx) ty) [*])
					(not= [x y] [tx ty])
					)]
		   (nth (nth matrix tx) ty)
	;[tx ty]
	))


(def parseMatrix (fn [[x y z a  & rest :as mstring] this-size]
                   (let [this-tLine (tokenedLine mstring)
                   		tLine-Count (count rest)]
                   		;(println mstring)
                   		;(println rest)
                   (vec (for [i (range (nth this-size 0))]
                   		(row rest i this-size)
                   )
                   ))))

(def solve (fn [[x y z a b & rest :as line]]
             (let [matrix (parseMatrix line (size (tokenedLine line)))
             	   this-size (size (tokenedLine line))]
             	   ;(println (nth this-size 0))
             	   (loop [i 0]
             	   	(when (< i (nth this-size 0))
             	   		;(println i)
             	   		(loop [j 0]
             	   			(when (< j (nth this-size 1))
             	   				;(println j)
             	   				(print 
             	   					(count 
             	  						(filter #{\*} (find-neighbors matrix (- (nth this-size 0) 1) (- (nth this-size 1) 1) [i j]))
             	  					)
             	  						
             	  				)
             	   				(recur (+ j 1))
             	   			)
             	   		)
             	   		(recur (+ i 1))
             	   ;(for [row (range 3)]
             	   ;	(println row)
             	   	;(
             	   	;	(print row) 
             	   	;	(for [column (range (nth this-size 1))]
             	  	;		(count 
             	  	;			(filter #{\*} (find-neighbors matrix (nth this-size 0) (nth this-size 1) [row column]))
             	  	;		)
             	  	;	)
             	  	;)
             	  	)
             	  	)

             )
             )
)

(def -main (fn [] (with-open [rdr (io/reader
                  "/Users/shawn/Documents/CantonSoftwareMentorship/ShawnCampbell-Month3-Clojure-Minesweeper/minesweeper/src/minesweeper/input.txt")]
  (doseq [line (remove empty? (line-seq rdr))] (solve line) ;(print (parseMatrix line (size (tokenedLine line)))); 
  	(println)))))



