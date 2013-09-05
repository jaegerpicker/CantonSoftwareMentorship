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