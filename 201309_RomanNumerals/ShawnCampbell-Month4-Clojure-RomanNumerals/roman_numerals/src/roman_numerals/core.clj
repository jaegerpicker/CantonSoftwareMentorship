(ns roman-numerals.core (:require [clojure.java.io :as io][clojure.string :as cstr]) (:gen-class))
(def numerals {1 "I",
               4 "IV",
               5 "V",
               9 "IX",
               10 "X",
               40 "XL",
               50 "L",
               90 "XC"
               100 "C",
               400 "CD",
               500 "D",
               900 "CM",
               1000 "M"})
(defn to-roman [decimal]
  (loop [[num & r :as nums] (reverse (sort (keys numerals)))
         roman ""
         d decimal]
    (if num
      (if (>= d num)
        (recur nums (str roman (get numerals num)) (- d num))
        (recur r roman d))
      roman)))
 
(def digits (apply hash-map (mapcat reverse numerals)))
 
(defn from-roman [roman]
  (loop [[c1 c2 & r] roman
         d 0]
    (if-let [num (and c2 (get digits (str c1 c2)))]
      (recur r (+ d num))
      (if-let [num (get digits (str c1))]
        (recur (apply str c2 r) (+ d num))
        d))))
(defn solve [num] (print (to-roman num)) )


(def -main (fn [args] (with-open [rdr (io/reader args)]
  (doseq [line (remove empty? (line-seq rdr))] (solve line) 
  	(println)))))
