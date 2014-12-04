(ns bob
  (:require [clojure.string :as str]))

(def whatever "Whatever.")
(def chill "Whoa, chill out!")
(def silence "Fine. Be that way!")
(def sure "Sure.")

(defn is-yelling? [comment]
  (let [nonum (str/replace comment #"[\d\?\!\.\,\ ]+" "")]
    (and (not (empty? nonum))
         (= (str/upper-case nonum) nonum))))

(defn is-question? [comment]
  (= (last comment) \?))

(defn response-for [comment]
  (let [sentence (str/trim comment)]
    (cond (empty? sentence) silence
          (is-yelling? sentence) chill
          (is-question? comment) sure
          :else whatever)))
